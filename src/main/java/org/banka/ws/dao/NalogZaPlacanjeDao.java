package org.banka.ws.dao;

import org.banka.ws.model.NalogZaPlacanje;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface NalogZaPlacanjeDao extends
CrudRepository<NalogZaPlacanje, Long> {

	@Query("SELECT nzp FROM NalogZaPlacanje nzp WHERE nzp.idNaloga = :ID")
	public NalogZaPlacanje findByID(@Param("ID") String ID);

}
