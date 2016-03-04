package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class SaveItem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -760032101541102072L;

	public SaveItem() {
	}

	private int saveItemId;

	private String userName;

	private int productId;

	private String productName;

	public int getSaveItemId() {
		return saveItemId;
	}

	public void setSaveItemId(int saveItemId) {
		this.saveItemId = saveItemId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getProducId() {
		return productId;
	}

	public void setProducId(int producId) {
		this.productId = producId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	

}