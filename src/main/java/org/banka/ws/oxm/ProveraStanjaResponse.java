package org.banka.ws.oxm;

public class ProveraStanjaResponse {

	private String brojRacuna;
	private String naziv;
	private String status;
	private Double trenutnoStanje;
	private Double rezervisanaSredstva;

	public String getBrojRacuna() {
		return brojRacuna;
	}

	public void setBrojRacuna(String brojRacuna) {
		this.brojRacuna = brojRacuna;
	}

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Double getTrenutnoStanje() {
		return trenutnoStanje;
	}

	public void setTrenutnoStanje(Double trenutnoStanje) {
		this.trenutnoStanje = trenutnoStanje;
	}

	public Double getRezervisanaSredstva() {
		return rezervisanaSredstva;
	}

	public void setRezervisanaSredstva(Double rezervisanaSredstva) {
		this.rezervisanaSredstva = rezervisanaSredstva;
	}
}
