package orm;

import annotations.Column;
import annotations.Entity;
import annotations.Id;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class EntityManager<E> implements DbContext<E> {
    private Connection connection;

    public EntityManager(Connection connection) {
        this.connection = connection;
    }

    public boolean persist(E entity) throws IllegalAccessException, SQLException {
        Field primary = this.getId(entity.getClass());
        primary.setAccessible(true);
        Object value = primary.get(entity);

        if (value == null || (int) value <= 0) {
            return this.doInsert(entity, primary);
        }

        return this.doUpdate(entity, primary);
    }

    public Iterable<E> find(Class<E> table) throws IllegalAccessException, SQLException, InstantiationException {
        return this.find(table, null);
    }

    public Iterable<E> find(Class<E> table, String where) throws SQLException, IllegalAccessException, InstantiationException {
        String query = "SELECT * FROM " + this.getTableName(table) + " WHERE 1 " + (where != null ? " AND " + where : "");
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        List<E> result = new ArrayList<>();
        while (rs.next()) {
            E entity = table.newInstance();
            this.fillEntity(table, rs, entity);
            result.add(entity);
        }

        return result;
    }

    public E findFirst(Class<E> table) throws IllegalAccessException, SQLException, InstantiationException {
        return findFirst(table, null);
    }

    public E findFirst(Class<E> table, String where) throws SQLException, IllegalAccessException, InstantiationException {
        String query = "SELECT * FROM " + this.getTableName(table) + " WHERE 1 " + (where != null ? " AND " + where : "") + " LIMIT 1";
        Statement stmt = connection.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        rs.next();
        E entity = table.newInstance();
        this.fillEntity(table, rs, entity);
        return entity;
    }

    private void fillEntity(Class<E> table, ResultSet rs, E entity) throws SQLException, IllegalAccessException {
        Field[] fields = table.getDeclaredFields();
        for (Field currentField : fields) {
            currentField.setAccessible(true);
            String name = currentField.getAnnotation(Column.class).name();
            this.fillField(currentField, rs, name, entity);
        }
    }

    private void fillField(Field field, ResultSet rs, String name, E entity) throws SQLException, IllegalAccessException {
        if (field.getType() == Integer.class || field.getType() == int.class) {
            field.set(entity, rs.getInt(name));
        } else if (field.getType() == Long.class || field.getType() == long.class) {
            field.set(entity, rs.getLong(name));
        } else if (field.getType() == String.class) {
            field.set(entity, rs.getString(name));
        } else if (field.getType() == Date.class) {
            field.set(entity, rs.getDate(name));
        }
    }

    private Field getId(Class entity) {
        return Arrays.stream(entity.getDeclaredFields())
                .filter(field -> field.isAnnotationPresent(Id.class))
                .findFirst()
                .orElseThrow(() -> new UnsupportedOperationException("Entity does not have primary key"));
    }

    private boolean doUpdate(E entity, Field primary) throws SQLException, IllegalAccessException {
        String tableName = this.getTableName(entity.getClass());
        StringBuilder query = new StringBuilder("UPDATE " + tableName + " SET ");
        StringBuilder whereCondition = new StringBuilder();

        for (Map.Entry<String, String> entry : this.getFieldsAndValues(entity).entrySet()) {
            if (!primary.getName().equals(entry.getKey().replace("`", ""))) {
                query.append(entry.getKey()).append("=").append(entry.getValue()).append(",");
            } else {
                whereCondition.append(" WHERE ").append(entry.getKey()).append("=").append(entry.getValue());
            }
        }
        query = new StringBuilder(query.substring(0, query.length() - 1));
        query.append(whereCondition);

        return connection.prepareStatement(query.toString()).execute();
    }

    private boolean doInsert(E entity, Field primary) throws SQLException, IllegalAccessException {
        String tableName = this.getTableName(entity.getClass());
        StringBuilder queryKeys = new StringBuilder();
        StringBuilder queryValues = new StringBuilder();

        for (Map.Entry<String, String> entry : this.getFieldsAndValues(entity).entrySet()) {
            if (!primary.getName().equals(entry.getKey().replace("`", ""))) {
                queryKeys.append(entry.getKey()).append(",");
                queryValues.append(entry.getValue()).append(",");
            }
        }
        queryKeys = new StringBuilder(queryKeys.substring(0, queryKeys.length() - 1));
        queryValues = new StringBuilder(queryValues.substring(0, queryValues.length() - 1));

        String query = "INSERT INTO " + tableName + " (" + queryKeys + ") VALUES (" + queryValues + ")";

        return connection.prepareStatement(query).execute();
    }

    private Map<String, String> getFieldsAndValues(E entity) throws IllegalAccessException {
        Map<String, String> myMap = new HashMap<>();

        for (Field field : entity.getClass().getDeclaredFields()) {
            if (field.isAnnotationPresent(Column.class)) {
                field.setAccessible(true);
                String value = "";
                if (field.get(entity) instanceof Date) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-dd");
                    value += sdf.format(field.get(entity));
                } else {
                    value += field.get(entity).toString();
                }
                value = "'" + value + "'";
                String key = "`" + field.getAnnotation(Column.class).name() + "`";
                myMap.put(key, value);
            }
        }

        return myMap;
    }

    private String getTableName(Class<?> aClass) {
        if (aClass.isAnnotationPresent(Entity.class)) {
            return aClass.getAnnotation(Entity.class).name();
        }

        return aClass.getSimpleName().toLowerCase();
    }
}
