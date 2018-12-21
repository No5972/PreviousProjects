package io.github.no5972.webchatroom.services;

import java.util.Date;
import java.util.List;

import io.github.no5972.webchatroom.models.Message;

public interface MessageService {
	public List<Message> getNewMessages(Date begin);
	public void speak(int id, int targetId, String emotion, String content, String color);
}
