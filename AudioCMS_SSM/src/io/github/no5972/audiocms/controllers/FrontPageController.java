package io.github.no5972.audiocms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import io.github.no5972.audiocms.models.Category;
import io.github.no5972.audiocms.models.News;
import io.github.no5972.audiocms.othertools.GenerateAudio;
import io.github.no5972.audiocms.services.CategoryService;
import io.github.no5972.audiocms.services.NewsService;

@Controller
public class FrontPageController {
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/index.do")
	public String getIndex(ModelMap model) {
		News headlineNews = newsService.getHeadlineNews();
		headlineNews.setContent(GenerateAudio.delHTMLTag(headlineNews.getContent()));
		model.addAttribute("allCategories", categoryService.getAllCategories());
		model.addAttribute("newestNews", newsService.getAllNewsSplitByPages(1, 5));
		model.addAttribute("headlineNews", headlineNews);
		model.addAttribute("newsList1", newsService.getNewsByCidSplitByPages(1, 7, 5));
		model.addAttribute("newsList2", newsService.getNewsByCidSplitByPages(1, 7, 4));
		model.addAttribute("newsList3", newsService.getNewsByCidSplitByPages(1, 7, 3));
		model.addAttribute("newsList4", newsService.getNewsByCidSplitByPages(1, 7, 2));
		model.addAttribute("newsList5", newsService.getNewsByCidSplitByPages(1, 7, 1));
		return "index";
	}
	
	@RequestMapping("/frontnews.do")
	public String getNews(Integer id, ModelMap model) {
		News result = newsService.getNewsById(id);
		model.addAttribute("allCategories", categoryService.getAllCategories());
		model.addAttribute("newestNews", newsService.getAllNewsSplitByPages(1, 5));
		model.addAttribute("newsList1", newsService.getNewsByCidSplitByPages(1, 7, 5));
		model.addAttribute("newsList2", newsService.getNewsByCidSplitByPages(1, 7, 4));
		model.addAttribute("newsList3", newsService.getNewsByCidSplitByPages(1, 7, 3));
		model.addAttribute("newsList4", newsService.getNewsByCidSplitByPages(1, 7, 2));
		model.addAttribute("newsList5", newsService.getNewsByCidSplitByPages(1, 7, 1));
		model.addAttribute("news", result);
		model.addAttribute("cname", categoryService.getCategoryById(result.getCid()).getName());
		return "frontdetailed";
	}
	
	@RequestMapping("/frontcategory.do")
	public String getNewsByCid(Integer cid , Integer page, ModelMap model) {
		System.out.println(cid==null);
		List<Category> allCategories = categoryService.getAllCategories();
		List<News> results;
		int pageCount;
		if (cid==null) {
			pageCount = newsService.getAllNewsPageCount(20);
			System.out.println(pageCount);
			if (page==null) {
				page = new Integer(1);
				results = newsService.getAllNewsSplitByPages(1, 20);
			} else {
				if (page.intValue()>pageCount) 
					page = new Integer(pageCount);
				if (page.intValue()<1) 
					page = new Integer(1);
				System.out.println(page);
				results = newsService.getAllNewsSplitByPages(page.intValue(), 20);
			}
		} else {
			Category currCategory = categoryService.getCategoryById(cid);
			pageCount = newsService.getNewsPageCountByCid(cid, 20);
			System.out.println(newsService.getNewsPageCountByCid(cid, 20));
			if (page==null) {
				page = new Integer(1);
				results = newsService.getNewsByCidSplitByPages(1, 20, cid.intValue());
			} else {
				if (page.intValue()>pageCount) 
					page = new Integer(pageCount);
				if (page.intValue()<1) 
					page = new Integer(1);
				System.out.println(page);
				results = newsService.getNewsByCidSplitByPages(page.intValue(), 20, cid.intValue());
			}
			model.addAttribute("cid", currCategory.getId());
			model.addAttribute("cname", currCategory.getName());
		}
		model.addAttribute("newestNews", newsService.getAllNewsSplitByPages(1, 5));
		model.addAttribute("newsList1", newsService.getNewsByCidSplitByPages(1, 7, 5));
		model.addAttribute("newsList2", newsService.getNewsByCidSplitByPages(1, 7, 4));
		model.addAttribute("newsList3", newsService.getNewsByCidSplitByPages(1, 7, 3));
		model.addAttribute("newsList4", newsService.getNewsByCidSplitByPages(1, 7, 2));
		model.addAttribute("newsList5", newsService.getNewsByCidSplitByPages(1, 7, 1));
		model.addAttribute("currPage", page);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("cnews", results);
		model.addAttribute("allCategories", allCategories);
		return "frontcategory";
	}
	
