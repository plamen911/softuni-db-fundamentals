package minionsDb;

import java.io.IOException;
import java.sql.*;

/**
 * Created by Plamen Markov on 10/27/17.
 */
public class _02GetVillainsNames {
    public static void main(String[] args) throws IOException, SQLException {
        Connection connection = DbConnect.connect();

        PreparedStatement stmt = connection.prepareStatement("SELECT v.name AS villain_name, COUNT(mv.minion_id) AS minion_number " +
                "FROM villains AS v " +
                "LEFT JOIN minions_villains AS mv ON (mv.villain_id = v.id) " +
                "GROUP BY mv.villain_id " +
                "HAVING minion_number > ? " +
                "ORDER BY minion_number DESC");
        stmt.setInt(1, 3);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            System.out.printf("%s %d%n", rs.getString("villain_name"), rs.getInt("minion_number"));
        }

        connection.close();
    }
}
