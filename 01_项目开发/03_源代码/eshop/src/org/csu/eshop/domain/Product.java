package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;


public class Product implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public Product() {
	}

	private int productId;

	private String name;

	private String description;

	private String createTime;

	private float basePrice;

	private float marketPrice;

	private float sellPrice;

	private int comment;

	private int clickCount;

	private int sellCount;

	private int categoryId;

	private String picture;

	private String company;

	private int qty;

	private String attr1;

	private String attr2;

	private String attr3;

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public float getBasePrice() {
		return basePrice;
	}

	public void setBasePrice(float basePrice) {
		this.basePrice = basePrice;
	}

	public float getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(float marketPrice) {
		this.marketPrice = marketPrice;
	}

	public float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public int getComment() {
		return comment;
	}

	public void setComment(int comment) {
		this.comment = comment;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public int getSellCount() {
		return sellCount;
	}

	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
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

	public String getAttr3() {
		return attr3;
	}

	public void setAttr3(String attr3) {
		this.attr3 = attr3;
	}
	

}