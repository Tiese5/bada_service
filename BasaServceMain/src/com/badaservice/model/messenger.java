package com.badaservice.model;

public class messenger {
	private int id;
	private String content;
	private String reg_date;
	private int sender_id;
	private int reciver_id;
	
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public int getSender_id() {
		return sender_id;
	}
	public void setSender_id(int sender_id) {
		this.sender_id = sender_id;
	}
	public int getReciver_id() {
		return reciver_id;
	}
	public void setReciver_id(int reciver_id) {
		this.reciver_id = reciver_id;
	}
	@Override
	public String toString() {
		return "messenger [id=" + id + ", content=" + content + ", reg_date=" + reg_date + ", sender_id=" + sender_id
				+ ", reciver_id=" + reciver_id + "]";
	}
	
	
}
