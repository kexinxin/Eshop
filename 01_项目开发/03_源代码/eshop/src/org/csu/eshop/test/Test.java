package org.csu.eshop.test;

import java.util.List;

import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.OrderItem;
import org.csu.eshop.domain.Product;
import org.csu.eshop.service.CustomerService;
import org.csu.eshop.service.OrderService;
import org.csu.eshop.service.ProductService;

public class Test {
	public static void main(String[] args) {
		CustomerService accountService=new CustomerService();
		Customer customer=accountService.getCustomer("keke", "keke");
		OrderService orderService=new OrderService();
		List<OrderItem> orderItemList=orderService.getOrderItemListByProductId(5);
		
		for(int i=0;i<orderItemList.size();i++){
			System.out.println(orderItemList.get(i).getValuation());
		}
		
		System.out.println(customer.getAddress());
		
		ProductService productService=new ProductService();
		List<Product> productList=productService.getProductListByParentCategoryId(9);
		System.out.println(productList.size());
		
		List<Product> productList1=productService.getProductList(18);
		System.out.println(productList1.size());
		
	}
}
