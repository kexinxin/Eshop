package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class OrderItem implements Serializable{

	private static final long serialVersionUID = 5491606717264482943L;

	public OrderItem() {
	}

	private String orderItemId;

	private int productId;

	private String orderId;

	private String productName;

	private float procutPrice;

	private int amount;

	private String valuation;

	private String trafficCompany;

	private String attr2;
	
	private Product product;
	
	private float  totalPrice;

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public float getProcutPrice() {
		return procutPrice;
	}

	public void setProcutPrice(float procutPrice) {
		this.procutPrice = procutPrice;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getValuation() {
		return valuation;
	}

	public void setValuation(String valuation) {
		this.valuation = valuation;
	}

	public String getTrafficCompany() {
		return trafficCompany;
	}

	public void setTrafficCompany(String trafficCompany) {
		this.trafficCompany = trafficCompany;
	}

	public String getAttr2() {
		return attr2;
	}

	public void setAttr2(String attr2) {
		this.attr2 = attr2;
	}
	
	public void caculate(){
		totalPrice=amount*procutPrice;
	}
	

}