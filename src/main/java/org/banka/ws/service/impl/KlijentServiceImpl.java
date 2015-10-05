package org.banka.ws.service.impl;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.banka.ws.dao.KlijentDao;
import org.banka.ws.dao.NalogZaPlacanjeDao;
import org.banka.ws.model.Klijent;
import org.banka.ws.model.NalogZaPlacanje;
import org.banka.ws.model.enumeration.ResponseStatusNaloga;
import org.banka.ws.model.enumeration.StatusNaloga;
import org.banka.ws.oxm.NalogZaPlacanjeRequest;
import org.banka.ws.oxm.ProveraStanjaRequest;
import org.banka.ws.oxm.ProveraStanjaResponse;
import org.banka.ws.service.KlijentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("klijentService")
@Transactional
public class KlijentServiceImpl implements KlijentService {

	private final KlijentDao klijentDao;
	private final NalogZaPlacanjeDao nalogZaPlacanjeDao;

	@Autowired
	private KlijentServiceImpl(KlijentDao klijentDao,
			NalogZaPlacanjeDao nalogZaPlacanjeDao) {
		super();
		this.klijentDao = klijentDao;
		this.nalogZaPlacanjeDao = nalogZaPlacanjeDao;
	}

	@Override
	public ResponseStatusNaloga proveraKlijentBanke(String racunDuznika,
			String racunPoverioca, Double iznos) {

		// provera da li je racun duznika OK
		Klijent duznik = klijentDao.findByBrojRacuna(racunDuznika);
		if (duznik == null) {
			// racun duznika ne postoji
			return ResponseStatusNaloga.NOK1;
		}

		String kodBankeDuznika = StringUtils.substring(racunDuznika, 0, 3);
		String kodBankePoverioca = StringUtils.substring(racunPoverioca, 0, 3);
		Klijent poverioc = klijentDao.findByBrojRacuna(racunDuznika);
		// provera da li je racun poverioca OK
		if (poverioc == null && kodBankeDuznika.equals(kodBankePoverioca)) {
			// racun poverioca ne postoji u istoj banci gde je i racun duznika
			return ResponseStatusNaloga.NOK2;
		}

		// provera da li je iznos na nalogu veci od raspolozivih sredstava na
		// racun duznika
		Double rezervisanaSredstva = klijentDao.getRezervisanaSredstva(duznik
				.getBrojRacuna());
		if (NumberUtils.compare(iznos
				+ (rezervisanaSredstva == null ? 0L : rezervisanaSredstva),
				duznik.getTrenutnoStanje()) == 1) {
			// iznos na nalogu je veci od raspolozivih sredstava na racunu
			// duznika
			return ResponseStatusNaloga.NOK3;
		}

		if (poverioc != null && kodBankeDuznika.equals(kodBankePoverioca)) {
			// racun poverioca je u istoj banci kao i racun duznika
			return ResponseStatusNaloga.OK3;
		}

		return ResponseStatusNaloga.OK;
	}

	@Override
	public ProveraStanjaResponse proveraStanjaKlijenta(
			ProveraStanjaRequest proveraStanjaRequest) {

		ProveraStanjaResponse response = new ProveraStanjaResponse();

		Klijent duznik = klijentDao.findByBrojRacuna(proveraStanjaRequest
				.getBrojRacuna());
		if (duznik == null) {
			// racun duznika ne postoji
			response.setStatus(ResponseStatusNaloga.NOK1.getStatus());
			return response;
		}

		response.setBrojRacuna(duznik.getBrojRacuna());
		response.setNaziv(duznik.getNaziv());
		response.setStatus(duznik.getTrenutniStatus());
		response.setTrenutnoStanje(duznik.getTrenutnoStanje());
		response.setRezervisanaSredstva(klijentDao
				.getRezervisanaSredstva(duznik.getBrojRacuna()));

		return response;
	}

	@Override
	@Transactional(readOnly = false)
	public void prenosSredstavaUnutarBanke(
			NalogZaPlacanjeRequest nalogZaPlacanjeRequest) {
		Klijent duznik = klijentDao.findByBrojRacuna(nalogZaPlacanjeRequest
				.getRacunDuznika());
		Klijent poverioc = klijentDao.findByBrojRacuna(nalogZaPlacanjeRequest
				.getRacunPoverioca());

		duznik.setTrenutnoStanje(duznik.getTrenutnoStanje()
				- nalogZaPlacanjeRequest.getIznos());
		poverioc.setTrenutnoStanje(poverioc.getTrenutnoStanje()
				+ nalogZaPlacanjeRequest.getIznos());

		NalogZaPlacanje nalogZaPlacanje = nalogZaPlacanjeDao
				.findByID(nalogZaPlacanjeRequest.getID());
		nalogZaPlacanje.setStatusNaloga(StatusNaloga.PLACENO.toString());
	}

}
