package org.banka.ws.service;

import org.banka.ws.model.enumeration.ResponseStatusNaloga;
import org.banka.ws.oxm.NalogZaPlacanjeRequest;
import org.banka.ws.oxm.ProveraStanjaRequest;
import org.banka.ws.oxm.ProveraStanjaResponse;

public interface KlijentService {

	/**
	 * 
	 * @param racunDuznika
	 * @param racunPoverioca
	 * @param iznos
	 * @return
	 */
	public ResponseStatusNaloga proveraKlijentBanke(String racunDuznika,
			String racunPoverioca, Double iznos);

	/**
	 * 
	 * @param proveraStanjaRequest
	 * @return
	 */
	public ProveraStanjaResponse proveraStanjaKlijenta(
			ProveraStanjaRequest proveraStanjaRequest);

	/**
	 * 
	 * @param nalogZaPlacanjeRequest
	 */
	public void prenosSredstavaUnutarBanke(
			NalogZaPlacanjeRequest nalogZaPlacanjeRequest);
}
