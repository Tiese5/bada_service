package com.badaservice.model;

public class SellerName extends ItemOrder{
	private String sellerName;
	private String myId;
	
	
	

	public String getMyId() {
		return myId;
	}

	public void setMyId(String myId) {
		this.myId = myId;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	@Override
	public String toString() {
		return "SellerName [sellerName=" + sellerName + ", myId=" + myId + "]";
	}
	
}
