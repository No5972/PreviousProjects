package io.github.no5972.audiocms.dao;

import org.apache.ibatis.annotations.Param;
import io.github.no5972.audiocms.models.Manager;

/*
public class ManagerDao {
	public Manager getLogin(String account, String password) {
		System.out.println(account+password);
		String resource = "io/github/no5972/audiocms/dao/conf.xml";
		InputStream is = this.getClass().getClassLoader().getResourceAsStream(resource);
		SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
		SqlSession session = sessionFactory.openSession();
		Map<Object, Object> map =new HashMap<>();
		map.put("name", account);
		map.put("password", password);
		List<Manager> listManager = session.selectList("getLogin", map);
		
		return listManager.size() > 0 ? listManager.get(0) : null;
	}
}

*/

public interface ManagerDao {
	public Manager getLogin(@Param("name")String name, @Param("password")String password);
	public void updatePassword(@Param("id")int id, @Param("newPwd")String newPwd);
	public int getLoginCount(@Param("id")int id);
	public int getManagerId(@Param("account")String name);
	public void updateLoginCount(@Param("id")int id, @Param("newLoginCount")int count);
	public String getManagerAccount(@Param("id")int id);
}