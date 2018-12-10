package io.github.no5972.audiocms.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import io.github.no5972.audiocms.tool.GenerateAudio;
import io.github.no5972.connect.HibernateSessionFactory;
import io.github.no5972.models.News;

public class NewsDao {
	public List<News> selectListByTopId(int topId, int pageNo, int pageSize) {
		Session session = null;
		List<News> list = null;
		String hql = "from News where cid=" + topId + " order by createTime desc";
		if (topId==0) {
			hql = "from News order by createTime desc";
		}
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}
	public List<News> selectNewestNews() {
    	Session session = null;
    	List<News> news = null;
    	String hql="from News order by createTime desc";
    	try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(5);
			news = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return news;
	}
	public List<News> selectNewsByCid(int cid, int pageNo, int pageSize) {
		Session session = null;
		List<News> list = null;
		String hql = "from News where cid=" + cid + " order by createTime desc";
		if (cid==0) {
			hql = "from News order by createTime desc";
		}
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}
	public List<News> selectTopList(int topId) {
    	Session session = null;
    	List<News> news = null;
    	String hql="from News where category = "+topId+" order by createTime desc";
    	try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult(0);
			query.setMaxResults(7);
			news = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return news;
	}
	public int getPageCount(int topId, int pageSize) {
		Session session = null;
		String hql = "select count(id) from News where cid="+topId;
		if (topId==0) {
			hql = "select count(id) from News order by createTime desc";
		}
		int count = 0;
		int pageCount = 0;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			long temp = (Long)query.uniqueResult();
			count = (int)temp;
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		if (count % pageSize == 0) {
			pageCount = count / pageSize;
		} else {
			pageCount = count / pageSize + 1; 
		}
		return pageCount;
	}
    public News selectNews(int id) { 
    	Session session = null;
        String hql = "from News where id=" + id;
        News news = null;
        try {
        	session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql);
            news = (News) query.uniqueResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
       HibernateSessionFactory.closeSession();
       return news;
    }
    /**
     * @param keywords Split with spaces
     * @return
     */
    public List<News> searchNews(String keywords, int pageNo, int pageSize) {
		String hql_keywords="";
		String [] arr = keywords.split("\\s+");
		for (String ss : arr){
			ss = "%"+ss+"% ";
			hql_keywords+=ss;
		}
		String hql="from News where content like '"+ hql_keywords.substring(0, hql_keywords.length()-1) +"' order by createTime desc";
    	Session session = null;
    	List<News> list = null;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			query.setFirstResult((pageNo-1)*pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
			System.out.println(list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
    }
    /**
     * @param keywords Split with spaces
     * @return
     */
    public int getSearchPageCount(String keywords, int pageSize) {
    	Session session = null;
		String hql_keywords="";
		String [] arr = keywords.split("\\s+");
		for (String ss : arr){
			ss = "%"+ss+"% ";
			hql_keywords+=ss;
		}
		String hql="select count(id) from News where content like '"+ hql_keywords.substring(0, hql_keywords.length()-1) +"' order by createTime desc";
		int count = 0;
		int pageCount = 0;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			System.out.println(query.getQueryString());
			long temp = (Long)query.uniqueResult();
			count = (int)temp;
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		if (count % pageSize == 0) {
			pageCount = count / pageSize;
		} else {
			pageCount = count / pageSize + 1; 
		}
		return pageCount;
    }
    public int getSearchResultCount(String keywords) {
    	Session session = null;
		String hql_keywords="";
		String [] arr = keywords.split("\\s+");
		for (String ss : arr){
			ss = "%"+ss+"% ";
			hql_keywords+=ss;
		}
		String hql="select count(id) from News where content like '"+ hql_keywords.substring(0, hql_keywords.length()-1) +"' order by createTime desc";
		int count = 0;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			System.out.println(query.getQueryString());
			long temp = (Long)query.uniqueResult();
			count = (int)temp;
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return count;
    }
	 public void insertNews(News news) { 
	        Session session = null;
	        Transaction tx = null;
	        try {
	        	session = HibernateSessionFactory.getSession();
	            tx = session.beginTransaction();
	            session.save(news);
	            //GenerateAudio.GenerateById(news.getId(), news.getContent());
	            System.setProperty("currentNewsId", ((Integer) news.getId()).toString());
	            GenerateAudio audio = new GenerateAudio(news.getId(), news.getContent());
	            audio.start();
	            tx.commit();
	        } catch (Exception e) {
	            System.out.println("插入文章出错：" + e);
	        } finally {
	            HibernateSessionFactory.closeSession();
	        }
	    }
	public void deleteNews(int id) {
		// TODO Auto-generated method stub
        Session session = null;
        Transaction tx = null;
        try {
        	session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            News news = (News) session.load(News.class, id);
            session.delete(news);
            tx.commit();
        } catch (Exception e) {
            System.out.println("删除文章出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();
        }
	}
	public void updateNews(News news) {
		// TODO Auto-generated method stub
        Session session = null;
        Transaction tx = null;
        try {
        	session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            News newNews = new News();
            newNews.setId(news.getId());
            newNews.setTitle(news.getTitle());
            newNews.setContent(news.getContent());
            newNews.setCreateTime(news.getCreateTime());
            newNews.setCategory(news.getCategory());
            session.update(newNews);
            System.setProperty("currentNewsId", ((Integer) newNews.getId()).toString());
            GenerateAudio audio = new GenerateAudio(newNews.getId(), newNews.getContent());
            audio.start();
            tx.commit();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println("修改数据出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();
        }
	}
}
