package org.csu.eshop.service;
import java.util.List;

import org.csu.eshop.domain.Log;
import org.csu.eshop.domain.StateChangeLog;
import org.csu.eshop.persistence.LogMapper;
import org.csu.eshop.persistence.StateChangeLogMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class LogService {
	  ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
    
	  private LogMapper logMapper=appContext
			  .getBean(LogMapper.class);
	  private StateChangeLogMapper stateChangeLogMapper=appContext
			  .getBean(StateChangeLogMapper.class);
	  
	  
    public List<Log> getLogList() {
        return logMapper.getLogList();
    }

    
    public void insertLog(Log log) {
        logMapper.insertLog(log);
    }

    
    public List<StateChangeLog> getStateChangeLogList() {
        
        return stateChangeLogMapper.getStateChangeLogList();
    }

    
    public void insertStateChangeLog(StateChangeLog stateChangeLog) {
        stateChangeLogMapper.insertStateChangeLog(stateChangeLog);
    }
    public void delectStateChangeLogByOrderId(String orderId){
    	stateChangeLogMapper.delectStateChangeLogByOrderId(orderId);
    }
    public void delectLogByUserName(String username){
    	logMapper.delectLogByUserName(username);
    }

}