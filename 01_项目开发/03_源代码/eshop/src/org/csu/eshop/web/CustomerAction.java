package org.csu.eshop.web;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.csu.eshop.domain.Category;
import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.Log;
import org.csu.eshop.domain.Product;
import org.csu.eshop.domain.SaveItem;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.LogService;
import org.csu.eshop.service.ProductService;

import com.opensymphony.xwork2.ActionSupport;


public class CustomerAction extends ActionSupport{

    private CustomerService customerService;
    private Customer customer;
    private LogService logService;
    
    
    
    private List<Category> categoryList;
    private ProductService productService;
    
    
    public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	/**
     * 进入主页
     * @return
     */
    public String main() {
    	productService=new ProductService();
    	categoryList=productService.getParentCategoryList();
    	List<Category> childCategoryList=new ArrayList<Category>();
    	for(int i=0;i<categoryList.size();i++){
    		childCategoryList=productService.getChildCategoryList(categoryList.get(i).getCategoryId());
    		for(int j=0;j<childCategoryList.size();j++){
    			categoryList.get(i).addCategory(childCategoryList.get(j));
    		}
    	}
        return SUCCESS;
    }
    
    

    /**
     * 当用户点击登入时进入登录界面
     * @return
     */
    public String intoLogin() {
        
    	return this.SUCCESS;
    }

    /**
     * 用户已经进入登入界面了，当用户填写
     * 完用户名和密码，点击登入按钮时触发此方法
     * 如果用户名或者密码为空要有提示
     * 如果不为空，进入数据库查找看有没有匹配项
     * 如果没有的话提示用户输入有误
     * 如果有的话进入主界面
     * @return
     */
    public String login() {
    	productService=new ProductService();
    	categoryList=productService.getParentCategoryList();
    	List<Category> childCategoryList=new ArrayList<Category>();
    	for(int i=0;i<categoryList.size();i++){
    		childCategoryList=productService.getChildCategoryList(categoryList.get(i).getCategoryId());
    		for(int j=0;j<childCategoryList.size();j++){
    			categoryList.get(i).addCategory(childCategoryList.get(j));
    		}
    	}
    	HttpServletRequest req = ServletActionContext.getRequest();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
       
        CustomerService customerService = new CustomerService();
        Customer account = customerService.getCustomer(username,password);
        if(account!=null){
        	session.setAttribute("account", account);
            Log log=new Log();
            Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
            log.setUsername(username);
            log.setTime(c.getTime().toString());
            log.setEvent("用户登录了");
            logService=new LogService();
            logService.insertLog(log);
        	return this.SUCCESS;	
        }
        else return  this.ERROR;
    }

    /**
     * 此时用户已经登入了，在页面的最上端，会出现登出
     * 如果用户点击登出，把放在session的customer对象移除
     * session.remove("account");
     * 同时添加一个新的account
     * account = new Account();
     * session.put("account", account);
     * 进入主界面
     * @return
     */
    public String logout() {
    	productService=new ProductService();
    	categoryList=productService.getParentCategoryList();
    	List<Category> childCategoryList=new ArrayList<Category>();
    	for(int i=0;i<categoryList.size();i++){
    		childCategoryList=productService.getChildCategoryList(categoryList.get(i).getCategoryId());
    		for(int j=0;j<childCategoryList.size();j++){
    			categoryList.get(i).addCategory(childCategoryList.get(j));
    		}
    	}
    	HttpSession session = ServletActionContext.getRequest().getSession();
        Customer account = (Customer) session.getAttribute("account");
        if(account!=null){
        	Log log=new Log();
        	Calendar c = Calendar.getInstance();// 可以对每个时间域单独修改
        	log.setUsername(account.getUsername());
        	log.setTime(c.getTime().toString());
        	log.setEvent("用户退出了");
        	logService=new LogService();
            logService.insertLog(log);
        	session.removeAttribute("account");
        }
        return this.SUCCESS;
    }

    /**
     * 当用户登入时在页面的最顶端会有（我的账户）
     * 当用户点击我的账户会触发该方法，此时页面跳转到
     *  账户中心中的用户信息详细页面
     * @return
     */
    public String viewMyAccount() {
    	 HttpSession session = ServletActionContext.getRequest().getSession();
         if(session.getAttribute("account")==null)
         	return this.ERROR;
         else return this.SUCCESS;
    }

