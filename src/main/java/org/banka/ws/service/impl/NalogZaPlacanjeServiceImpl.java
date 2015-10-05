package org.banka.ws.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.banka.ws.dao.NalogZaPlacanjeDao;
import org.banka.ws.model.NalogZaPlacanje;
import org.banka.ws.model.enumeration.StatusNaloga;
import org.banka.ws.oxm.NalogZaPlacanjeRequest;
import org.banka.ws.oxm.NalogZaPlacanjeResponse;
import org.banka.ws.service.NalogZaPlacanjeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("nalogZaPlacanjeService")
@Transactional
public class NalogZaPlacanjeServiceImpl implements NalogZaPlacanjeService {

	protected static Logger logger = Logger
			.getLogger(NalogZaPlacanjeService.class);

	private final Map<String, NalogZaPlacanjeRequest> naloziZaPlacanje = new HashMap<String, NalogZaPlacanjeRequest>();

	private final NalogZaPlacanjeDao nalogZaPlacanjeDao;

	@Autowired
	public NalogZaPlacanjeServiceImpl(NalogZaPlacanjeDao nalogZaPlacanjeDao) {
		this.nalogZaPlacanjeDao = nalogZaPlacanjeDao;
	}

	@Override
	@Transactional(readOnly = false)
	public NalogZaPlacanjeResponse snimiNalog(NalogZaPlacanjeRequest request) {
		if (naloziZaPlacanje.get(request.getID()) != null) {
			logger.error("Nalog je vec primljen i upisan u mapu");
			throw new RuntimeException("Nalog je vec primljen i upisan u mapu");
		}

		logger.info("Nalog je uspesno obradjen i upisan u mapu");
		naloziZaPlacanje.put(request.getID(), request);

		nalogZaPlacanjeDao.save(transform(request));

		NalogZaPlacanjeResponse response = new NalogZaPlacanjeResponse();
		response.setStatus("OK");
		response.setOpis("NalogZaPlacanjeRequest je sacuvan u bazi.");

		return response;
	}

	private NalogZaPlacanje transform(NalogZaPlacanjeRequest request) {
		NalogZaPlacanje nalogZaPlacanje = new NalogZaPlacanje();
		nalogZaPlacanje.setIdNaloga(request.getID());
		nalogZaPlacanje.setDuznik(request.getDuznik());
		nalogZaPlacanje.setSvrhaPlacanja(request.getSvrhaPlacanja());
		nalogZaPlacanje.setPrimalac(request.getPrimalac());
		nalogZaPlacanje.setDatumNaloga(request.getDatumNaloga());
		nalogZaPlacanje.setDatumValute(request.getDatumValute());
		nalogZaPlacanje.setRacunDuznika(request.getRacunDuznika());
		nalogZaPlacanje.setModelZaduzenja(request.getModelZaduzenja());
		nalogZaPlacanje.setPozivNaBrojZaduzenja(request
				.getPozivNaBrojZaduzenja());
		nalogZaPlacanje.setRacunPoverioca(request.getRacunPoverioca());
		nalogZaPlacanje.setModelOdobrenja(request.getModelOdobrenja());
		nalogZaPlacanje.setPozivNaBrojOdobrenja(request
				.getPozivNaBrojOdobrenja());
		nalogZaPlacanje.setIznos(request.getIznos());
		nalogZaPlacanje.setOznakaValute(request.getOznakaValute());
		nalogZaPlacanje.setHitno(request.getHitno());
		nalogZaPlacanje.setStatusNaloga(StatusNaloga.REZERVISANO.toString());

		return nalogZaPlacanje;
	}
}
