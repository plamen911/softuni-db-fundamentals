package _02YourOwnRetievalApplication;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

/**
 * Created by Plamen Markov on 10/25/17.
 */
public class Main {
    public static void main(String[] args) throws IOException, SQLException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        System.out.print("Database Username: ");
        String dbUserName = reader.readLine().trim();

        System.out.print("Database Password: ");
        String dbPassword = reader.readLine().trim();

        System.out.print("Player Username: ");
        String userName = reader.readLine().trim();

        Properties props = new Properties();
        props.setProperty("user", dbUserName);
        props.setProperty("password", dbPassword);

        Connection connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/diablo", props);

        PreparedStatement stmt = connection.prepareStatement("SELECT CONCAT(u.first_name, ' ', u.last_name) AS full_name, COUNT(*) AS games " +
                "FROM users AS u " +
                "LEFT JOIN users_games AS g ON (g.user_id = u.id) " +
                "WHERE u.user_name LIKE ?");
        stmt.setString(1, userName);
        ResultSet rs = stmt.executeQuery();
        rs.next();
        if (null == rs.getString("full_name")) {
            System.out.println("No such user exists");
        } else {
            System.out.printf("User: %s%n", userName);
            System.out.printf("%s has played %d games%n", rs.getString("full_name"), rs.getInt("games"));
        }
    }
}
