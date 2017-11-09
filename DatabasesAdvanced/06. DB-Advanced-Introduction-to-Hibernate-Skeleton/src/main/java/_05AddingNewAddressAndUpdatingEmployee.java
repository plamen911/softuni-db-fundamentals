import entities.Address;
import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _05AddingNewAddressAndUpdatingEmployee {
    public static void main(String[] args) throws IOException {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        Address newAddress = new Address();
        newAddress.setText("Vitoshka 15");
        em.persist(newAddress);

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Enter employee last name: ");
        String lastName = reader.readLine().trim();

        String query = "SELECT e FROM Employee e WHERE e.lastName LIKE :last_name";
        Employee employee = (Employee) em.createQuery(query)
                .setParameter("last_name", lastName)
                .setMaxResults(1)
                .getSingleResult();

        employee.setAddress(newAddress);

        em.getTransaction().commit();
    }
}
