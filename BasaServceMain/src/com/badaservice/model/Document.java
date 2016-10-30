package com.badaservice.model;

public class Document {
	int id;
	String title;
	String content;
	String category;
	String regDate;
	String editDate;
	String writerName;
	
	// 페이지 구현을 위한 멤버변수
	private int limitStart;
	private int listCount;
	
	
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	
	@Override
	public String toString() {
		return "Document [id=" + id + ", title=" + title + ", content=" + content + ", category=" + category
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", writerName=" + writerName + ", limitStart="
				+ limitStart + ", listCount=" + listCount + "]";
	}
	
}
