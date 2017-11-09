import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _05EmployeesFromDepartment {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT e FROM Employee e WHERE e.department.id = ? ORDER BY e.salary, e.id";
        List<Employee> resultList = em.createQuery(query)
                .setParameter(0, 6)
                .getResultList();

        for (Employee employee : resultList) {
            System.out.printf("%s %s from %s - $%.2f%n",
                    employee.getFirstName(),
                    employee.getLastName(),
                    employee.getDepartment().getName(),
                    employee.getSalary());
        }

        em.getTransaction().commit();
    }
}
