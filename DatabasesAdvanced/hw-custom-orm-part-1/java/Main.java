import entities.User;
import orm.Connector;
import orm.EntityManager;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

/**
 * Created by Plamen Markov on 10/30/17.
 */
public class Main {
    public static void main(String[] args) throws IOException, SQLException, IllegalAccessException, InstantiationException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("DB Username: ");
        String username = reader.readLine().trim();
        System.out.print("DB Password: ");
        String password = reader.readLine().trim();
        System.out.print("DB Name: ");
        String dbName = reader.readLine().trim();

        Connection connection = Connector.getConnection(username, password, dbName);
        EntityManager<User> em = new EntityManager<>(connection);

//        User usr = new User("pesho", "897", 32, new Date());
//        em.persist(usr);

        // User foundUser = em.findFirst(User.class, "age > 20");
        // User foundUser = em.findFirst(User.class);
        // System.out.println(foundUser.getUsername());

        List<User> users = (List<User>)em.find(User.class);
        for (User user : users) {
            System.out.println(user.getUsername());
        }
    }
}
