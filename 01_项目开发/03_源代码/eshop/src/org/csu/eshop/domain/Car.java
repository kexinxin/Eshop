package org.csu.eshop.domain;

import java.util.*;



public class Car {

	public Car() {
	}

	private Map<Integer, CarItem> carItemMap=Collections.synchronizedMap(new HashMap<Integer, CarItem>());

	private List<CarItem> cartItemList=new ArrayList<CarItem>();
	
	float totalMoney=0;

	public Map getCarItemMap() {
		return carItemMap;
	}

	public void setCarItemMap(Map carItemMap) {
		this.carItemMap = carItemMap;
	}

	public List getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List cartItemList) {
		this.cartItemList = cartItemList;
	}

	public Iterator<CarItem> getCarItems() {

		return cartItemList.iterator();
	}


	public void addCarItem(Product product) {
		CarItem cartItem = (CarItem) carItemMap.get(product.getProductId());
	    if (cartItem == null) {
	      cartItem = new CarItem();
	      cartItem.setProduct(product);
	      cartItem.setQuantity(0);
	      carItemMap.put(product.getProductId(), cartItem);
	      cartItemList.add(cartItem);
	    }
	    cartItem.incrementQuantity();
	}
	public void removeItemById(int productId){
		CarItem carItem=carItemMap.get(productId);
		cartItemList.remove(carItem);
	}
	public float getTotalMoney(){
		totalMoney=0;
		for(int i=0;i<cartItemList.size();i++)
			totalMoney+=cartItemList.get(i).getTotal();
		return totalMoney;
	}

	public void setQuantityByItemId(int productId, int quantity) {
		 CarItem cartItem = (CarItem) carItemMap.get(productId);
		 cartItem.setQuantity(quantity);
		 cartItem.calculateTotal();
	}
}