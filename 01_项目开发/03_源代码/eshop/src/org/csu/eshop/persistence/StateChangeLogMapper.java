package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.StateChangeLog;

/**
 * 
 */
public interface StateChangeLogMapper {

    /**
     * @return
     */
    public List<StateChangeLog> getStateChangeLogList();

    /**
     * @param stateChangeLog 
     * @return
     */
    public void insertStateChangeLog(StateChangeLog stateChangeLog);
    
    public void delectStateChangeLogByOrderId(String orderId);

}