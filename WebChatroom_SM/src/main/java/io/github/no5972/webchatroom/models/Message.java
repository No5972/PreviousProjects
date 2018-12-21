package io.github.no5972.webchatroom.models;

import java.util.Date;

public class Message {
	private int id;
	private String emotion;
	private int authorid;
	private int targetid;
	private String content;
	private int issystem;
	private Date date;
	private String color;
	
	private String author;
	private String target;
	
	private Message() {}
	
	private static class MessageInstance {
		private final static Message instance = new Message();
	}
	
	public static Message getInstance() {
		return MessageInstance.instance;
	}
	public int getIssystem() {
		return issystem;
	}
	public void setIssystem(int issystem) {
		this.issystem = issystem;
	}
	public int getTargetid() {
		return targetid;
	}
	public void setTargetid(int targetid) {
		this.targetid = targetid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmotion() {
		return emotion;
	}
	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getAuthorid() {
		return authorid;
	}
	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
}
