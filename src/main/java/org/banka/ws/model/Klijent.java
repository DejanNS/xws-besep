package org.banka.ws.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "klijent")
public class Klijent extends AbstractBaseEntity {

	private static final long serialVersionUID = 1L;

	private String naziv;
	private String brojRacuna;
	private Double trenutnoStanje;
	private String trenutniStatus;

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getBrojRacuna() {
		return brojRacuna;
	}

	public void setBrojRacuna(String brojRacuna) {
		this.brojRacuna = brojRacuna;
	}

	public Double getTrenutnoStanje() {
		return trenutnoStanje;
	}

	public void setTrenutnoStanje(Double trenutnoStanje) {
		this.trenutnoStanje = trenutnoStanje;
	}

	public String getTrenutniStatus() {
		return trenutniStatus;
	}

	public void setTrenutniStatus(String trenutniStatus) {
		this.trenutniStatus = trenutniStatus;
	}
}
