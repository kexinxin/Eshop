package org.csu.eshop.service;
import java.util.*;

import org.csu.eshop.domain.Category;
import org.csu.eshop.domain.Product;
import org.csu.eshop.persistence.CategoryMapper;
import org.csu.eshop.persistence.ProductMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class ProductService {

    ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
	private ProductMapper productMapper=appContext
			.getBean(ProductMapper.class);
	private CategoryMapper categoryMapper=appContext
			.getBean(CategoryMapper.class);
  
    public Category getParentCategory(int pid) {
        return categoryMapper.getParentCategorytByPid(pid);
    }

    
    public List<Category> getParentCategoryList() {
        return categoryMapper.getParentCategoryList();
    }

   
    public List<Category> getChildCategoryList(int categoryId) {
        return categoryMapper.getChildCategoryListByParentCategoryId(categoryId);
    }

   
    public Product getProduct(int productId) {
        return productMapper.getProductByProductId(productId);
    }

    
    public List<Product> getProductList(int categoryId) {
        return productMapper.getProductListByCategoryId(categoryId);
    }

    
    public List<Product> searchProcutList(String keyWord) {
    	return productMapper.searchProductByKeyWord("%" + keyWord + "%");
    }

    
    public void insertProduct(Product product) {
    	productMapper.insertProduct(product);
    }

    
    public void updateProduct(Product product) {
    	productMapper.updateProduct(product);
    }

   
    public void delectProduct(int productId) {
    	productMapper.delectProductByProductId(productId);
    }
    
    public List<Product> getProductListByParentCategoryId(int parentCategoryId){
    	return productMapper.getProductListByParentCategoryId(parentCategoryId);
    }
    
    public List<Product>  getProductListByCategryAndPriced(int categoryId,int min,int max){
    	Product product=new Product();
    	product.setCategoryId(categoryId);
    	product.setBasePrice(min);
    	product.setMarketPrice(max);
    	return productMapper.getProductListByCategryAndPriced(product);
    }
    
    public List<Product> getProductListByCategryAndCompany(int categoryId,String company){
    	Product product=new Product();
    	product.setCategoryId(categoryId);
    	product.setCompany(company);
    	return productMapper.getProductListByCategryAndCompany(product);
    }
    public void updateProductQyt(int productId,int qty){
    	Product product=new Product();
    	product.setProductId(productId);
    	product.setQty(qty);
    	productMapper.updateProductQyt(product);
    }

}