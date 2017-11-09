import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _09IncreaseSalaries {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT e FROM Employee e " +
                "WHERE e.department.id IN (?, ?, ?, ?) " +
                "ORDER BY e.firstName, e.lastName, e.salary";
        List<Employee> resultList = em.createQuery(query)
                .setParameter(0, 1)
                .setParameter(1, 2)
                .setParameter(2, 4)
                .setParameter(3, 11)
                .getResultList();
        for (Employee employee : resultList) {
            employee.setSalary(employee.getSalary().multiply(new BigDecimal(1.12)));
            System.out.printf("%s %s ($%.2f)%n",
                    employee.getFirstName(),
                    employee.getLastName(),
                    employee.getSalary());
        }

        em.getTransaction().commit();
    }
}
