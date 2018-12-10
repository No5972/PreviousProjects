package io.github.no5972.audiocms.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import io.github.no5972.connect.HibernateSessionFactory;
import io.github.no5972.models.Headline;

public class HeadlineDao {
	public int getHeadlineId() {
		Session session = null;
		Headline headline = null;
		String hql = "from Headline where id=1";
		try {
			session = HibernateSessionFactory.getSession();
            Query query = session.createQuery(hql);
            headline = (Headline) query.uniqueResult();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HibernateSessionFactory.closeSession();
		return headline.getValue();
	}
	public void setHeadlineId(int id) {
        Session session = null;
        Transaction tx = null;
        try {
        	session = HibernateSessionFactory.getSession();
            tx = session.beginTransaction();
            Headline newHeadline = new Headline();
            newHeadline.setId(1);
            newHeadline.setValue(id);
            session.update(newHeadline);
            tx.commit();
        } catch (Exception e) {
        	e.printStackTrace();
            System.out.println("修改头条出错：" + e);
        } finally {
            HibernateSessionFactory.closeSession();
        }
	}
}
