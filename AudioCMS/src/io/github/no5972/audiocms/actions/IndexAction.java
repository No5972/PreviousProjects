package io.github.no5972.audiocms.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import io.github.no5972.audiocms.dao.CategoryDao;
import io.github.no5972.audiocms.dao.HeadlineDao;
import io.github.no5972.audiocms.dao.NewsDao;
import io.github.no5972.audiocms.tool.GenerateAudio;
import io.github.no5972.models.Category;
import io.github.no5972.models.News;

public class IndexAction extends ActionSupport {
	private NewsDao nd = new NewsDao();
	private CategoryDao cd = new CategoryDao();
	private HeadlineDao hd = new HeadlineDao();
	private List<News> newestNews;
	private List<News> newsList1;
	private List<News> newsList2;
	private List<News> newsList3;
	private List<News> newsList4;
	private List<News> newsList5;
	private List<Category> allCategories;
	private int headlineId;
	private News headlineNews;
	private News news;
	private int cid;
	private int pageNo;
	private int pageCount;
	private int topId;
	private int pageSize=20;
	private int isAutoPlay=0;
	private List<News> allnews;
	private List<News> cnews;
	@Override
	public String execute() throws Exception {
		allCategories = cd.selectListById();
		newestNews = nd.selectNewestNews();
		newsList1 = nd.selectTopList(5);
		newsList2 = nd.selectTopList(4);
		newsList3 = nd.selectTopList(3);
		newsList4 = nd.selectTopList(2);
		newsList5 = nd.selectTopList(1);
		headlineId = hd.getHeadlineId();
		headlineNews = nd.selectNews(headlineId);
		headlineNews.setContent(GenerateAudio.delHTMLTag(headlineNews.getContent()));
		System.out.println(headlineNews.getId());
		return SUCCESS;
	}
	public String getNewsById() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		newestNews = nd.selectNewestNews();
		newsList1 = nd.selectTopList(5);
		newsList2 = nd.selectTopList(4);
		newsList3 = nd.selectTopList(3);
		newsList4 = nd.selectTopList(2);
		newsList5 = nd.selectTopList(1);
		news = nd.selectNews(news.getId());
		String cname = news.getCategory().getName();
		request.getSession().setAttribute("cname", cname);
		request.getSession().setAttribute("cid", news.getCategory().getId());
		return "index_news";
	}
	public String getNewsList() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		newestNews = nd.selectNewestNews();
		newsList1 = nd.selectTopList(5);
		newsList2 = nd.selectTopList(4);
		newsList3 = nd.selectTopList(3);
		newsList4 = nd.selectTopList(2);
		newsList5 = nd.selectTopList(1);
		pageCount = nd.getPageCount(topId, pageSize);
		if (pageNo<1) {
			pageNo = 1;
		} else if (pageNo>pageCount) {
			pageNo = pageCount;
		}
		allnews = nd.selectListByTopId(topId, pageNo, pageSize);
		String topName = cd.selectName(topId);
		request.getSession().setAttribute("topId", topId);
		request.getSession().setAttribute("topName", topName);
		return "all_list";
	}
	public String getNewsByCid() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		newestNews = nd.selectNewestNews();
		newsList1 = nd.selectTopList(5);
		newsList2 = nd.selectTopList(4);
		newsList3 = nd.selectTopList(3);
		newsList4 = nd.selectTopList(2);
		newsList5 = nd.selectTopList(1);
		pageCount = nd.getPageCount(cid, pageSize);
		if (pageNo<1) {
			pageNo = 1;
		} else if (pageNo>pageCount) {
			pageNo = pageCount;
		}
		cnews = nd.selectNewsByCid(cid, pageNo, pageSize);
		String cname = cd.selectName(cid);
		request.getSession().setAttribute("cname", cname);
		return "cnews_list";
	}
	public String mobileIndex() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		if (pageNo<1) {
			pageNo = 1;
		} else if (pageNo>pageCount) {
			pageNo = pageCount;
		}
		pageCount = nd.getPageCount(topId, pageSize);
		allnews = nd.selectListByTopId(topId, pageNo, pageSize);
		for (News news:allnews) {
			news.setContent(GenerateAudio.delHTMLTag(news.getContent()));
		}
		String cname = "Ê×Ò³";
		if (topId!=0) {
			cname = cd.selectName(topId);
		}
		request.getSession().setAttribute("cid", topId);
		request.getSession().setAttribute("cname", cname);
		return "mobile_index";
	}
	public String getMobileNewsById() {
		HttpServletRequest request = ServletActionContext.getRequest();
		allCategories = cd.selectListById();
		news = nd.selectNews(news.getId());
		String cname = news.getCategory().getName();
		newestNews = nd.selectNewestNews();
		request.getSession().setAttribute("cname", cname);
		return "mobile_news";
	}
	public List<News> getNewestNews() {
		return newestNews;
	}
	public void setNewestNews(List<News> newestNews) {
		this.newestNews = newestNews;
	}
	public List<Category> getAllCategories() {
		return allCategories;
	}
	public void setAllCategories(List<Category> allCategories) {
		this.allCategories = allCategories;
	}
	public int getHeadlineId() {
		return headlineId;
	}
	public void setHeadlineId(int headlineId) {
		this.headlineId = headlineId;
	}
	public News getHeadlineNews() {
		return headlineNews;
	}
	public void setHeadlineNews(News headlineNews) {
		this.headlineNews = headlineNews;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public List<News> getNewsList1() {
		return newsList1;
	}
	public void setNewsList1(List<News> newsList1) {
		this.newsList1 = newsList1;
	}
	public List<News> getNewsList2() {
		return newsList2;
	}
	public void setNewsList2(List<News> newsList2) {
		this.newsList2 = newsList2;
	}
	public List<News> getNewsList3() {
		return newsList3;
	}
	public void setNewsList3(List<News> newsList3) {
		this.newsList3 = newsList3;
	}
	public List<News> getNewsList4() {
		return newsList4;
	}
	public void setNewsList4(List<News> newsList4) {
		this.newsList4 = newsList4;
	}
	public List<News> getNewsList5() {
		return newsList5;
	}
	public void setNewsList5(List<News> newsList5) {
		this.newsList5 = newsList5;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getTopId() {
		return topId;
	}
	public void setTopId(int topId) {
		this.topId = topId;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<News> getAllnews() {
		return allnews;
	}
	public void setAllnews(List<News> allnews) {
		this.allnews = allnews;
	}
	public List<News> getCnews() {
		return cnews;
	}
	public void setCnews(List<News> cnews) {
		this.cnews = cnews;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getIsAutoPlay() {
		return isAutoPlay;
	}
	public void setIsAutoPlay(int isAutoPlay) {
		this.isAutoPlay = isAutoPlay;
	}
}
