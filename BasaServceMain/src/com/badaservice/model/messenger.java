package com.badaservice.model;

public class messenger {
	private int id;
	private String content;
	private String regDate;
	private int senderId;
	private int receiverId;
	private String senderName;
	private String receiverName;
	
	
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
				+ ", receiverId=" + receiverId + ", senderName=" + senderName + ", receiverName=" + receiverName + "]";
	}
	
	
}
	
	

