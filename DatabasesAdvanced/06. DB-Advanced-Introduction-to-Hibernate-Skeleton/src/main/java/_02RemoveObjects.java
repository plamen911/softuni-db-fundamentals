import entities.Town;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _02RemoveObjects {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT t FROM Town t WHERE LENGTH(t.name) > 5";
        List<Town> townList = em.createQuery(query).getResultList();

        for (Town town : townList) {
            em.detach(town);
            town.setName(town.getName().toLowerCase());
            em.merge(town);
        }

        em.getTransaction().commit();
    }
}
