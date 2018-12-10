package io.github.no5972.audiocms.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.github.no5972.audiocms.dao.CategoryDao;
import io.github.no5972.audiocms.dao.NewsDao;
import io.github.no5972.audiocms.tool.GenerateAudio;
import io.github.no5972.models.Category;
import io.github.no5972.models.News;

public class NewsSearchAction extends ActionSupport {
	private int pageNo = 1;
	private int pageSize= 10;
	private int pageCount;
	private int resultCount;
	private String keywords;
	private List<News> newsList;
	private List<Category> allCategories;
	private NewsDao nd = new NewsDao();
	private CategoryDao cd = new CategoryDao();
	public String execute() {
		allCategories = cd.selectListById();
		resultCount = nd.getSearchResultCount(keywords);
		pageCount = nd.getSearchPageCount(keywords, pageSize);
		if (pageNo<1) {
			pageNo = 1;
		} else if (pageNo>pageCount) {
			pageNo = pageCount;
		}
		newsList = nd.searchNews(keywords, pageNo, pageSize);
		for (News news : newsList) {
			news.setContent(GenerateAudio.delHTMLTag(news.getContent()));
		}
		return "search_result";
	}
	public String mSearch() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		resultCount = nd.getSearchResultCount(keywords);
		pageCount = nd.getSearchPageCount(keywords, pageSize);
		if (pageNo<1) {
			pageNo = 1;
		} else if (pageNo>pageCount) {
			pageNo = pageCount;
		}
		newsList = nd.searchNews(keywords, pageNo, pageSize);
		for (News news : newsList) {
			news.setContent(GenerateAudio.delHTMLTag(news.getContent()));
		}
		request.getSession().setAttribute("keywords", keywords);
		return "mobile_search_result";
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	public List<Category> getAllCategories() {
		return allCategories;
	}
	public void setAllCategories(List<Category> allCategories) {
		this.allCategories = allCategories;
	}
	public int getResultCount() {
		return resultCount;
	}
	public void setResultCount(int resultCount) {
		this.resultCount = resultCount;
	}
}