    /**
     * 此时用户已经进入买家中心，左侧栏中会有
     * （我的关注，我的详细信息，我的订单）
     * 当用户点击我的关注时会出发此事件
     * 在这个界面中用户可以查看已经关注过的商品
     * @return
     */
    public String viewMySaveItem() {
    	 HttpServletRequest req = ServletActionContext.getRequest();
         HttpSession session = req.getSession();
         Customer account = (Customer) session.getAttribute("account");
         if(account==null)
         	return this.ERROR;
         CustomerService customerService = new CustomerService();
         List<SaveItem> saveItemList = customerService.getSaveItemList(account.getUsername());
         List<Product> saveProductList = new ArrayList<Product>();
         ProductService productService = new ProductService();
         for(int i=0;i<saveItemList.size();i++){
         	Product  temp = productService.getProduct(saveItemList.get(i).getProducId());
         	if(temp!=null)
         		saveProductList.add(temp);
         }
         session.setAttribute("saveProductList", saveProductList);
         return this.SUCCESS;
    }
    /*
     * 点击删除相应的关注商品时触发此操作
     * */
    public String deleteMySaveItem(){
    	HttpServletRequest req = ServletActionContext.getRequest();
        HttpSession session = req.getSession();
        int index = Integer.parseInt(req.getParameter("index"));
        Customer account = (Customer) session.getAttribute("account");
        CustomerService customerService = new CustomerService();
        List<SaveItem> saveItemList = customerService.getSaveItemList(account.getUsername());
        customerService.delectSaveItem(saveItemList.get(index).getSaveItemId());
        saveItemList = customerService.getSaveItemList(account.getUsername());
        List<Product> saveProductList = new ArrayList<Product>();
        ProductService productService = new ProductService();
        for(int i=0;i<saveItemList.size();i++){
        	Product  temp = productService.getProduct(saveItemList.get(i).getProducId());
        	if(temp!=null){
        		saveProductList.add(temp);
        	}
        }
        session.setAttribute("saveProductList", saveProductList);
    	return this.SUCCESS;
    }
    /**
     * 此时用户已经进入我的账户详细页面，在这个页面用户可以修改自己的信息
     * 页面低端会有一个提交按钮，当用户点击此按钮，触发该函数
     * 会在该函数中修改数据库中账户的信息
     * @return
     */
    public String changeInfo() {
    	HttpServletRequest req = ServletActionContext.getRequest();
    	HttpSession session = req.getSession();
    	String username = req.getParameter("username");
    	String  address = req.getParameter("address");
    	int integrate = ((Customer) session.getAttribute("account")).getIntegrate();
    	String mobile = req.getParameter("mobile");
    	String password = ((Customer) session.getAttribute("account")).getPassword();
    	Customer account = new Customer();
    	account.setUsername(username);
    	account.setAddress(address);
    	account.setIntegrate(integrate);
    	account.setMobile(mobile);
    	account.setPassword(password);
    	CustomerService customerService = new CustomerService();
    	customerService.updateCustomer(account);
    	session.setAttribute("account", account);
        return this.SUCCESS;
    }
    /*
     * 密码重置
     * */
    public String passwordReset(){
    	HttpServletRequest req = ServletActionContext.getRequest();
    	String newpassword = req.getParameter("newpasswrd");
    	String password = req.getParameter("password");
    	if(password==null)
    		return this.ERROR;
    	String renewpassword = req.getParameter("renewpassword");
    	if(!newpassword.equals(renewpassword)){
    		return this.ERROR;
    	}
    	HttpSession session = req.getSession();
    	Customer account  = (Customer) session.getAttribute("account");
    	account.setPassword(newpassword);
    	CustomerService customerService = new CustomerService();
    	customerService.updateCustomer(account);
    	return this.SUCCESS;
    }
    /**
     * 当用户点击立即注册时触发此函数
     * 此时页面跳转到注册页面
     * @return
     */
    public String register() {
        
    	return this.SUCCESS;
    }

    /**
     * 此时用户已经进入了注册的页面，
     * 当用户填写完信息，点击提交按钮时
     * 出发此函数，要进行一些判断
     * 比如用户名重名时返回到该页面
     * 或者注册成功，登录该用户，并返回到主界面
     * @return
     */
    public String newAccount() {
        
    	HttpServletRequest req = ServletActionContext.getRequest();
    	String username = req.getParameter("username");
    	CustomerService customerService = new CustomerService();
    	if(customerService.getCustomer(username)!=null){
    		return this.ERROR;
    	}
    	String password = req.getParameter("password");
    	String  repassword = req.getParameter("repassword");
    	if(!password.equals(repassword))
    		return this.ERROR;
    	String mobile = req.getParameter("mobile");
    	String address = req.getParameter("address");
    	
    	int integrate = 0;
    	Customer account  = new Customer();
    	account.setAddress(address);
    	account.setIntegrate(integrate);
    	account.setMobile(mobile);
    	account.setPassword(password);
    	account.setUsername(username);
    	HttpSession session = req.getSession();
    	session.setAttribute("account", account);
    	customerService.insertCusomer(account);
        return this.SUCCESS;
    }

}