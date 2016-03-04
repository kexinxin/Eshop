package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class Admin implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public Admin() {
	}

	private String adminName;

	private String passWord;

	private String mobile;

	private String address;

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	

}