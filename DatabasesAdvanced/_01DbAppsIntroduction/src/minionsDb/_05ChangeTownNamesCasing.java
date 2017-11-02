package minionsDb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class _05ChangeTownNamesCasing {
    private static Connection connection;

    public static void main(String[] args) throws SQLException, IOException {
        connection = DbConnect.connect();

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String country = reader.readLine().trim();

        try {
            String SQL_UPDATE = "UPDATE towns SET `name` = UPPER(`name`) WHERE country LIKE ?";
            PreparedStatement stmt = connection.prepareStatement(SQL_UPDATE);
            stmt.setString(1, country);

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("No town names were affected.%n");
            } else {
                System.out.printf("%d town names were affected.%n", affectedRows);

                String SQL_SELECT = "SELECT * FROM towns WHERE country LIKE ?";
                PreparedStatement stmtSelect = connection.prepareStatement(SQL_SELECT);
                stmtSelect.setString(1, country);
                ResultSet rs = stmtSelect.executeQuery();
                List<String> townNames = new ArrayList<>();
                while (rs.next()) {
                    townNames.add(rs.getString("name"));
                }
                System.out.printf("%s%n", townNames);
            }

        } catch (SQLException ex) {
            System.out.printf("%s%n", ex.getMessage());
        }
    }
}
