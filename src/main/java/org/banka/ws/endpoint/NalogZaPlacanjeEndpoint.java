package org.banka.ws.endpoint;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.banka.ws.model.enumeration.ResponseStatusNaloga;
import org.banka.ws.oxm.NalogZaPlacanjeRequest;
import org.banka.ws.oxm.NalogZaPlacanjeResponse;
import org.banka.ws.service.KlijentService;
import org.banka.ws.service.NalogZaPlacanjeService;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

@Endpoint
public class NalogZaPlacanjeEndpoint {

	protected static Logger logger = Logger
			.getLogger("NalogZaPlacanjeEndpoint");

	@Resource(name = "nalogZaPlacanjeService")
	private NalogZaPlacanjeService nalogZaPlacanjeService;

	@Resource(name = "klijentService")
	private KlijentService klijentService;

	public static final String NAMESPACE_URI = "http://ws.banka.org/ws/schema/nalogZaPlacanje";

	public static final String REQUEST_LOCAL_NAME = "nalogZaPlacanjeRequest";

	@PayloadRoot(localPart = REQUEST_LOCAL_NAME, namespace = NAMESPACE_URI)
	@ResponsePayload
	public NalogZaPlacanjeResponse obradiNalogZaPlacanje(
			@RequestPayload NalogZaPlacanjeRequest nalogZaPlacanjeRequest) {

		NalogZaPlacanjeResponse response = new NalogZaPlacanjeResponse();

		try {
			logger.info("NalogZaPlacanjeRequest primljen.");

			try {
				logger.info("Delegirano servisu");

				ResponseStatusNaloga statusNaloga = klijentService
						.proveraKlijentBanke(
								nalogZaPlacanjeRequest.getRacunDuznika(),
								nalogZaPlacanjeRequest.getRacunPoverioca(),
								nalogZaPlacanjeRequest.getIznos());

				if (statusNaloga.getStatus().startsWith("OK")) {
					// obrada naloga i prenos sredstava unutar banke
					response = nalogZaPlacanjeService
							.snimiNalog(nalogZaPlacanjeRequest);

					if (statusNaloga.equals(ResponseStatusNaloga.OK3)) {
						klijentService
						.prenosSredstavaUnutarBanke(nalogZaPlacanjeRequest);
					}
				} else {
					response.setStatus(statusNaloga.getStatus());
					response.setOpis(statusNaloga.getRazlog());
					return response;
				}

			} catch (Exception e) {
				logger.error("Nije moguce obraditi nalog");

				response.setStatus("NOK");
				response.setOpis("Nije moguce obraditi nalog");

				return response;
			}

		} catch (Exception e) {
			logger.error("Problem with nalogZaPlacanje request");

			response.setStatus("NOK");
			response.setOpis("Problem with nalogZaPlacanje request");

			return response;
		}

		return response;
	}
}
