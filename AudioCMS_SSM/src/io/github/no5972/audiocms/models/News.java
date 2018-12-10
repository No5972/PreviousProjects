package io.github.no5972.audiocms.models;

import java.util.Date;

public class News {
	private int id;
	private String title;
	private String content;
	private int audioCount;
	private Date createTime;
	private int cid;
	private String categoryName;
	private boolean isHeadline = false;
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
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public boolean isHeadline() {
		return isHeadline;
	}
	public void setHeadline(boolean isHeadline) {
		this.isHeadline = isHeadline;
	}

}
