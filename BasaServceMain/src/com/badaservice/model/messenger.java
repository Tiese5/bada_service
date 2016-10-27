package com.badaservice.model;

public class messenger {
	private int id;
	private String content;
	private String regDate;
	private int senderId;
	private int receiverId;
	private String senderName;
	private String receiverName;
	private String messageDelete;
	private String messageDeleteSend;
	
	// 페이지 구현을 위한 멤버변수
	private int limitStart;
	private int listCount;
	
	
	public String getMessageDeleteSend() {
		return messageDeleteSend;
	}
	public void setMessageDeleteSend(String messageDeleteSend) {
		this.messageDeleteSend = messageDeleteSend;
	}
	public String getMessageDelete() {
		return messageDelete;
	}
	public void setMessageDelete(String messageDelete) {
		this.messageDelete = messageDelete;
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
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}

	public int getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(int receiverId) {
		this.receiverId = receiverId;
	}
	@Override
	public String toString() {
		return "messenger [id=" + id + ", content=" + content + ", regDate=" + regDate + ", senderId=" + senderId
				+ ", receiverId=" + receiverId + ", senderName=" + senderName + ", receiverName=" + receiverName
				+ ", messageDelete=" + messageDelete + ", messageDeleteSend=" + messageDeleteSend + ", limitStart="
				+ limitStart + ", listCount=" + listCount + "]";
	}
	
	
}
	
	

