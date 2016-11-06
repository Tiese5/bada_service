package com.badaservice.model;

public class ItemOrder {

	private int id;
	private int memberId;
	private String userId;
	private String postcode;
	private String addr1;
	private String addr2;
	private String email;
	private String tel;
	private String state;
	private String itemTitle;
	private int price;
	private String regData;
	private String itemImg;
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getRegData() {
		return regData;
	}
	public void setRegData(String regData) {
		this.regData = regData;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "ItemOrder [id=" + id + ", memberId=" + memberId + ", userId=" + userId + ", postcode=" + postcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", email=" + email + ", tel=" + tel + ", state=" + state
				+ ", itemTitle=" + itemTitle + ", price=" + price + ", regData=" + regData + ", itemImg=" + itemImg
				+ "]";
	}
	
	
}
