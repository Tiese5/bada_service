package com.badaservice.model;

public class cart {
	private int id;
	private String editDate;
	private String content;
	private int price;
	private String itemTitle;
	private String itemImage;
	private int memberId;
	private String itemOrderId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getItemOrderId() {
		return itemOrderId;
	}
	public void setItemOrderId(String itemOrderId) {
		this.itemOrderId = itemOrderId;
	}
	@Override
	public String toString() {
		return "cart [id=" + id + ", editDate=" + editDate + ", content=" + content + ", price=" + price
				+ ", itemTitle=" + itemTitle + ", itemImage=" + itemImage + ", memberId=" + memberId + ", itemOrderId="
				+ itemOrderId + "]";
	}
	
	
	
}
