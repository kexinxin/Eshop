package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.Log;

/**
 * 
 */
public interface LogMapper {

    /**
     * @return
     */
    public List<Log> getLogList();

    /**
     * @param log 
     * @return
     */
    public void insertLog(Log log);
    
    public void delectLogByUserName(String username);

}