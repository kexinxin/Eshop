package org.csu.eshop.persistence;
import java.util.*;

import org.csu.eshop.domain.Category;

/**
 * 
 */
public interface CategoryMapper {

    /**
     * @param pid 
     * @return
     */
    public Category getParentCategorytByPid(int pid);

    /**
     * @param category 
     * @return
     */
    public Category getParentCategoryByCategory(Category category);

    /**
     * @return
     */
    public List<Category> getParentCategoryList();

    /**
     * @param category 
     * @return
     */
    public List<Category> getChildCategoryListByParentCategory(Category category);

    /**
     * @param categoryId 
     * @return
     */
    public List<Category> getChildCategoryListByParentCategoryId(int categoryId);

}