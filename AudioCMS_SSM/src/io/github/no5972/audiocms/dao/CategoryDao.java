package io.github.no5972.audiocms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.audiocms.models.Category;

public interface CategoryDao {
	public List<Category> selectAllCategories();
	public void deleteCategory(int id);
	public void addCategory(@Param("name")String name);
	public void updateCategory(@Param("id")int id, @Param("name")String name);
	public Category selectCategoryById(@Param("id")int id);
}
