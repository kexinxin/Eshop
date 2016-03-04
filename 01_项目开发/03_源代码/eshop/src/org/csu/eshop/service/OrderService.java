package org.csu.eshop.service;
import java.util.*;

import org.csu.eshop.domain.Order;
import org.csu.eshop.domain.OrderItem;
import org.csu.eshop.persistence.OrderItemMapper;
import org.csu.eshop.persistence.OrderMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class OrderService {

    ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
	private OrderMapper orderMapper=appContext
			.getBean(OrderMapper.class);
	private OrderItemMapper orderItemMapper=appContext
			.getBean(OrderItemMapper.class);
			
    public Order getOrderByOrderId(String orderId) {
        return orderMapper.getOrder(orderId);
    }

   
    public List<Order> getOrderByuserName(String userName) {
        return orderMapper.getOrderByUserName(userName);
    }

    public void insertOrder(Order order) {
    	orderMapper.insertOrder(order);
    }

   
    public void delectOrder(String orderId) {
    	orderMapper.delectOrder(orderId);
    }

    
    public void changeOrderStatus(String orderId,int status) {
    	Order order = getOrderByOrderId(orderId);
    	order.setOrderState(status);
    	orderMapper.changeOrderStatus(order);
    }

   
    public OrderItem getOrderItem(int orderItemId) {
		return orderItemMapper.getOrderItemByItemId(orderItemId);

    }

    
    public List<OrderItem> getOrderItemList(String orderId) {
		return orderItemMapper.getOrderItemListByOrderId(orderId);

    }

    
    public void insertOrderItem(OrderItem orderItem) {
    	orderItemMapper.insertOrderItem(orderItem);
    }

    
    public void addValuation(OrderItem orderItem) {
    	orderItemMapper.addValuation(orderItem);
    }
    
    public List<Order> getAllOrder(){
    	return orderMapper.getAllOrder();
    }
    
    public void delectOrderItemByOrderId(String orderId){
    	orderItemMapper.delectOrderItem(orderId);
    }
    
    public void delectOrderByUserName(String username){
    	orderMapper.delectOrderByUserName(username);
    }
    
    public List<OrderItem> getOrderItemListByProductId(int productId){
    	return orderItemMapper.getOrderItemListByProductId(productId);
    }

}