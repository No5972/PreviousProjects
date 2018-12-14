package io.github.no5972.audiocms.services;

import java.util.List;

import io.github.no5972.audiocms.models.News;

public interface NewsService {
	public List<News> getNewsByCid(int id);
	public List<News> getNewsByCidSplitByPages(int page, int pageSize, int cid);
	public List<News> getAllNewsSplitByPages(int page, int pageSize);
	public int getNewsPageCountByCid(int cid, int pageSize);
	public int getAllNewsPageCount(int pageSize);
	public void insertNews(String title, String content, int cid);
	public void deleteNews(int id);
	public News getNewsById(int id);
	public void updateNews(int id, String title, int cid, String content);
	public void setHeadline(int id);
	public News getHeadlineNews();
	public List<News> getSearchNewsSplitByPages(int page, int pageSize, String keywords);
	public int getSearchNewsPageCount(String keywords, int pageSize);
	public int getSearchNewsCount(String keywords);
}
