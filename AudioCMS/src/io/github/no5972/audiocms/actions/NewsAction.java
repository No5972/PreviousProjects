package io.github.no5972.audiocms.actions;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.github.no5972.audiocms.dao.CategoryDao;
import io.github.no5972.audiocms.dao.HeadlineDao;
import io.github.no5972.audiocms.dao.NewsDao;
import io.github.no5972.audiocms.tool.Chinese;
import io.github.no5972.models.Category;
import io.github.no5972.models.Headline;
import io.github.no5972.models.News;

public class NewsAction extends ActionSupport {
	private News news;
	private Headline headline;
	private String categoryName;
	private NewsDao nd = new NewsDao();
	private CategoryDao cd = new CategoryDao();
	private HeadlineDao hd = new HeadlineDao();
	private List<News> newsList;
	private Chinese chinese = new Chinese();
	private String signStr = "";
	private int topId;
	private int cid;
	private int pageNo = 1;
	private int pageSize= 10;
	private int pageCount;
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		pageCount = nd.getPageCount(topId, pageSize);
		System.out.println("pagecount: "+pageCount);
		if (pageNo < 1) {
			pageNo = 1;
		} else if (pageNo > pageCount) {
			pageNo = pageCount;
		}
		List<Category> cList = cd.selectListById();
		request.setAttribute("cList", cList);
		newsList = nd.selectListByTopId(topId, pageNo, pageSize);
		categoryName = cd.selectName(topId);
		request.getSession().setAttribute("topId", topId);
		request.getSession().setAttribute("topName", categoryName);
		return "main";
	}
	public String getNewsById() {
		news = nd.selectNews(news.getId());
		if (signStr.equals("update")&&signStr!=null) {
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Category> cList = cd.selectListById();
			request.setAttribute("cList", cList);
			System.out.println(cList.size());
			return "update";
		} else {
			return "details";
		}
	}
	public String addInputNews() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Category> cList = cd.selectListById();
		request.setAttribute("cList", cList);
		this.setCid(topId);
		return "addInput";
	}
	public String addNews() {
		//TODO: Use Baidu API here
		System.out.println("Adding News");
		news.setCategory(cd.selectCategory(cid));
		news.setCreateTime(new Date());
		//GenerateAudio.GenerateById(, news.getContent());
		
		nd.insertNews(news);
		return SUCCESS;
	}
	public String delNews(){
		nd.deleteNews(news.getId());
		return SUCCESS;
	}
	public String updateNews() {
		//news.setCreateTime(new Date()); //更新不要修改发布时间
		news.setCategory(cd.selectCategory(cid));
		nd.updateNews(news);
		return SUCCESS;
	}
	public String updateHeadline() {
		hd.setHeadlineId(news.getId());
		return SUCCESS;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	public String getSignStr() {
		return signStr;
	}
	public void setSignStr(String signStr) {
		this.signStr = signStr;
	}
	public int getTopId() {
		return topId;
	}
	public void setTopId(int topId) {
		this.topId = topId;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
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
	public Headline getHeadline() {
		return headline;
	}
	public void setHeadline(Headline headline) {
		this.headline = headline;
	}
}
