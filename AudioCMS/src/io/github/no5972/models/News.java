package io.github.no5972.models;
import java.util.Date;

public class News {
	private int id;
	private String title;
	private String content;
	private int audioCount;
	private Date createTime;
	private Category category;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAudioCount() {
		return audioCount;
	}
	public void setAudioCount(int audioCount) {
		this.audioCount = audioCount;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
