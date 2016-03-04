package org.csu.eshop.domain;

import java.math.BigDecimal;
import java.util.*;

public class CarItem {

	public CarItem() {
	}

	private Product product;

	private int quantity;

	private float total;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public void incrementQuantity() {
		quantity++;
	    calculateTotal();
	}

	public void calculateTotal() {
		if (product != null) {
		      total =product.getSellPrice()*this.quantity;
		    } else {
		      total =0;
		    }
	}

}