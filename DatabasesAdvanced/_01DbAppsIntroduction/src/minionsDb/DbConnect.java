package minionsDb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class DbConnect {
    private static final String DB_HOST = "127.0.0.1";
    private static final String DB_PORT = "3306";
    private static final String DB_NAME = "minions";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "Mitkov4069";

    public static Connection connect() throws SQLException {
        Properties props = new Properties();
        props.setProperty("user", DB_USERNAME);
        props.setProperty("password", DB_PASSWORD);
        return DriverManager.getConnection("jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME, props);
    }
}
