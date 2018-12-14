package io.github.no5972.audiocms.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.github.no5972.audiocms.models.Category;
import io.github.no5972.audiocms.services.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/manage_category.php")
	public String manageCategoryIndex(ModelMap model) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute("errMsg_category");
		List<Category> allCategories = categoryService.getAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "manage_category";
	}
	
	@RequestMapping("/manage_delCategory.php")
	public String deleteCategory(int id, ModelMap model) {
		if (categoryService.deleteCategory(id)) {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().removeAttribute("errMsg_category");
			List<Category> allCategories = categoryService.getAllCategories();
			model.addAttribute("allCategories", allCategories);
			return "manage_category";
		} else {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			request.getSession().setAttribute("errMsg_category", "所选类别不为空，不能删除！");
			List<Category> allCategories = categoryService.getAllCategories();
			model.addAttribute("allCategories", allCategories);
			return "manage_category";
		}
	}
	
	@RequestMapping("/manage_addCategoryInput.php")
	public String addCategoryInput() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute("errMsg_category");
		return "manage_newcategory";
	}
	
	@RequestMapping("/manage_addCategory.php")
	public String addCategory(String name, ModelMap model) {
		categoryService.addCategory(name);
		List<Category> allCategories = categoryService.getAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "manage_category";
	}
	
	@RequestMapping("/manage_updateCategoryInput.php")
	public String updateCategoryInput(int id, ModelMap model) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		request.getSession().removeAttribute("errMsg_category");
		model.addAttribute("originalCategory", categoryService.getCategoryById(id));
		return "manage_updatecategory";
	}
	
	@RequestMapping("/manage_updateCategory.php")
	public String updateCategory(int id, String name, ModelMap model) {
		categoryService.updateCategory(id, name);
		List<Category> allCategories = categoryService.getAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "manage_category";
	}
}
