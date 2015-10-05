package org.banka.ws.model.enumeration;

public enum ResponseStatusNaloga {
	OK("OK", "Nalog je OK"), 
	OK1("OK", "Nalog primljen i obradjen."), 
	OK2("OK", "Nalog je primljen i bice procesiran."), 
	OK3("OK", "Racun duznika i racun poverioca su u istoj banci."), 
	NOK1("NOK",	"Nalog ne moze biti izvrsen, pogresan broj racuna duznika."), 
	NOK2("NOK",	"Nalog ne moze biti izvrsen, pogresan broj racuna poverioca."), 
	NOK3("NOK",	"Nalog ne moze biti izvrsen, nemate dovoljno sredstava na racunu");

	private String status;
	private String razlog;

	private ResponseStatusNaloga(String status, String razlog) {
		this.status = status;
		this.razlog = razlog;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRazlog() {
		return razlog;
	}

	public void setRazlog(String razlog) {
		this.razlog = razlog;
	}
}
