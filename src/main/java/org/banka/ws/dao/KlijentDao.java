package org.banka.ws.dao;

import org.banka.ws.model.Klijent;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface KlijentDao extends CrudRepository<Klijent, Long> {

	@Query("SELECT k FROM Klijent k WHERE k.brojRacuna = :brojRacuna")
	public Klijent findByBrojRacuna(@Param("brojRacuna") String brojRacuna);

	@Query("SELECT SUM(n.iznos) FROM NalogZaPlacanje n WHERE n.racunDuznika = :brojRacuna AND statusNaloga = 'REZERVISANO'")
	public Double getRezervisanaSredstva(@Param("brojRacuna") String brojRacuna);

}
