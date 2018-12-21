package io.github.no5972.webchatroom.controllers;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import io.github.no5972.webchatroom.models.Message;
import io.github.no5972.webchatroom.models.OperationResult;
import io.github.no5972.webchatroom.services.MessageService;

@RestController
@RequestMapping("/webchatroom")
public class MessageController {
	@Autowired
	private MessageService messageService;
	
	@RequestMapping("/getNewMessages")
	public @ResponseBody List<Message> getNewMessages(String begin) throws ParseException {
		return messageService.getNewMessages(new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(begin));
	}
	
	@RequestMapping("/speak")
	public @ResponseBody OperationResult speak(int id, String emotion, int targetId, String content, String color) {
		OperationResult result = OperationResult.getInstance();
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		if (id!=(int)request.getSession().getAttribute("userid")) {
			result.setSuccess(-1);
			result.setMsg("请求发送者和已登录发送者ID不一致");
			return result;
		}
		messageService.speak(id, targetId, emotion, content, color);
		return result;
	}
}
