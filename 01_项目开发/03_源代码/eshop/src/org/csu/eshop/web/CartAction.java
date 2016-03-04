package org.csu.eshop.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.csu.eshop.domain.Car;
import org.csu.eshop.domain.CarItem;
import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.Product;
import org.csu.eshop.domain.SaveItem;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.ProductService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport {

	Car car;
	int removeProductId;
	int productId;
	int goodsNumber;

	public int getGoodsNumber() {
		return goodsNumber;
	}

	public void setGoodsNumber(int goodsNumber) {
		this.goodsNumber = goodsNumber;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getRemoveProductId() {
		return removeProductId;
	}

	public void setRemoveProductId(int removeProductId) {
		this.removeProductId = removeProductId;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	/**
	 * 当用户点击加入购物车，把该商品加入到购物车，并且页面跳转到 购物车页面
	 * 
	 * @return
	 */
	public String addProductToCart() {
		System.out.println(goodsNumber);
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		ProductService productService = new ProductService();
		car = (Car) session.get("car");
		if (car == null) {
			car = new Car();
			session.put("car", car);
		}
		int productId = Integer.valueOf(request.getParameter("productInfoId"));
		Product product = productService.getProduct(productId);
		car.addCarItem(product);
		car.getTotalMoney();
		return SUCCESS;
	}

	/**
	 * 把相应的商品条目从购物车中删除
	 * 
	 * @return
	 */
	public String removeProductFromCart() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		car = (Car) session.get("car");
		car.removeItemById(removeProductId);
		car.getTotalMoney();
		return SUCCESS;
	}

	/**
	 * 当用户增加商品数目的时候更新，条目信息
	 * 
	 * @return
	 */
	public String updateCartQuantities() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		car = (Car) session.get("car");

		Iterator<CarItem> cartItems = car.getCarItems();
		while (cartItems.hasNext()) {
			CarItem cartItem = cartItems.next();
			int productId = cartItem.getProduct().getProductId();

			int quantity = Integer.parseInt(request
					.getParameter(productId + ""));
			car.setQuantityByItemId(productId, quantity);

		}

		return SUCCESS;
	}

	public String saveToMyAccount() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		if(customer==null)
			return this.INPUT;
		CustomerService customerService = new CustomerService();
		ProductService productService = new ProductService();
		Product product = productService.getProduct(productId);
		SaveItem saveItem = new SaveItem();
		saveItem.setProducId(product.getProductId());
		saveItem.setProductName(product.getName());
		saveItem.setUserName(customer.getUsername());
		customerService.insertSaveItem(saveItem);
		car = (Car) session.get("car");
		car.removeItemById(productId);
		car.getTotalMoney();
		return SUCCESS;
	}
	public String viewCart(){
		Map session = ActionContext.getContext().getSession();
		car = (Car) session.get("car");
		return SUCCESS;
	}

}