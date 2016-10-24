package com.badaservice.model;

public class Qna {
	
	private	int id;
	private String title;
	private String qContent;
	private String regDate;
	private String editDate;
	private String category;
	private int writerId;
	private int answererId;
	private String aContent;
	
	private int qnaId;
	private int limitStart;
	private int listCount;
	
	private String qName;
	private String aName;
	
	
	
	public String getqName() {
		return qName;
	}
	public void setqName(String qName) {
		this.qName = qName;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public int getQnaId() {
		return qnaId;
	}
	public void setQnaId(int qnaId) {
		this.qnaId = qnaId;
	}
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
	public String getqContent() {
		return qContent;
	}
	public void setqContent(String qContent) {
		this.qContent = qContent;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getWriterId() {
		return writerId;
	}
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	public int getAnswererId() {
		return answererId;
	}
	public void setAnswererId(int answererId) {
		this.answererId = answererId;
	}
	public String getaContent() {
		return aContent;
	}
	public void setaContent(String aContent) {
		this.aContent = aContent;
	}
	@Override
	public String toString() {
		return "Qna [id=" + id + ", title=" + title + ", qContent=" + qContent + ", regDate=" + regDate + ", editDate="
				+ editDate + ", category=" + category + ", writerId=" + writerId + ", answererId=" + answererId
				+ ", aContent=" + aContent + ", qnaId=" + qnaId + ", limitStart=" + limitStart + ", listCount="
				+ listCount + ", qName=" + qName + ", aName=" + aName + "]";
	}
	
	
	
}
