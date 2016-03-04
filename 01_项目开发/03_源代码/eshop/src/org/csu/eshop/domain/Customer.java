package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class Customer implements Serializable {

	public Customer() {
	}

	private static final long serialVersionUID = 8751282105159742L;

	private String username;

	private String password;

	private String address;

	private String mobile;

	private int integrate;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getIntegrate() {
		return integrate;
	}

	public void setIntegrate(int integrate) {
		this.integrate = integrate;
	}

}