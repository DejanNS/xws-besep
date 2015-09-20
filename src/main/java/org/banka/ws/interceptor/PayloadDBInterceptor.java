package org.banka.ws.interceptor;

import java.io.ByteArrayOutputStream;

import org.banka.ws.service.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ws.context.MessageContext;
import org.springframework.ws.server.EndpointInterceptor;

@Service("payloadDBINterceptor")
public class PayloadDBInterceptor implements EndpointInterceptor {

	private final DBService dbService;

	@Autowired
	public PayloadDBInterceptor(DBService dbService) {
		super();
		this.dbService = dbService;
	}

	@Override
	public boolean handleFault(MessageContext arg0, Object arg1)
			throws Exception {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean handleRequest(MessageContext messageContext, Object endpoint)
			throws Exception {
		System.out.println("test request logging from interceptor: ");
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		messageContext.getRequest().writeTo(bos);

		System.out.println(bos.toString("UTF-8"));
		dbService.saveRequestToDb(bos.toString("UTF-8"));

		return true;
	}

	@Override
	public boolean handleResponse(MessageContext messageContext, Object endpoint)
			throws Exception {
		System.out.println("test response logging from interceptor: ");
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		messageContext.getRequest().writeTo(bos);

		System.out.println(bos.toString("UTF-8"));
		dbService.saveRequestToDb(bos.toString("UTF-8"));

		return true;
	}



}
