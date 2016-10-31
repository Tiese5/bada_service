package com.badaservice.model;

public class Shop {
	private int id;
	private String item_title;
	private String content;
	private int price;
	private String reg_date;
	private String item_image;
	private int hit;
	private String category;
	private int memeberId;
	private int limitStart;
	private int listCount;

	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}

	public int getMemeberId() {
		return memeberId;
	}

	public void setMemeberId(int memeberId) {
		this.memeberId = memeberId;
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

	public String getDropDown() {
		return dropDown;
	}

	public void setDropDown(String dropDown) {
		this.dropDown = dropDown;
	}

	private String dropDown;
	private int member_id;

	public String getItem_title() {
		return item_title;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setItem_title(String item_title) {
		this.item_title = item_title;
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

	public String getItem_image() {
		return item_image;
	}

	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "Shop [id=" + id + ", item_title=" + item_title + ", content=" + content + ", price=" + price
				+ ", reg_date=" + reg_date + ", item_image=" + item_image + ", hit=" + hit + ", category=" + category
				+ ", memeberId=" + memeberId + ", limitStart=" + limitStart + ", listCount=" + listCount + ", dropDown="
				+ dropDown + ", member_id=" + member_id + "]";
	}

}
