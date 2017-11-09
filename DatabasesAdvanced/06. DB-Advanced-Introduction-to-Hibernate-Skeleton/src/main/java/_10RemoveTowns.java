import entities.Address;
import entities.Employee;
import entities.Town;

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
public class _10RemoveTowns {
    public static void main(String[] args) throws IOException {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Enter town name: ");
        String townName = reader.readLine().trim();

        String query = "SELECT a FROM Address a WHERE a.town.name LIKE :townName";
        List<Address> resultList = em.createQuery(query)
                .setParameter("townName", townName)
                .getResultList();

        System.out.printf("%d address in %s deleted%n", resultList.size(), townName);

        for (Address address : resultList) {
            List<Employee> employeeList = em.createQuery("SELECT e FROM Employee e WHERE e.address.text LIKE :address")
                    .setParameter("address", address.getText())
                    .getResultList();
            for (Employee employee : employeeList) {
                employee.setAddress(null);
            }
            em.remove(address);
        }

        Town town = (Town) em.createQuery("SELECT t FROM Town t WHERE t.name LIKE :townName")
                .setParameter("townName", townName)
                .getSingleResult();
        em.remove(town);

        em.getTransaction().commit();
    }
}
