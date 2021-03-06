package jersey.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//import lombok.Data;
import lombok.Getter;
import lombok.Setter;

//@XmlRootElement
/*-- annotation Lombok https://projectlombok.org/. 
@see doc ==> https://projectlombok.org/features/all */

//@Builder
//@Data
@Entity
@Table(name = "client")
public class Client {

	@Id
	@Column(name = "ID_CLIENT")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int idClient;
	
	@Getter @Setter
	String nom;
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "NUM_CLIENT")
	@Getter @Setter
	String numClient;
	@Getter @Setter
	String prenom;
	@Getter @Setter
	int sexe;
	@Column(name = "CODE_POSTAL")
	@Getter @Setter
	String codePostal;
	@Getter @Setter
	String adresse;
	@Getter @Setter
	String login;
	@Getter @Setter
	String password;

	public Client() {
		// TODO Auto-generated constructor stub
	}

	public Client(String nom) {
		this.nom = nom;
	}

//	public String getNom() {
//		return nom;
//	}
//
//	public void setNom(String nom) {
//		this.nom = nom;
//	}
//
//	public String getNumClient() {
//		return numClient;
//	}
//
//	public void setNumClient(String numClient) {
//		this.numClient = numClient;
//	}
//
//	public String getPrenom() {
//		return prenom;
//	}
//
//	public void setPrenom(String prenom) {
//		this.prenom = prenom;
//	}
//
//	public int getSexe() {
//		return sexe;
//	}
//
//	public void setSexe(int sexe) {
//		this.sexe = sexe;
//	}
//
//	public String getCodePostal() {
//		return codePostal;
//	}
//
//	public void setCodePostal(String codePostal) {
//		this.codePostal = codePostal;
//	}
//
//	public String getAdresse() {
//		return adresse;
//	}
//
//	public void setAdresse(String adresse) {
//		this.adresse = adresse;
//	}
//
//	public String getLogin() {
//		return login;
//	}
//
//	public void setLogin(String login) {
//		this.login = login;
//	}
//
//	public int getIdClient() {
//		return idClient;
//	}
//
//	public void setIdClient(int idClient) {
//		this.idClient = idClient;
//	}
//
//	public String getPassword() {
//		return password;
//	}
//
//	public void setPassword(String password) {
//		this.password = password;
//	}
}
