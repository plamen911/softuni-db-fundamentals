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
public class _11FindEmployeesByFirstName {
    public static void main(String[] args) throws IOException {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        System.out.print("Enter employee first name: ");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        String firstName = reader.readLine().trim();

        List<Employee> resultList = em.createQuery("SELECT e FROM Employee e " +
                "WHERE e.firstName LIKE :firstName ORDER BY e.id")
                .setParameter("firstName", firstName + "%")
                .getResultList();

        for (Employee employee : resultList) {
            System.out.printf("%s %s - %s - ($%.2f)%n", employee.getFirstName(),
                    employee.getLastName(),
                    employee.getJobTitle(),
                    employee.getSalary());
        }

        em.getTransaction().commit();
    }
}
