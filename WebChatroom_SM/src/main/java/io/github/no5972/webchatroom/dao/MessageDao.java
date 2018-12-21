package io.github.no5972.webchatroom.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import io.github.no5972.webchatroom.models.Message;

@Mapper
public interface MessageDao {
	public List<Message> getNewMessages(Date begin);
	public void insertMessage(
			@Param("issystem")int isSystem, 
			@Param("authorid")int authorId,
			@Param("date")Date date,
			@Param("emotion")String emotion,
			@Param("targetid")int targetId,
			@Param("content")String content,
			@Param("color")String color);
}
