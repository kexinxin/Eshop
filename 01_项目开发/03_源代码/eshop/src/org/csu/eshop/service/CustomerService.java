package org.csu.eshop.service;


import java.util.List;

import org.csu.eshop.domain.Customer;
import org.csu.eshop.domain.SaveItem;
import org.csu.eshop.persistence.CustomerMapper;
import org.csu.eshop.persistence.SaveItemMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;

	public class CustomerService {
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				"/applicationContext.xml");
		private  CustomerMapper customerMapper=appContext
				.getBean(CustomerMapper.class);
		private SaveItemMapper saveItemMapper=appContext
				.getBean(SaveItemMapper.class);

	  
	    public CustomerService() {
	    }

	   
	    @Transactional
	    public Customer getCustomer(String userName) {
	        // TODO implement here
	    	return customerMapper.getCustomerByUserName(userName);
	    }

	   
	    @Transactional
	    public Customer getCustomer(String userName, String passWord) {
	        
	    	Customer customer = new Customer();
			customer.setUsername(userName);
			customer.setPassword(passWord);
			return customerMapper.getCustomerByUserNameAndPassword(customer);
	    }

	    
	    @Transactional
	    public void insertCusomer(Customer customer) {
	      
	       customerMapper.insertCustomer(customer);
	       
	    }

	    
	    public void updateCustomer(Customer customer) {
	        customerMapper.updateCustomer(customer);
	        
	    }

	  
	    public void delectCustomerByUserName(String userName) {
	        Customer customer = getCustomer(userName);
	        customerMapper.delectCustomer(customer);
	    }

	    
	    public List<Customer> getCustomerList() {
	        
	        return customerMapper.getCustomerList();
	    }

	    
	    public List<SaveItem> getSaveItemList(String userName) {
	        
	        return saveItemMapper.getSaveItemListByUserName(userName);
	    }

	    
	    public void insertSaveItem(SaveItem saveItem) {
	        saveItemMapper.insertSaveItem(saveItem);
	    }

	   
	    public void delectSaveItem(int saveItemId) {
	      saveItemMapper.delectSaveItemBySaveItemId(saveItemId);
	    }
	    
	    public void delectSaveItemByUserName(String username){
	    	saveItemMapper.delectSaveItemByUserName(username);
	    }

	}
	
	
