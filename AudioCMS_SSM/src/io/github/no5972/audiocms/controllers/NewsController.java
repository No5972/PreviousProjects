package io.github.no5972.audiocms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import io.github.no5972.audiocms.models.Category;
import io.github.no5972.audiocms.models.News;
import io.github.no5972.audiocms.services.CategoryService;
import io.github.no5972.audiocms.services.NewsService;

@Controller
public class NewsController {
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/manage_news.php")
	public String manageNews(ModelMap model, Integer cid, Integer page) {
		System.out.println(cid==null);
		List<Category> allCategories = categoryService.getAllCategories();
		List<News> results;
		int pageCount;
		if (cid==null) {
			pageCount = newsService.getAllNewsPageCount(10);
			System.out.println(pageCount);
			if (page==null) {
				page = new Integer(1);
				results = newsService.getAllNewsSplitByPages(1, 10);
			} else {
				if (page.intValue()>pageCount) 
					page = new Integer(pageCount);
				if (page.intValue()<1) 
					page = new Integer(1);
				System.out.println(page);
				results = newsService.getAllNewsSplitByPages(page.intValue(), 10);
			}
		} else {
			Category currCategory = categoryService.getCategoryById(cid);
			pageCount = newsService.getNewsPageCountByCid(cid, 10);
			System.out.println(newsService.getNewsPageCountByCid(cid, 10));
			if (page==null) {
				page = new Integer(1);
				results = newsService.getNewsByCidSplitByPages(1, 10, cid.intValue());
			} else {
				if (page.intValue()>pageCount) 
					page = new Integer(pageCount);
				if (page.intValue()<1) 
					page = new Integer(1);
				System.out.println(page);
				results = newsService.getNewsByCidSplitByPages(page.intValue(), 10, cid.intValue());
			}
			model.addAttribute("cid", cid.intValue());
			model.addAttribute("currCategoryName", currCategory.getName());
		}
		model.addAttribute("currPage", page);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("newsList", results);
		model.addAttribute("allCategories", allCategories);
		model.addAttribute("oneCategory", new Category());
		return "manage_news";
	}
	
	@RequestMapping("/manage_addNewsInput.php")
	public String addNewsInput(Integer cid, ModelMap model) {
		if (cid!=null) {
			Category currCategory = categoryService.getCategoryById(cid);
			model.addAttribute("cid", cid);
			model.addAttribute("currCategoryName", currCategory.getName());
		} else {
			model.addAttribute("currCategoryName", "全部");
		}
		List<Category> allCategories = categoryService.getAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "manage_newnews";
	}
	
	@RequestMapping("/manage_newnews.php")
	public String newNews(Integer cid, String title, String content, ModelMap model) {
		// add news
		if (cid.intValue()==-1) {
			model.addAttribute("errMsg_News", "请选择类别！");
			News getInput = new News();
			getInput.setTitle(title);
			getInput.setContent(content);
			model.addAttribute("news", getInput);
			List<Category> allCategories = categoryService.getAllCategories();
			model.addAttribute("allCategories", allCategories);
			model.addAttribute("currCategoryName", "全部");
			return "manage_newnews";
		}
		newsService.insertNews(title, content, cid);
		
		// return to news list
		List<Category> allCategories = categoryService.getAllCategories();
		List<News> results;
		int pageCount;
		pageCount = newsService.getAllNewsPageCount(10);
		System.out.println(pageCount);
		results = newsService.getAllNewsSplitByPages(1, 10);
		model.addAttribute("currPage", 1);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("newsList", results);
		model.addAttribute("allCategories", allCategories);
		model.addAttribute("oneCategory", new Category());
		return "manage_news";
	}
	
	@RequestMapping("/manage_deleteNews.php")
	public String deleteNews(Integer id, ModelMap model) {
		// delete news
		if (id==null) throw new NullPointerException("Bad Requests");
		newsService.deleteNews(id);
		
		// return to news list
		List<Category> allCategories = categoryService.getAllCategories();
		List<News> results;
		int pageCount;
		pageCount = newsService.getAllNewsPageCount(10);
		System.out.println(pageCount);
		results = newsService.getAllNewsSplitByPages(1, 10);
		model.addAttribute("currPage", 1);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("newsList", results);
		model.addAttribute("allCategories", allCategories);
		model.addAttribute("oneCategory", new Category());
		return "manage_news";
	}
	
	@RequestMapping("/manage_detailed_news.php")
	public String backendDetailedNews(Integer id, ModelMap model) {
		News resultNews = newsService.getNewsById(id);
		model.addAttribute("news", resultNews);
		Category currCategory = categoryService.getCategoryById(resultNews.getCid());
		model.addAttribute("currCategoryName", currCategory.getName());
		return "manage_detailednews";
	}
	
	@RequestMapping("/manage_updatenewsinput.php")
	public String updateNewsInput(Integer id, ModelMap model) {
		News resultNews = newsService.getNewsById(id);
		model.addAttribute("news", resultNews);
		Category currCategory = categoryService.getCategoryById(resultNews.getCid());
		model.addAttribute("currCategoryName", currCategory.getName());
		List<Category> allCategories = categoryService.getAllCategories();
		model.addAttribute("allCategories", allCategories);
		return "manage_updatenews";
	}
	
	@RequestMapping("/manage_updatenews.php")
	public String updateNews(Integer id, String title, Integer cid, String content, ModelMap model) {
		if (cid.intValue()==-1) {
			model.addAttribute("errMsg_News", "请选择类别！");
			News resultNews = newsService.getNewsById(id);
			resultNews.setTitle(title);
			resultNews.setContent(content);
			model.addAttribute("news", resultNews);
			List<Category> allCategories = categoryService.getAllCategories();
			model.addAttribute("allCategories", allCategories);
			return "manage_updatenews";
		}
		
		newsService.updateNews(id, title, cid, content);
		
		// return to news list
		List<Category> allCategories = categoryService.getAllCategories();
		List<News> results;
		int pageCount;
		pageCount = newsService.getAllNewsPageCount(10);
		System.out.println(pageCount);
		Category currCategory = categoryService.getCategoryById(cid);
		pageCount = newsService.getNewsPageCountByCid(cid, 10);
		results = newsService.getNewsByCidSplitByPages(1, 10, cid.intValue());
		model.addAttribute("cid", cid.intValue());
		model.addAttribute("currCategoryName", currCategory.getName());
		model.addAttribute("currPage", 1);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("newsList", results);
		model.addAttribute("allCategories", allCategories);
		model.addAttribute("oneCategory", new Category());
		return "manage_news";
	}
	
	@RequestMapping("/manage_setheadline.php")
	public String setHeadline(Integer id, String from, Integer cid, ModelMap model) {
		newsService.setHeadline(id);
		System.out.println("from====="+from);
		if (from!=null&&from.equals("detailed")) {
			return backendDetailedNews(id, model);
		} else {
			return manageNews(model, cid, 1);
		}
	}
}
