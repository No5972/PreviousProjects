package io.github.no5972.audiocms.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import io.github.no5972.connect.HibernateSessionFactory;
import io.github.no5972.models.Category;

public class CategoryDao {
	public List<Category> selectListById() {
		Session session = null;
		String hql = "from Category order by id desc";
		System.out.println("query category");
		
		List<Category> list = null;
		try {
			session = HibernateSessionFactory.getSession();
			
			Query query = session.createQuery(hql);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return list;
	}
	public void insertCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			session.save(category);
			tx.commit();
		} catch (Exception e) {
			System.out.println("插入类别错误");
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	public Category selectCategory(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Category category = null;
		try {
			session = HibernateSessionFactory.getSession();
			category = (Category)session.get(Category.class, id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HibernateSessionFactory.closeSession();
		return category;
	}
	public void updateCategory(Category category) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Category newCategory = new Category();
			newCategory.setId(category.getId());
			newCategory.setName(category.getName());
			session.update(newCategory);
			tx.commit();
		} catch (Exception e) {
			System.out.println("修改类别错误");
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	public void deleteCategory(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateSessionFactory.getSession();
			tx = session.beginTransaction();
			Category category=(Category) session.load(Category.class, id);
			session.delete(category);
			tx.commit();
		} catch (Exception e) {
			System.out.println("删除类别错误");
			e.printStackTrace();
		} finally {
			HibernateSessionFactory.closeSession();
		}
	}
	public String selectName(int id) {
		// TODO Auto-generated method stub
		Session session = null;
		String hql = "select name from Category where id = " + id;
		String name = "";
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery(hql);
			name = (String)query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		HibernateSessionFactory.closeSession();
		return name;
	}
}
