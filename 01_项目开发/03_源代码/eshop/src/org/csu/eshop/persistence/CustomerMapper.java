package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.Customer;
import org.springframework.transaction.annotation.Transactional;

public interface CustomerMapper {

    public Customer getCustomerByUserName(String userName);

    public Customer getCustomerByUserNameAndPassword(Customer customer);

    public void insertCustomer(Customer customer);

    public void updateCustomer(Customer customer);

    public void delectCustomer(Customer customer);
    
    public List<Customer> getCustomerList();

}