import entities.Employee;
import entities.Project;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Comparator;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _07GetEmployeeWithProject {
    public static void main(String[] args) throws IOException {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        System.out.print("Enter employee id: ");
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        int employeeId = Integer.valueOf(reader.readLine());

        String query = "SELECT e FROM Employee e WHERE e.id = :id";
        Employee employee = (Employee) em.createQuery(query)
                .setParameter("id", employeeId)
                .getSingleResult();

        System.out.printf("%s %s - %s%n", employee.getFirstName(),
                employee.getLastName(),
                employee.getJobTitle());

        employee.getProjects()
                .stream()
                .sorted(Comparator.comparing(Project::getName))
                .forEach(p -> System.out.println("\t" + p.getName()));

        em.getTransaction().commit();
    }
}
