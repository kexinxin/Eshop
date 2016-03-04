package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.Order;

/**
 * 
 */
public interface OrderMapper {

    
    public Order getOrder(String orderId);

    public List<Order> getOrderByUserName(String userName);

    public void insertOrder(Order order);

    public void delectOrder(String orderId);

    public void changeOrderStatus(Order order);
    
    public List<Order> getAllOrder();
    
    public void delectOrderByUserName(String username);

}