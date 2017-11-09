import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _04EmployeesWithSalaryOver50000 {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT e FROM Employee e WHERE e.salary > 50000";
        List<Employee> resultList = em.createQuery(query)
                .getResultList();
        for (Employee employee : resultList) {
            System.out.println(employee.getFirstName());
        }

        em.getTransaction().commit();
    }
}
