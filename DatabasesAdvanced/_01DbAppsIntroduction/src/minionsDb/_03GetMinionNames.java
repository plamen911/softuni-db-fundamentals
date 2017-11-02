package minionsDb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class _03GetMinionNames {
    public static void main(String[] args) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.printf("Villain ID: ");
        int villainId = Integer.parseInt(reader.readLine());

        Connection connection = DbConnect.connect();

        PreparedStatement stmt = connection.prepareStatement("SELECT * FROM villains WHERE id = ?");
        stmt.setInt(1, villainId);
        ResultSet rs = stmt.executeQuery();
        if (!rs.isBeforeFirst()) {
            System.out.printf("No villain with ID %d exists in the database.%n", villainId);
        } else {
            rs.next();
            System.out.printf("Villain: %s%n", rs.getString("name"));

            PreparedStatement stmtMinions = connection.prepareStatement("SELECT m.`name` AS `name`, m.age AS age " +
                    "FROM minions AS m " +
                    "LEFT JOIN `minions_villains` AS mv ON (mv.minion_id = m.id) " +
                    "WHERE mv.villain_id = ?");
            stmtMinions.setInt(1, villainId);
            rs = stmtMinions.executeQuery();
            if (!rs.isBeforeFirst()) {
                System.out.printf("<no minions>%n");
            } else {
                int i = 0;
                while (rs.next()) {
                    System.out.printf("%d. %s %d%n", ++i, rs.getString("name"), rs.getInt("age"));
                }
            }
        }

        connection.close();
    }
}
