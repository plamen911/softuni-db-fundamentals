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

    public boolean doDelete(Class<E> table, String where) throws Exception {
        String tableName = this.getTableName(table);
        if (!this.checkIfTableExists(tableName)) {
            throw new Exception("Table doesn't exist!");
        }

        String query = "DELETE FROM " + tableName + " WHERE " + where;
        return this.connection.prepareStatement(query).execute();
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

        if (!this.checkIfTableExists(tableName)) {
            this.doCreate(entity.getClass());
        }

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

    private Map<String, String> getFieldsAndValues(E entity) throws IllegalAccessException, SQLException {
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

                if (!this.checkIfFieldExistsInDatabase(entity.getClass(), field)) {
                    this.doAlter(entity.getClass(), field);
                }
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

    private  <E> boolean doCreate(Class entity) throws SQLException {
        String tableName = this.getTableName(entity);
        String query = "CREATE TABLE " + tableName + " (";
        String columns = "";

        Field[] fields = entity.getDeclaredFields();

        for (int i = 0; i < fields.length; i++) {
            Field field = fields[i];
            field.setAccessible(true);

            if (field.isAnnotationPresent(Id.class)) {
                columns += "`" + field.getAnnotation(Column.class).name() + "` INT(11) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT";
            } else {
                columns += "`" + field.getAnnotation(Column.class).name() + "` " + this.getDbType(field);
            }

            if (i < fields.length - 1) {
                columns += ", ";
            }
        }

        query += columns + ")";

        return connection.prepareStatement(query).execute();
    }

    private String getDbType(Field field) {
        switch (field.getType().getSimpleName()) {
            case "Integer":
            case "int":
                return "INT(11)";
            case "String":
                return "VARCHAR(50)";
            case "Date":
                return "DATETIME DEFAULT NULL";
        }

        return "";
    }

    private boolean checkIfTableExists(String tableName) throws SQLException {
        String query = "SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema='orm_db' AND TABLE_NAME='" + tableName + "'";
        ResultSet rs = this.connection.prepareStatement(query).executeQuery();
        return rs.next();
    }

    private <E> void doAlter(Class entity, Field field) throws SQLException {
        String tableName = this.getTableName(entity);
        field.setAccessible(true);
        String fieldName = field.getAnnotation(Column.class).name();
        String query = "ALTER TABLE " + tableName + " ADD `" + fieldName + "` " + this.getDbType(field);
        this.connection.prepareStatement(query).execute();
    }

    private boolean checkIfFieldExistsInDatabase(Class entity, Field field) throws SQLException {
        String tableName = this.getTableName(entity);
        field.setAccessible(true);
        String fieldName = field.getAnnotation(Column.class).name();
        String query = "SELECT COLUMN_NAME " +
                "FROM information_schema.COLUMNS " +
                "WHERE TABLE_SCHEMA = 'orm_db' " +
                "AND TABLE_NAME = '" + tableName + "' " +
                "AND COLUMN_NAME = '" + fieldName + "'";
        ResultSet rs = this.connection.prepareStatement(query).executeQuery();
        return rs.next();
    }
}










