package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class StateChangeLog implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public StateChangeLog() {
	}

	private int changeId;

	private String orderId;

	private String changeTime;

	private String event;

	public int getChangeId() {
		return changeId;
	}

	public void setChangeId(int changeId) {
		this.changeId = changeId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getChangeTime() {
		return changeTime;
	}

	public void setChangeTime(String changeTime) {
		this.changeTime = changeTime;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}
	

}