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
	private String itemTitle;
	private int price;
	private String regData;
	private String itemImg;
	private String sellerName;
	
	private int limitStart;
	private int listCount;

	
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
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

	@Override
	public String toString() {
		return "ItemOrder [id=" + id + ", memberId=" + memberId + ", userId=" + userId + ", postcode=" + postcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", email=" + email + ", tel=" + tel
				+ ", itemTitle=" + itemTitle + ", price=" + price + ", regData=" + regData + ", itemImg=" + itemImg
				+ ", sellerName=" + sellerName + ", limitStart=" + limitStart + ", listCount=" + listCount + "]";
	}
	
	
}
