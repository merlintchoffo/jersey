package jersey.factory;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import jersey.manager.Main;
import jersey.model.Client;

public class ClientFactoryDB {

	private static EntityManagerFactory emf;

	public ClientFactoryDB() {
		emf = Persistence.createEntityManagerFactory(Main.PERSISTENCE_UNIT_NAME);
	}

	// operations de CRUD
	@SuppressWarnings("unchecked")
	public List<Client> findAll() {
		EntityManager em = emf.createEntityManager();
		Query q = em.createQuery("select t from Client t");
		List<Client> clients = q.getResultList();
		em.close();
		return clients;
	}

	public Client findById(int idClient) {
		EntityManager em = emf.createEntityManager();
		Client client = em.find(Client.class, idClient);
		em.close();
		return client;
	}

	public Client findByNumClient(String numClient) {
		EntityManager em = emf.createEntityManager();
		Query q = em.createQuery("select t from Client t where t.numClient = :pNumClient")
				.setParameter("pNumClient", numClient);
		List<Client> clients = q.getResultList();
		em.close();
		
		if(!clients.isEmpty()){
			return clients.get(0);
		}
		throw new IllegalArgumentException("Client not found for the given numClient" + numClient);
	}

	public boolean save(Client client) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(client);
		em.getTransaction().commit();
		em.close();
		return true;
	}

	public boolean update(Client client) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.merge(client);
		em.getTransaction().commit();
		em.close();
		return false;
	}

	public boolean remove(Client client) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		Client mergeClt = em.merge(client);
		em.remove(mergeClt);
		em.getTransaction().commit();
		em.close();
		return true;
	}

}
