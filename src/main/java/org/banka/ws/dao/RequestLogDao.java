package org.banka.ws.dao;

import org.banka.ws.model.RequestLog;
import org.springframework.data.repository.CrudRepository;

public interface RequestLogDao extends CrudRepository<RequestLog, Long> {

}
