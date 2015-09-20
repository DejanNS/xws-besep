package org.banka.ws.service.impl;

import org.banka.ws.dao.RequestLogDao;
import org.banka.ws.model.RequestLog;
import org.banka.ws.service.DBService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("dbService")
@Transactional
public class DBServiceImpl implements DBService {

	private final RequestLogDao requestLogDao;

	@Autowired
	public DBServiceImpl(RequestLogDao requestLogDao) {
		super();
		this.requestLogDao = requestLogDao;
	}

	@Override
	public void saveRequestToDb(String rawXMLRequest) {

		if(rawXMLRequest != null) {
			requestLogDao.save(new RequestLog(rawXMLRequest));
		}
	} 

}
