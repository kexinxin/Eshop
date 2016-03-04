package org.csu.eshop.web;

import java.util.*;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.csu.eshop.domain.Car;
import org.csu.eshop.domain.Category;
import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.OrderItem;
import org.csu.eshop.domain.Product;
import org.csu.eshop.domain.SaveItem;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.OrderService;
import org.csu.eshop.service.ProductService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {

	Category category;
	Product product;
	
	int categoryId;
	int price;
	String canpany;
	int productId;
	

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getCanpany() {
		return canpany;
	}

	public void setCanpany(String canpany) {
		this.canpany = canpany;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String viewChildCategoryProductList() {
	    categoryId = category.getCategoryId();
		ProductService productService = new ProductService();
		List<Product> productList = productService
				.getProductListByParentCategoryId(categoryId);
		///////////////////////
		int pages = (productList.size())/16;
		if((productList.size())%16!=0)
			pages++;
		
		int currentPage =  1;
		List<Product> pageProductList = null;
		if(pages!=1 && pages !=0)
			pageProductList = productList.subList(0, 16);
		else
			pageProductList = productList.subList(0, productList.size());
		///////////////////////
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("productList", productList);
		///////////////////////
		session.setAttribute("pages", pages);
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("categoryId", categoryId);
		//////////////////////
		return SUCCESS;
	}

	public String viewParentCategoryProductList() {

		ProductService productService = new ProductService();
		List<Product> productList = productService.getProductList(categoryId);
		///////////////////////
		int pages = (productList.size())/16;
		if((productList.size())%16!=0)
		pages++;
		
		int currentPage =  1;
		List<Product> pageProductList = null;
		if(pages!=1 && pages !=0)
		pageProductList = productList.subList(0, 16);
		else
		pageProductList = productList.subList(0, productList.size());
		///////////////////////
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("productList", productList);
		///////////////////////
		session.setAttribute("pages", pages);
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("categoryId", categoryId);
		//////////////////////
		return SUCCESS;
	}

	public String viewProduct() {
		/*
		 * HttpServletRequest req = ServletActionContext.getRequest(); int
		 * productId = Integer.parseInt(req.getParameter("productId"));
		 * OrderService orderService = new OrderService(); List<OrderItem>
		 * orderItemList = orderService.getOrderItemListByProductId(productId);
		 * List<String> productValuation = new ArrayList<String>(); for(int
		 * i=0;i<orderItemList.size();i++){
		 * productValuation.add(orderItemList.get(i).getValuation()); }
		 * HttpSession session = req.getSession();
		 * session.setAttribute("productValuation", productValuation);
		 */
		int productId = product.getProductId();
		ProductService productService = new ProductService();
		OrderService orderService = new OrderService();
		Product temp = productService.getProduct(productId);
		List<OrderItem> orderItemList = orderService
				.getOrderItemListByProductId(productId);
		List<String> productValuation = new ArrayList<String>();
		for (int i = 0; i < orderItemList.size(); i++) {
			String signle_valuation = orderItemList.get(i).getValuation();
			if(signle_valuation!=null)
				productValuation.add(signle_valuation);
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		String[] descriptionstemp = temp.getDescription().split("/");
		String[][] descriptions = new String[descriptionstemp.length][2];
		for (int i = 0; i < descriptionstemp.length; i++)
			descriptions[i] = descriptionstemp[i].split(":");

		session.setAttribute("product", temp);
		session.setAttribute("descriptions", descriptions);
		session.setAttribute("productValuation", productValuation);
		session.setAttribute("valuationNum", productValuation.size());
		return this.SUCCESS;
	}

	public String searchProductList() {
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		String keyword = req.getParameter("keyword");
		ProductService productService = new ProductService();
		List<Product> productList = productService.searchProcutList(keyword);
		///////////////////////
		int pages = (productList.size())/16;
		if((productList.size())%16!=0)
		pages++;
		
		int currentPage =  1;
		List<Product> pageProductList = null;
		if(pages!=1 && pages !=0)
		pageProductList = productList.subList(0, 16);
		else
		pageProductList = productList.subList(0, productList.size());
		///////////////////////
		session.setAttribute("productList", productList);
		///////////////////////
		session.setAttribute("pages", pages);
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", currentPage);
		//////////////////////
		return this.SUCCESS;
	}

	public String saveProduct() {
		Customer customer = new Customer();
		CustomerService customerService = new CustomerService();
		SaveItem saveItem = new SaveItem();
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		ProductService productService = new ProductService();
		product = (Product) session.getAttribute("product");
		customer = (Customer) session.getAttribute("account");
		if(customer==null)
			return this.ERROR;

	
		
			saveItem.setProducId(product.getProductId());
			saveItem.setProductName(product.getName());
			saveItem.setUserName(customer.getUsername());
			customerService.insertSaveItem(saveItem);	
			List<SaveItem> saveItemList = customerService.getSaveItemList(customer
			.getUsername());
			List<Product> saveProductList = new ArrayList<Product>();
			productService = new ProductService();
			for(int i=0;i<saveItemList.size();i++){
				Product  temp = productService.getProduct(saveItemList.get(i).getProducId());
				if(temp!=null)
					saveProductList.add(temp);
			}
			session.setAttribute("saveProductList",saveProductList);
			return SUCCESS;
	}
	public String viewProductByPrice(){
		int min,max;
		if(price<=2000){
			max=price;
			min=price-500;
		}else if(price<=4000){
			max=price;
			min=price-1000;
		}else{
			max=100000;
			min=price;
		}
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		ProductService productService = new ProductService();
		List<Product> productList = productService.getProductListByCategryAndPriced(categoryId, min, max);
		System.out.println(productList.size());
		///////////////////////
		int pages = (productList.size())/16;
		if((productList.size())%16!=0)
			pages++;
		
		int currentPage =  1;
		List<Product> pageProductList = null;
		if(pages!=1 && pages !=0)
			pageProductList = productList.subList(0, 16);
		else
			pageProductList = productList.subList(0, productList.size());
		///////////////////////
		session.setAttribute("productList", productList);
		///////////////////////
		session.setAttribute("pages", pages);
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", currentPage);
		//////////////////////
		return SUCCESS;
	}
	public String searchProductListByConpany(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		ProductService productService = new ProductService();
		List<Product> productList = productService.getProductListByCategryAndCompany(categoryId, canpany);
		System.out.println(productList.size());
		///////////////////////
		int pages = (productList.size())/16;
		if((productList.size())%16!=0)
			pages++;
		
		int currentPage =  1;
		List<Product> pageProductList = null;
		if(pages!=1 && pages !=0)
			pageProductList = productList.subList(0, 16);
		else
			pageProductList = productList.subList(0, productList.size());
		///////////////////////
		session.setAttribute("productList", productList);
		///////////////////////
		session.setAttribute("pages", pages);
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", currentPage);
		//////////////////////
		return SUCCESS;
	}
	public String pageChange(){
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		int currentPage = (Integer) session.getAttribute("currentPage");
		int pages = (Integer) session.getAttribute("pages");
		int prePage = Integer.parseInt(req.getParameter("prePage"));
		if(prePage==-1){
			prePage = ((currentPage-1)>0)?currentPage-1:currentPage;
		}else if(prePage==-2){
			prePage= ((currentPage+1)<=pages)?currentPage+1:currentPage;
		}
		List<Product> productList = (List<Product>) session.getAttribute("productList");
		List<Product> pageProductList  = null;
		if(prePage==pages)
			pageProductList  =productList.subList((prePage-1)*16, productList.size());
		else{
			pageProductList = productList.subList((prePage-1)*16, prePage*16);
		}
		session.setAttribute("pageProductList", pageProductList);
		session.setAttribute("currentPage", prePage);
		return this.SUCCESS;
	}
	
}