package io.github.no5972.audiocms.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.audiocms.models.News;

public interface NewsDao {
	public List<News> selectNewsByCid(@Param("cid")int cid);
	public List<News> selectNewsByCidSplitByPages(@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize, @Param("cid")int cid);
	public List<News> selectAllNewsSplitByPages(@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize);
	public int getPageCountByCid(@Param("cid")int id, @Param("pageSize")int pageSize);
	public int getAllPageCount(@Param("pageSize")int pageSize);
	public int addNews(News news);
	public void deleteNews(@Param("id")int id);
	public News selectNewsById(@Param("id")int id);
	public void updateNews(@Param("id")int id, @Param("cid")int cid, @Param("title")String title, @Param("content")String content);
	public List<News> selectSearchNewsSplitByPages(@Param("beginIndex")int beginIndex, @Param("pageSize")int pageSize, @Param("keywords")String keywords);
	public int selectSearchNewsPageCount(@Param("keywords")String keywords, @Param("pageSize")int pageSize);
	public int selectSearchNewsCount(@Param("keywords")String keywords);
}
