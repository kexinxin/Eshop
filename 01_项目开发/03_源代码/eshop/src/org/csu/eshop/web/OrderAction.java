package org.csu.eshop.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.csu.eshop.domain.Car;
import org.csu.eshop.domain.CarItem;
import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.Order;
import org.csu.eshop.domain.OrderItem;
import org.csu.eshop.domain.Product;
import org.csu.eshop.domain.StateChangeLog;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.LogService;
import org.csu.eshop.service.OrderService;
import org.csu.eshop.service.ProductService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderAction extends ActionSupport {

	Car car;
	Order order;
	OrderItem orderItem;
	List<Order> orderList;
	List<OrderItem> orderItemList;
	OrderService orderService;
	ProductService productService;
	LogService logService;
	String orderId;
	String orderItemId;
	String valuation;
	String productId;
	CustomerService customerService;
	int  integrate;
	
	
	
	public int getIntegrate() {
		return integrate;
	}

	public void setIntegrate(int integrate) {
		this.integrate = integrate;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getValuation() {
		return valuation;
	}

	public void setValuation(String valuation) {
		this.valuation = valuation;
	}

	public OrderItem getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(OrderItem orderItem) {
		this.orderItem = orderItem;
	}

	public String getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(String orderItemId) {
		this.orderItemId = orderItemId;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	/**
	 * 此时用户已经进入账户中心，当用户点击我的订单的时候触发该方法
	 * 
	 * @return
	 */
	public String viewOrder() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		if(customer==null)
			return this.ERROR;
		orderService = new OrderService();
		productService=new ProductService();
		orderList = orderService.getOrderByuserName(customer.getUsername());
		for(int i=0;i<orderList.size();i++){
			Order temporder=new Order();
			temporder=orderList.get(i);
			List<OrderItem> orderItemList=new ArrayList<OrderItem>();
			orderItemList=orderService.getOrderItemList(temporder.getOrderId());
			for(int j=0;j<orderItemList.size();j++){
				Product product=new Product();
				OrderItem orderItem=new OrderItem();
				orderItem=orderItemList.get(j);
				product=productService.getProduct(orderItem.getProductId());
				orderItem.setProduct(product);
				orderItem.caculate();
				temporder.addOrderItem(orderItem);
			}
		}
		return this.SUCCESS;
	}

	/**
	 * 提交订单
	 * 
	 * @return
	 */
	public String confirmOrder() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		ProductService productService = new ProductService();
		car = (Car) session.get("car");
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		if (customer == null) {
			return INPUT;
		} else {
			return SUCCESS;
		}
	}

	/**
	 * 支付订单
	 * 
	 * @return
	 */
	public String payOrder() {
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		ProductService productService = new ProductService();
		customerService=new CustomerService();
		car = (Car) session.get("car");
		Date cc = new Date();
		Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);
		String stmonth, stdate, sthour, stminute, stsecond;
		if (month < 10) {
			stmonth = "0" + String.valueOf(month);
		} else {
			stmonth = String.valueOf(month);
		}
		if (date < 10) {
			stdate = "0" + String.valueOf(date);
		} else {
			stdate = String.valueOf(date);
		}
		if (hour < 10) {
			sthour = "0" + String.valueOf(hour);
		} else {
			sthour = String.valueOf(hour);
		}
		if (minute < 10) {
			stminute = "0" + String.valueOf(minute);
		} else {
			stminute = String.valueOf(minute);
		}
		if (second < 10) {
			stsecond = "0" + String.valueOf(second);
		} else {
			stsecond = String.valueOf(second);
		}
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		String orderId = year + stmonth + stdate + sthour + stminute + stsecond;
		order.setOrderId(orderId);
		if(integrate==0){
			order.setTatalPrice(car.getTotalMoney());
		}else if(integrate==1){
			if(customer.getIntegrate()<50){
				return INPUT;
			}
			customer.setIntegrate(customer.getIntegrate()-50);
			
			order.setTatalPrice(car.getTotalMoney()-1);
		}else if(integrate==2){
			if(customer.getIntegrate()<100){
				return INPUT;
			}
			customer.setIntegrate(customer.getIntegrate()-100);
			order.setTatalPrice(car.getTotalMoney()-3);
		}else{
			if(customer.getIntegrate()<200){
				return INPUT;
			}
			customer.setIntegrate(customer.getIntegrate()-200);
			order.setTatalPrice(car.getTotalMoney()-10);
		}
		int temp=(int)order.getTatalPrice()/10+customer.getIntegrate();
		customer.setIntegrate(temp);
		customerService.updateCustomer(customer);
		order.setOrderState(1);
		order.setPaymentWay("支付宝");
		order.setUsername(customer.getUsername());
		order.setCreateTime(c.getTime().toString());
		orderService = new OrderService();
		orderService.insertOrder(order);
		StateChangeLog stateChangeLog=new StateChangeLog();
		stateChangeLog.setChangeTime(c.getTime().toString());
		stateChangeLog.setEvent("用户已经提交订单");
		stateChangeLog.setOrderId(order.getOrderId());
		logService=new LogService();
		logService.insertStateChangeLog(stateChangeLog);
		List<CarItem> carList = car.getCartItemList();
		for (int i = 0; i < carList.size(); i++) {
			CarItem carItem = carList.get(i);
			OrderItem orderItem = new OrderItem();
			orderItem.setAmount(carItem.getQuantity());
			orderItem.setOrderId(orderId);
			orderItem.setProcutPrice(carItem.getProduct().getSellPrice());
			orderItem.setProductId(carItem.getProduct().getProductId());
			orderItem.setProductName(carItem.getProduct().getName());
			orderItem.setAttr2(String.valueOf(carItem.getTotal()));
			orderService.insertOrderItem(orderItem);
			
			
//			Product product=new Product();
//			product=productService.getProduct(carItem.getProduct().getProductId());
//			product.setQty(product.getQty()-carItem.getQuantity());
//			productService.updateProduct(product);
			productService.updateProductQyt(carItem.getProduct().getProductId(), carItem.getProduct().getQty()-carItem.getQuantity());
		}
		return SUCCESS;
	}

	public String confirmPayOrder() {
		OrderService orderService = new OrderService();
		order = orderService.getOrderByOrderId(orderId);
		orderService.changeOrderStatus(orderId, 3);
		Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
		StateChangeLog stateChangeLog=new StateChangeLog();
		stateChangeLog.setChangeTime(c.getTime().toString());
		stateChangeLog.setEvent("用户已经成功支付");
		stateChangeLog.setOrderId(order.getOrderId());
		logService=new LogService();
		logService.insertStateChangeLog(stateChangeLog);
		return SUCCESS;
	}

	/**
	 * 确认收货
	 * 
	 * @return
	 */
	public String confirmReceive() {
		OrderService orderService = new OrderService();
		order = orderService.getOrderByOrderId(orderId);
		orderService.changeOrderStatus(orderId, 7);
		Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
		StateChangeLog stateChangeLog=new StateChangeLog();
		stateChangeLog.setChangeTime(c.getTime().toString());
		stateChangeLog.setEvent("用户已经收货");
		stateChangeLog.setOrderId(order.getOrderId());
		logService=new LogService();
		logService.insertStateChangeLog(stateChangeLog);
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		orderService = new OrderService();
		productService=new ProductService();
		orderList = orderService.getOrderByuserName(customer.getUsername());
		for(int i=0;i<orderList.size();i++){
			Order temporder=new Order();
			temporder=orderList.get(i);
			List<OrderItem> orderItemList=new ArrayList<OrderItem>();
			orderItemList=orderService.getOrderItemList(temporder.getOrderId());
			for(int j=0;j<orderItemList.size();j++){
				Product product=new Product();
				OrderItem orderItem=new OrderItem();
				orderItem=orderItemList.get(j);
				product=productService.getProduct(orderItem.getProductId());
				orderItem.setProduct(product);
				orderItem.caculate();
				temporder.addOrderItem(orderItem);
			}
		}
		return SUCCESS;
	}

	/**
	 * 评价订单
	 * 
	 * @return
	 */
	public String addValuation() {
		orderService=new OrderService();
		productService=new ProductService();
		orderItem=orderService.getOrderItem(Integer.valueOf(orderItemId));
		Product product=new Product();
		product=productService.getProduct(orderItem.getProductId());
		orderItem.setProduct(product);
		orderItem.caculate();
		return SUCCESS;
	}
	
	public String viewOrderInfo(){
		orderService=new OrderService();
		productService=new ProductService();
		order=orderService.getOrderByOrderId(orderId);
		List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		orderItemList=orderService.getOrderItemList(order.getOrderId());
		for(int j=0;j<orderItemList.size();j++){
			Product product=new Product();
			OrderItem orderItem=new OrderItem();
			orderItem=orderItemList.get(j);
			product=productService.getProduct(orderItem.getProductId());
			orderItem.setProduct(product);
			orderItem.caculate();
			order.addOrderItem(orderItem);
		}
		return SUCCESS;
	}
	
	public String rePayOrder(){
		orderService=new OrderService();
		order=orderService.getOrderByOrderId(orderId);
		return SUCCESS;
	}
	
	
	public String insertToDB(){
		orderService=new OrderService();
		orderItem=orderService.getOrderItem(Integer.valueOf(orderItemId));
		orderItem.setValuation(valuation);
		orderService.addValuation(orderItem);
		orderItemList=orderService.getOrderItemList(orderItem.getOrderId());
		orderService.changeOrderStatus(orderItem.getOrderId(), 8);
		boolean flag=true;
		for(int i=0;i<orderItemList.size();i++){
			if(orderItemList.get(i).getValuation()==null){
				orderService.changeOrderStatus(orderItem.getOrderId(), 7);
				flag=false;
			}
		}
		if(flag){
			Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
			StateChangeLog stateChangeLog=new StateChangeLog();
			stateChangeLog.setChangeTime(c.getTime().toString());
			stateChangeLog.setEvent("用户已经评价");
			stateChangeLog.setOrderId(orderItem.getOrderId());
			logService=new LogService();
			logService.insertStateChangeLog(stateChangeLog);
		}
		Map session = ActionContext.getContext().getSession();
		HttpServletRequest request = ServletActionContext.getRequest();
		Customer customer = new Customer();
		customer = (Customer) session.get("account");
		orderService = new OrderService();
		productService=new ProductService();
		orderList = orderService.getOrderByuserName(customer.getUsername());
		for(int i=0;i<orderList.size();i++){
			Order temporder=new Order();
			temporder=orderList.get(i);
			List<OrderItem> orderItemList=new ArrayList<OrderItem>();
			orderItemList=orderService.getOrderItemList(temporder.getOrderId());
			for(int j=0;j<orderItemList.size();j++){
				Product product=new Product();
				OrderItem orderItem=new OrderItem();
				orderItem=orderItemList.get(j);
				product=productService.getProduct(orderItem.getProductId());
				orderItem.setProduct(product);
				orderItem.caculate();
				temporder.addOrderItem(orderItem);
			}
		}
		return SUCCESS;
	}
	public String intoValuationList(){
		orderService=new OrderService();
		productService=new ProductService();
		order=orderService.getOrderByOrderId(orderId);
		List<OrderItem> orderItemList=new ArrayList<OrderItem>();
		orderItemList=orderService.getOrderItemList(order.getOrderId());
		for(int j=0;j<orderItemList.size();j++){
			Product product=new Product();
			OrderItem orderItem=new OrderItem();
			orderItem=orderItemList.get(j);
			product=productService.getProduct(orderItem.getProductId());
			orderItem.setProduct(product);
			orderItem.caculate();
			order.addOrderItem(orderItem);
		}
		return SUCCESS;
	}
	
	
	
	public String payNow(){
		HttpServletRequest req = ServletActionContext.getRequest();
        HttpSession session = req.getSession();
		ProductService productService = new ProductService();
		Customer customer = new Customer();
		customer = (Customer) session.getAttribute("account");
		Product product = (Product) session.getAttribute("product");
		if (customer == null) {
			return INPUT;
		} else {
			car = new Car();
			car.addCarItem(product);
			car.getTotalMoney();
			session.setAttribute("car", car);
			return SUCCESS;
		}
	}
	
	public String payFinish(){
		orderService=new OrderService();
		order=orderService.getOrderByOrderId(orderId);
		orderService.changeOrderStatus(orderId, 3);
		Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
		StateChangeLog stateChangeLog=new StateChangeLog();
		stateChangeLog.setChangeTime(c.getTime().toString());
		stateChangeLog.setEvent("用户已经成功支付");
		stateChangeLog.setOrderId(order.getOrderId());
		logService=new LogService();
		logService.insertStateChangeLog(stateChangeLog);
		return SUCCESS;
	}
	
}