package io.github.no5972.webchatroom.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.github.no5972.webchatroom.dao.MessageDao;
import io.github.no5972.webchatroom.models.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao messageDao;
	
	@Override
	public List<Message> getNewMessages(Date begin) {
		// TODO Auto-generated method stub
		return messageDao.getNewMessages(begin);
	}

	@Override
	public void speak(int id, int targetId, String emotion, String content, String color) {
		// TODO Auto-generated method stub
		messageDao.insertMessage(0, id, new Date(), emotion, targetId, content, color);
	}

}
