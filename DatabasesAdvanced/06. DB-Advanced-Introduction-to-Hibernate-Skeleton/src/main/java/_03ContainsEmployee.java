import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _03ContainsEmployee {
    public static void main(String[] args) throws IOException {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Enter employee name: ");
        String[] input = reader.readLine().trim().split("\\s+");
        String firstName = (input.length > 1) ? input[0] : "";
        String lastName = (input.length > 1) ? input[1] : "";

        String query = "SELECT e FROM Employee e WHERE e.firstName LIKE ? AND e.lastName LIKE ?";
        List<Employee> employeeList = em.createQuery(query)
                .setParameter(0, firstName)
                .setParameter(1, lastName)
                .getResultList();

        System.out.printf("%s%n", (employeeList.isEmpty()) ? "No" : "Yes");

        em.getTransaction().commit();
    }
}
