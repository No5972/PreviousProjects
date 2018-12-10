package io.github.no5972.audiocms.services;

import java.util.List;

import io.github.no5972.audiocms.models.Category;

public interface CategoryService {
	public List<Category> getAllCategories();
	public boolean deleteCategory(int id);
	public void addCategory(String name);
	public void updateCategory(int id, String newName);
	public Category getCategoryById(int id);
}
