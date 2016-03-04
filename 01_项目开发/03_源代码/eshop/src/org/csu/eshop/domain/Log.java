package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class Log implements Serializable{

	
	private static final long serialVersionUID = 1L;

	public Log() {
	}
	
	private String logId;
	
	private String username;

	private String event;

	private String time;
	
	

	public String getLogId() {
		return logId;
	}

	public void setLogId(String logId) {
		this.logId = logId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
}