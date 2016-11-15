package com.badaservice.model;

public class Chart extends ItemOrder {

	private String joinData;
	private int reg;
	private int jon;

	public String getJoinData() {
		return joinData;
	}

	public void setJoinData(String joinData) {
		this.joinData = joinData;
	}

	public int getReg() {
		return reg;
	}

	public void setReg(int reg) {
		this.reg = reg;
	}

	public int getJon() {
		return jon;
	}

	public void setJon(int jon) {
		this.jon = jon;
	}

	@Override
	public String toString() {
		return "Chart [joinData=" + joinData + ", reg=" + reg + ", jon=" + jon + ", getJoinData()=" + getJoinData()
				+ ", getReg()=" + getReg() + ", getJon()=" + getJon() + ", getSellerId()=" + getSellerId()
				+ ", getState()=" + getState() + ", getSellerName()=" + getSellerName() + ", getLimitStart()="
				+ getLimitStart() + ", getListCount()=" + getListCount() + ", getId()=" + getId() + ", getItemTitle()="
				+ getItemTitle() + ", getPrice()=" + getPrice() + ", getRegData()=" + getRegData() + ", getItemImg()="
				+ getItemImg() + ", getMemberId()=" + getMemberId() + ", getUserId()=" + getUserId()
				+ ", getPostcode()=" + getPostcode() + ", getAddr1()=" + getAddr1() + ", getAddr2()=" + getAddr2()
				+ ", getEmail()=" + getEmail() + ", getTel()=" + getTel() + "]";
	}

}
