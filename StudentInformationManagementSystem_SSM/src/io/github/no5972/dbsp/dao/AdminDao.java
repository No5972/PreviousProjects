package io.github.no5972.dbsp.dao;

import org.apache.ibatis.annotations.Param;

import io.github.no5972.dbsp.models.Admin;

public interface AdminDao {
	public Admin getLogin(@Param("username")String username, @Param("password")String password);
	public void updatePassword(@Param("username")String username, @Param("newPwd")String newPwd);
}