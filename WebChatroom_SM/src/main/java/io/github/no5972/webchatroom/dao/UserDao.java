package io.github.no5972.webchatroom.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import io.github.no5972.webchatroom.models.User;

@Mapper
public interface UserDao {
	public List<User> getAllUsers();
	public User isNameExists(@Param("name")String name);
	public int login(@Param("name")String name);
	public void logout(@Param("id")int id);
}
