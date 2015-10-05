package org.banka.ws.endpoint;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.banka.ws.oxm.ProveraStanjaRequest;
import org.banka.ws.oxm.ProveraStanjaResponse;
import org.banka.ws.service.KlijentService;
import org.springframework.ws.server.endpoint.annotation.Endpoint;
import org.springframework.ws.server.endpoint.annotation.PayloadRoot;
import org.springframework.ws.server.endpoint.annotation.RequestPayload;
import org.springframework.ws.server.endpoint.annotation.ResponsePayload;

@Endpoint
public class ProveraStanjaEndpoint {

	protected static Logger logger = Logger.getLogger("ProveraStanjaEndpoint");

	@Resource(name = "klijentService")
	private KlijentService klijentService;

	public static final String NAMESPACE_URI = "http://ws.banka.org/ws/schema/proveraStanja";

	public static final String REQUEST_LOCAL_NAME = "proveraStanjaRequest";

	@PayloadRoot(localPart = REQUEST_LOCAL_NAME, namespace = NAMESPACE_URI)
	@ResponsePayload
	public ProveraStanjaResponse proveraStanja(
			@RequestPayload ProveraStanjaRequest proveraStanjaRequest) {

		ProveraStanjaResponse response = new ProveraStanjaResponse();

		try {
			logger.info("ProveraStanjaRequest primljen.");

			response = klijentService
					.proveraStanjaKlijenta(proveraStanjaRequest);
			try {
				logger.info("Delegirano servisu");
			} catch (Exception e) {
				logger.error("Nije moguce obraditi nalog za proveru stanja.");
				response.setStatus("NOK");
				return response;
			}
		} catch (Exception e) {
			logger.error("Problem with proveraStanjaRequest");
			response.setStatus("NOK");
			return response;
		}

		return response;
	}
}
