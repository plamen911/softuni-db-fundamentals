package minionsDb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class _04AddMinion {
    private static Connection connection;

    public static void main(String[] args) throws SQLException, IOException {
        connection = DbConnect.connect();

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String[] minionFields = reader.readLine().trim().split("\\s+");
        String[] villainFields = reader.readLine().trim().split("\\s+");

        ResultSet rsMinion = createMinion(minionFields);
        ResultSet rsVillain = createVillain(villainFields);
        setVillainServant(rsVillain, rsMinion);
    }

    private static void setVillainServant(ResultSet rsVillain, ResultSet rsMinion) throws SQLException {
        String SQL_INSERT = "INSERT INTO minions_villains (`minion_id`, villain_id) VALUES (?, ?)";
        PreparedStatement stmtInsert = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
        stmtInsert.setInt(1, rsMinion.getInt("id"));
        stmtInsert.setInt(2, rsVillain.getInt("id"));

        int affectedRows = stmtInsert.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException(String.format("Setting added %s to be minion of %s failed, no rows affected.%n",
                    rsMinion.getString("name"), rsVillain.getString("name")));
        }

        System.out.printf("Successfully added %s to be minion of %s.%n", rsMinion.getString("name"), rsVillain.getString("name"));
    }

    private static ResultSet createVillain(String[] fields) throws SQLException {
        String name = fields[1];
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM villains WHERE name LIKE ?");
        stmt.setString(1, name);
        ResultSet rs = stmt.executeQuery();
        if (!rs.isBeforeFirst()) {
            // insert villain
            String SQL_INSERT = "INSERT INTO villains (`name`, evilness) VALUES (?, ?)";
            PreparedStatement stmtInsert = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            stmtInsert.setString(1, name);
            stmtInsert.setString(2, "evil");

            int affectedRows = stmtInsert.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating villain failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmtInsert.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    System.out.printf("Villain %s was added to the database.%n", name);

                    int id = generatedKeys.getInt(1);

                    PreparedStatement stmtSelect = connection.prepareStatement("SELECT * FROM villains WHERE id = ?");
                    stmtSelect.setInt(1, id);
                    rs = stmtSelect.executeQuery();
                    rs.next();

                    return rs;
                }
                else {
                    throw new SQLException("Creating villain failed, no ID obtained.");
                }
            }

        } else {
            rs.next();
            return rs;
        }
    }

    private static ResultSet createMinion(String[] fields) throws SQLException {
        String name = fields[1];
        int age = Integer.parseInt(fields[2]);
        StringBuilder sb = new StringBuilder();
        for (int i = 3; i < fields.length; i++) {
            sb.append(fields[i]).append(" ");
        }
        String town = sb.toString().trim();
        ResultSet rsTown = createTown(town);

        String SQL_INSERT = "INSERT INTO minions (`name`, age, town_id) VALUES (?, ?, ?)";
        PreparedStatement stmtInsert = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
        stmtInsert.setString(1, name);
        stmtInsert.setInt(2, age);
        stmtInsert.setInt(3, rsTown.getInt("id"));

        int affectedRows = stmtInsert.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Creating minion failed, no rows affected.");
        }

        try (ResultSet generatedKeys = stmtInsert.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                System.out.printf("Minion %s was added to the database.%n", name);

                int id = generatedKeys.getInt(1);

                PreparedStatement stmtSelect = connection.prepareStatement("SELECT * FROM minions WHERE id = ?");
                stmtSelect.setInt(1, id);
                ResultSet rs = stmtSelect.executeQuery();
                rs.next();

                return rs;
            }
            else {
                throw new SQLException("Creating minion failed, no ID obtained.");
            }
        }
    }

    private static ResultSet createTown(String name) throws SQLException {
        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM towns WHERE name LIKE ?");
        stmt.setString(1, name);
        ResultSet rs = stmt.executeQuery();
        if (!rs.isBeforeFirst()) {
            // insert town
            String SQL_INSERT = "INSERT INTO towns (`name`) VALUES (?)";
            PreparedStatement stmtInsert = connection.prepareStatement(SQL_INSERT, Statement.RETURN_GENERATED_KEYS);
            stmtInsert.setString(1, name);

            int affectedRows = stmtInsert.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating town failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmtInsert.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    System.out.printf("Town %s was added to the database.%n", name);

                    int id = generatedKeys.getInt(1);

                    PreparedStatement stmtSelect = connection.prepareStatement("SELECT * FROM towns WHERE id = ?");
                    stmtSelect.setInt(1, id);
                    rs = stmtSelect.executeQuery();
                    rs.next();

                    return rs;
                }
                else {
                    throw new SQLException("Creating town failed, no ID obtained.");
                }
            }

        } else {
            rs.next();
            return rs;
        }
    }
}
