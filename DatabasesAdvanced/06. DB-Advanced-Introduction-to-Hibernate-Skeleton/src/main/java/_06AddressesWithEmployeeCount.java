import entities.Address;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _06AddressesWithEmployeeCount {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT a FROM Address a " +
                "ORDER BY a.employees.size DESC, a.town.id ASC";
        List<Address> resultList = em.createQuery(query)
                .setMaxResults(10)
                .getResultList();

        for (Address address : resultList) {
            System.out.printf("%s, %s - %d employees%n", address.getText(),
                    address.getTown().getName(),
                    address.getEmployees().size());
        }

        em.getTransaction().commit();
    }
}
