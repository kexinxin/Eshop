package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class Order implements Serializable{


	private static final long serialVersionUID = 1L;

	public Order() {
	}
	
	private String orderId;
	private String username;
	private String address;
	private String mobile;
	private float totalPrice;
	private String createTime;
	private String paymentWay;
	private int orderstateId;
	private String attr1;
	private String attr2;
	private List<OrderItem> orderItemList=new ArrayList<OrderItem>();

	
	
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrderstateId() {
		return orderstateId;
	}
	public void setOrderstateId(int orderstateId) {
		this.orderstateId = orderstateId;
	}
	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}
	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public float getTatalPrice() {
		return totalPrice;
	}
	public void setTatalPrice(float tatalPrice) {
		this.totalPrice = tatalPrice;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getPaymentWay() {
		return paymentWay;
	}
	public void setPaymentWay(String paymentWay) {
		this.paymentWay = paymentWay;
	}
	public int getOrderState() {
		return orderstateId;
	}
	public void setOrderState(int orderState) {
		this.orderstateId = orderState;
	}
	public String getAttr1() {
		return attr1;
	}
	public void setAttr1(String attr1) {
		this.attr1 = attr1;
	}
	public String getAttr2() {
		return attr2;
	}
	public void setAttr2(String attr2) {
		this.attr2 = attr2;
	}
	public void addOrderItem(OrderItem orderItem){
		orderItemList.add(orderItem);
	}
}