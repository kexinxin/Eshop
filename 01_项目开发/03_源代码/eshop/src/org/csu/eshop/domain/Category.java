package org.csu.eshop.domain;

import java.io.Serializable;
import java.util.*;

public class Category implements Serializable{

	
	private static final long serialVersionUID = 1L;

	public Category() {
	}

	private int categoryId;

	private String name;

	private int level;

	private int pid;
	
	private List<Category> childCategory=new ArrayList<Category>();
	
	

	public List<Category> getChildCategory() {
		return childCategory;
	}

	public void setChildCategory(List<Category> childCategory) {
		this.childCategory = childCategory;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}
	
	public void addCategory(Category category){
		childCategory.add(category);
	}

}