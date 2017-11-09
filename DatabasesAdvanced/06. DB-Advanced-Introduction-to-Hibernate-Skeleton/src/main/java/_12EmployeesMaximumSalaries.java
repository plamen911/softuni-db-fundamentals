import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _12EmployeesMaximumSalaries {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        List<Object[]> resultList = em.createQuery("select e, max(e.salary) as max_salary " +
                "from Employee e " +
                "group by e.department.id " +
                "order by e.department.id")
                .getResultList();

        for (Object[] objects : resultList) {
            Employee employee = (Employee) objects[0];
            BigDecimal maxSalary = (BigDecimal) objects[1];
            if (maxSalary.compareTo(new BigDecimal(30000)) < 0 || maxSalary.compareTo(new BigDecimal(70000)) > 0) {
                System.out.printf("%s - %.2f%n", employee.getDepartment().getName(), maxSalary);
            }
        }

        em.getTransaction().commit();
    }
}
