package com.badaservice.model;

public class MemberName extends Shop{
	private String memberName;
	private String userId;
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "MemberName [memberName=" + memberName + ", userId=" + userId + ", getMemeberId()=" + getMemeberId()
				+ ", getLimitStart()=" + getLimitStart() + ", getListCount()=" + getListCount() + ", getDropDown()="
				+ getDropDown() + ", getItem_title()=" + getItem_title() + ", getHit()=" + getHit() + ", getCategory()="
				+ getCategory() + ", getId()=" + getId() + ", getContent()=" + getContent() + ", getPrice()="
				+ getPrice() + ", getReg_date()=" + getReg_date() + ", getItem_image()=" + getItem_image()
				+ ", getMember_id()=" + getMember_id() + "]";
	}
}