	@RequestMapping("/newestnews/{page}.html")
	public String getNewestNews(@PathVariable Integer page, ModelMap model) {
		return getNewsByCid(null, page, model);
	}
	
	@RequestMapping("/searchnews.php")
	public String searchNews(Integer pageNo, String keywords, ModelMap model) {
		int pageCount = newsService.getSearchNewsPageCount(keywords, 10);
		if (pageNo==null||pageNo.intValue()<1) pageNo=1;
		if (pageNo.intValue()>pageCount) pageNo=pageCount;
		model.addAttribute("keywords", keywords);
		model.addAttribute("resultCount", newsService.getSearchNewsCount(keywords));
		model.addAttribute("newsList", newsService.getSearchNewsSplitByPages(pageNo, 10, keywords));
		model.addAttribute("pageNo", pageNo.intValue());
		model.addAttribute("pageCount", pageCount);
		return "frontsearchresult";
	}
	
	@RequestMapping(value="/mobile")
	public String mobileList(Integer cid, Integer pageNo, ModelMap model) {
		int pageCount;
		model.addAttribute("allCategories", categoryService.getAllCategories());
		if (cid!=null) {
			pageCount = newsService.getNewsPageCountByCid(cid, 20);
			if (pageNo==null||pageNo.intValue()<1) {
				model.addAttribute("allnews", newsService.getNewsByCidSplitByPages(1, 20, cid));
				pageNo = new Integer(1);
			}
			if (pageNo.intValue()>pageCount) {
				pageNo = new Integer(pageCount);
				model.addAttribute("allnews", newsService.getNewsByCidSplitByPages(pageNo.intValue(), 20, cid));
			} else {
				model.addAttribute("allnews", newsService.getNewsByCidSplitByPages(pageNo.intValue(), 20, cid));
			}
			model.addAttribute("cname", categoryService.getCategoryById(cid).getName());
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageNo", pageNo);
		} else {
			pageCount = newsService.getAllNewsPageCount(20);
			if (pageNo==null||pageNo.intValue()<1) {
				model.addAttribute("allnews", newsService.getAllNewsSplitByPages(1, 20));
				pageNo = new Integer(1);
			}
			if (pageNo.intValue()>pageCount) {
				pageNo = new Integer(pageCount);
				model.addAttribute("allnews", newsService.getAllNewsSplitByPages(pageNo, 20));
			} else {
				model.addAttribute("allnews", newsService.getAllNewsSplitByPages(pageNo, 20));
			}
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("pageNo", pageNo);
		}
		return "index_m";
	}
	
	@RequestMapping("/mobile/{id}")
	public String getMobileNews(@PathVariable Integer id, Integer isAutoPlay, ModelMap model) {
		if (isAutoPlay!=null && isAutoPlay.intValue()==1) model.addAttribute("isAutoPlay", isAutoPlay.intValue());
		News result = newsService.getNewsById(id);
		model.addAttribute("allCategories", categoryService.getAllCategories());
		model.addAttribute("news", result);
		model.addAttribute("cname", categoryService.getCategoryById(result.getCid()).getName());
		model.addAttribute("newestNews", newsService.getAllNewsSplitByPages(1, 5));
		return "frontdetailed_m";
	}
	
	@RequestMapping("/searchnews_m.php")
	public String searchNews_m(Integer pageNo, String keywords, ModelMap model) {
		int pageCount = newsService.getSearchNewsPageCount(keywords, 10);
		if (pageNo==null||pageNo.intValue()<1) pageNo=1;
		if (pageNo.intValue()>pageCount) pageNo=pageCount;
		model.addAttribute("allCategories", categoryService.getAllCategories());
		model.addAttribute("keywords", keywords);
		model.addAttribute("resultCount", newsService.getSearchNewsCount(keywords));
		model.addAttribute("newsList", newsService.getSearchNewsSplitByPages(pageNo, 10, keywords));
		model.addAttribute("pageNo", pageNo.intValue());
		model.addAttribute("pageCount", pageCount);
		return "frontsearch_m";
	}
	
}
