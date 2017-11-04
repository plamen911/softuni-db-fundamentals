package orm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class Connector {
    public static Connection getConnection(String username, String password, String dbName) throws SQLException {
        Properties props = new Properties();
        props.setProperty("user", username);
        props.setProperty("password", password);
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbName, props);
    }
}
