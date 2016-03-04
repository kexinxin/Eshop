package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.Product;

/**
 * 
 */
public interface ProductMapper {

    /**
     * @param productId 
     * @return
     */
    public Product getProductByProductId(int productId);

    /**
     * @param categoryId 
     * @return
     */
    public List<Product> getProductListByCategoryId(int categoryId);

    /**
     * @param keyWord 
     * @return
     */
    public List<Product> searchProductByKeyWord(String keyWord);

    /**
     * @param product 
     * @return
     */
    public void insertProduct(Product product);

    /**
     * @param product 
     * @return
     */
    public void updateProduct(Product product);
    
    public void updateProductQyt(Product product);

    /**
     * @param productId 
     * @return
     */
    public void delectProductByProductId(int productId);
    
    
    public List<Product> getProductListByParentCategoryId(int parentCategoryId);
    
    public List<Product>  getProductListByCategoryIdAndPrice(Product product);
    
    public List<Product> getProductListByCategryAndPriced(Product product);
    
    public List<Product> getProductListByCategryAndCompany(Product product);

}