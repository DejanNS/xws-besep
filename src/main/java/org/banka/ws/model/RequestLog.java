package org.banka.ws.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "request_log")
public class RequestLog extends AbstractBaseEntity {

	private static final long serialVersionUID = 2412183828541120701L;

	private String request;

	public RequestLog(String request) {
		super();
		this.request = request;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

}
