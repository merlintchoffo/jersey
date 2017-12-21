package jersey.model;

public class ClientLite {

	String nom;
	String prenom;
	String numClient;

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNumClient() {
		return numClient;
	}

	public void setNumClient(String numClient) {
		this.numClient = numClient;
	}

	/**
	 * Methode permet de transformer les CLientLite en Client afin d'enregistrer en
	 * DB
	 * 
	 * @return
	 */
	public Client toClient() {
		Client cl = new Client();
		cl.setNom(nom);
		cl.setPrenom(prenom);
		cl.setNumClient(numClient);
		return cl;
	}

}
