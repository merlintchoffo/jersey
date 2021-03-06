package jersey.manager;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import jersey.model.Client;

public class Main {

	public static final String PERSISTENCE_UNIT_NAME = "ges_client_unit";
	private static EntityManagerFactory factory;

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {
		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		EntityManager em = factory.createEntityManager();
		// read the existing entries and write to console
		Query q = em.createQuery("select t from Client t");
		List<Client> todoList = q.getResultList();
		for (Client todo : todoList) {
			System.out.println(todo);
		}
		System.out.println("Size: " + todoList.size());

		// create new todo
		em.getTransaction().begin();
		Client todo = new Client("MerlinEnchanteur");
		em.persist(todo);
		em.getTransaction().commit();

		em.close();
	}

}
