package jersey.ws;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import jersey.factory.ClientFactoryDB;
import jersey.model.Client;
import jersey.model.ClientLite;

@Path("/")
public class ClientResource {

	@Path("clients")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Client> getClientNames() {
		ClientFactoryDB clientFactory = new ClientFactoryDB();
		List<Client> clients = clientFactory.findAll();
		return clients;
	}

	@Path("clients/{id}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Client getClient(@PathParam(value = "id") int id) {
		ClientFactoryDB clientFactory = new ClientFactoryDB();
		return clientFactory.findById(id);
	}

	@Path("clients")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public void saveClient(List<ClientLite> clients) {
		ClientFactoryDB clientFactory = new ClientFactoryDB();
		for (ClientLite cl : clients) {
			clientFactory.save(cl.toClient());
		}
	}

	@Path("clients/{num_client}")
	@DELETE
	@Consumes(MediaType.APPLICATION_JSON)
	public void removeClient(@PathParam(value = "num_client") String numClient) {
		ClientFactoryDB clientFactory = new ClientFactoryDB();
		Client client = clientFactory.findByNumClient(numClient);
		System.out.println("delete " + numClient);
		clientFactory.remove(client);
	}
}
