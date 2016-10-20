package com.badaservice.model;

public class Document {
	int id;
	String title;
	String content;
	String category;
	String regDate;
	String editDate;
	int writerId;
	
	
	
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
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
		return "DocumentModel [id=" + id + ", title=" + title + ", content=" + content + ", category=" + category
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", writerId=" + writerId + "]";
	}
	
	
}
