package io.github.no5972.audiocms.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.audiocms.dao.CategoryDao;
import io.github.no5972.audiocms.dao.NewsDao;
import io.github.no5972.audiocms.models.Category;
import io.github.no5972.audiocms.models.News;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao cd;
	
	@Autowired
	private NewsDao nd;
	
	@Override
	public List<Category> getAllCategories() {
		return cd.selectAllCategories();
	}

	@Override
	public boolean deleteCategory(int id) {
		// TODO Auto-generated method stub
		List<News> isCategoryNull = nd.selectNewsByCid(id);
		if (isCategoryNull.isEmpty()) {
			cd.deleteCategory(id);
			//System.out.println("simulate delete");
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void addCategory(String name) {
		// TODO Auto-generated method stub
		cd.addCategory(name);
	}

	@Override
	public void updateCategory(int id, String newName) {
		// TODO Auto-generated method stub
		cd.updateCategory(id, newName);
	}

	@Override
	public Category getCategoryById(int id) {
		// TODO Auto-generated method stub
		return cd.selectCategoryById(id);
	}

}
