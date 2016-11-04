package com.badaservice.model;

public class SellerName extends ItemOrder{
	private String sellerName;

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	@Override
	public String toString() {
		return "SellerName [sellerName=" + sellerName + ", getId()=" + getId() + ", getItemTitle()=" + getItemTitle()
				+ ", getPrice()=" + getPrice() + ", getRegData()=" + getRegData() + ", getItemImg()=" + getItemImg()
				+ ", getMemberId()=" + getMemberId() + ", getUserName()=" + getUserName() + ", getPostcode()="
				+ getPostcode() + ", getAddr1()=" + getAddr1() + ", getAddr2()=" + getAddr2() + ", getEmail()="
				+ getEmail() + ", getTel()=" + getTel() + ", getState()=" + getState() + "]";
	}
	
}
