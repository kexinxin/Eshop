package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.OrderItem;

/**
 * 
 */
public interface OrderItemMapper {

    /**
     * @param orderItemId 
     * @return
     */
    public OrderItem getOrderItemByItemId(int orderItemId);

    /**
     * @param orderId 
     * @return
     */
    public List<OrderItem> getOrderItemListByOrderId(String orderId);

    /**
     * @param orderItem 
     * @return
     */
    public void insertOrderItem(OrderItem orderItem);

    /**
     * @param orderItemId 
     * @param valuation 
     * @return
     */
    public void addValuation(OrderItem orderitem);
    
    public void delectOrderItem(String orderId);
    
    public List<OrderItem>  getOrderItemListByProductId(int productId);

}