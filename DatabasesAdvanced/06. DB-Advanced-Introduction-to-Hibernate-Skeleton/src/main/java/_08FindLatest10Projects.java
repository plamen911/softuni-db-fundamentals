import entities.Project;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.Comparator;
import java.util.List;

/**
 * Created by Plamen Markov on 11/9/17.
 */
public class _08FindLatest10Projects {
    public static void main(String[] args) {
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("soft_uni");
        EntityManager em = factory.createEntityManager();

        em.getTransaction().begin();

        String query = "SELECT p FROM Project p ORDER BY p.startDate DESC";
        List<Project> resultList = em.createQuery(query)
                .setMaxResults(10)
                .getResultList();

        resultList.stream()
                .sorted(Comparator.comparing(Project::getName))
                .forEach(p -> {
                    System.out.printf("Project name: %s%n", p.getName());
                    System.out.printf("\tProject Description: %s%n", p.getDescription());
                    System.out.printf("\tProject Start Date:%s%n", p.getStartDate());
                    System.out.printf("\tProject End Date: %s%n", p.getEndDate());
                });

        em.getTransaction().commit();
    }
}
