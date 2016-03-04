package org.csu.eshop.web;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.csu.eshop.domain.Admin;
import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.Log;
import org.csu.eshop.domain.Order;
import org.csu.eshop.domain.Product;
import org.csu.eshop.domain.StateChangeLog;
import org.csu.eshop.service.AdminService;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.LogService;
import org.csu.eshop.service.OrderService;
import org.csu.eshop.service.ProductService;

import com.opensymphony.xwork2.ActionSupport;


public class AdminAction extends ActionSupport{
	
	Order  order;
	List<Order> orderList;
	List<Log> logList;
	List<StateChangeLog> stateChangeLogList;
	String orderId;
	OrderService orderService;
	LogService logService;
	
	public List<Log> getLogList() {
		return logList;
	}
	public void setLogList(List<Log> logList) {
		this.logList = logList;
	}
	public List<StateChangeLog> getStateChangeLogList() {
		return stateChangeLogList;
	}
	public void setStateChangeLogList(List<StateChangeLog> stateChangeLogList) {
		this.stateChangeLogList = stateChangeLogList;
	}
	///////////////dh/////////////////
	private File upload;
	private String uploadFileName;
	//////////////////////////////
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
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	
	
	
	public String intoAdminOrderManage(){
		orderService=new OrderService();
		orderList=orderService.getAllOrder();
		return SUCCESS;
	}
	public String delectOrder(){
		orderService=new OrderService();
		logService=new LogService();
		orderService.delectOrderItemByOrderId(orderId);
		logService.delectStateChangeLogByOrderId(orderId);
		orderService.delectOrder(orderId);	
		orderList=orderService.getAllOrder();
		return SUCCESS;
	}
	public String diliverProduct(){
		orderService=new OrderService();
		orderService.changeOrderStatus(orderId, 4);
		Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
		StateChangeLog stateChangeLog=new StateChangeLog();
		stateChangeLog.setChangeTime(c.getTime().toString());
		stateChangeLog.setEvent("商家已发货");
		stateChangeLog.setOrderId(orderId);
		logService=new LogService();
		logService.insertStateChangeLog(stateChangeLog);
		orderList=orderService.getAllOrder();
		return SUCCESS;
	}
	
	public String intoCustomerLog(){
		logService=new LogService();
		logList=logService.getLogList();
		return SUCCESS;
	}
	public String intoStateChangeLog(){
		logService=new LogService();
		stateChangeLogList=logService.getStateChangeLogList();
		return SUCCESS;
	}
	/////////////////////dh
	/*进入管理员登陆界面
     * */
    public String intoAdminLogin(){
    	return this.SUCCESS;
    }
    /*管理员登录界面
     * */
    public String adminLogin(){
    	HttpServletRequest req = ServletActionContext.getRequest();
    	String username = req.getParameter("username");
    	String password = req.getParameter("password");
    	AdminService adminService = new AdminService();
    	Admin admin = adminService.getAdmin(username, password);
    	if(admin!=null){
    		HttpSession session = req.getSession();
    		session.setAttribute("admin", admin);
    		return this.SUCCESS;
    	}
    	else return this.ERROR;
    }
    /*
     * 管理员登出
     * */
    public String adminLogout(){
    	HttpServletRequest req = ServletActionContext.getRequest();
    	HttpSession session = req.getSession();
    	Admin admin= (Admin) session.getAttribute("admin");
    	if(admin!=null)
    		session.removeAttribute("admin");
    	return this.SUCCESS;
    }
    /*
     * 管理员界面查看所有账户信息
     * */
    public String viewAllAccount(){
    	CustomerService customerService = new CustomerService();
    	List<Customer> accountList = customerService.getCustomerList();
    	HttpServletRequest req = ServletActionContext.getRequest();
    	HttpSession  session = req.getSession();
    	session.setAttribute("accountList", accountList);
    	return this.SUCCESS;
    }
    /*删除特定账户
     * */
    public String deleteAccount(){
    	HttpServletRequest req = ServletActionContext.getRequest();
    	HttpSession session  =req.getSession();
    	int index = Integer.parseInt(req.getParameter("index"));
    	CustomerService customerService = new CustomerService();
    	List<Customer> accountList = customerService.getCustomerList();
    	customerService.delectCustomerByUserName(accountList.get(index).getUsername());
    	accountList = customerService.getCustomerList();
    	session.setAttribute("accountList", accountList);
    	return this.SUCCESS;
    }
    /*
     * 进入商品添加页面
     * */
    public String intoUpload_addProduct(){
    	return this.SUCCESS;
    }
    /*
     * 商品添加界面
     * */
    //name basePrice marketPrice sellPrice comment categoryId picture qty company
    public String addProduct(){
		try {
			InputStream is;
			is = new FileInputStream(upload);
			OutputStream os1 = new FileOutputStream("D:\\apache-tomcat-8.0.26\\webapps\\eshop\\images\\"+uploadFileName);
			OutputStream os2 = new FileOutputStream("C:\\Users\\xin\\Desktop\\eshop\\WebRoot\\images\\"+uploadFileName);
			byte[] buffer = new byte[1024];
			int count = 0;
			while((count=is.read(buffer))>0){
				os1.write(buffer);
				os2.write(buffer);
			}
			os1.close();
			os2.close();
			is.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return this.ERROR;
		}
    	HttpServletRequest req = ServletActionContext.getRequest();
    	HttpSession session = req.getSession();
    	String name = req.getParameter("name");
    	float basePrice = Float.parseFloat(req.getParameter("basePrice"));
    	float marketPrice = Float.parseFloat(req.getParameter("marketPrice"));
    	float sellPrice = Float.parseFloat(req.getParameter("sellPrice"));
    	int comment = Integer.parseInt(req.getParameter("comment"));
    	int categoryId = Integer.parseInt(req.getParameter("categoryId"));
    	String picture = "./images/"+uploadFileName;
    	int  qty = Integer.parseInt(req.getParameter("qty"));
    	String company = req.getParameter("company");
    	Date date = new Date();
    	String createTime = date.toLocaleString();
    	String description = req.getParameter("description");
    	////////////////////////////////////////////////
    	Product product = new Product();
    	product.setName(name);
    	product.setBasePrice(basePrice);
    	product.setMarketPrice(marketPrice);
    	product.setSellPrice(sellPrice);
    	product.setComment(comment);
    	product.setCategoryId(categoryId);
    	product.setQty(qty);
    	product.setCompany(company);
    	product.setCreateTime(createTime);
    	product.setPicture(picture);
    	product.setAttr1(picture);
    	product.setAttr2(picture);
    	product.setAttr3(picture);
    	product.setSellCount(0);
    	product.setClickCount(0);
    	product.setDescription(description);
    	
    	ProductService productService = new ProductService();
    	productService.insertProduct(product);
    			
    	return this.SUCCESS;
    }
    public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	//////////////////////////
	

}