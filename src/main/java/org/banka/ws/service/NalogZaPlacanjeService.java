package org.banka.ws.service;

import org.banka.ws.oxm.NalogZaPlacanjeRequest;
import org.banka.ws.oxm.NalogZaPlacanjeResponse;

public interface NalogZaPlacanjeService {

	/**
	 * 
	 * @param request
	 * @return
	 */
	public NalogZaPlacanjeResponse snimiNalog(NalogZaPlacanjeRequest request);
}
