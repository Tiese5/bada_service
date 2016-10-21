package com.badaservice.model;

public class Member {
	private int id;
	private String user_id;
	private String user_pw;
	private String name;
	private String email;
	private String birthdate;
	private String tel;
	private String postcode;
	private String addr1;
	private String addr2;
	private String profile_img;
	private String reg_date;
	private String edit_date;
	private String position;
	private String jo;
	private int limitStart;
	private int listCount;
	
	//tt
	public String getJo() {
		return jo;
	}
	public void setJo(String jo) {
		this.jo = jo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
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
	@Override
	public String toString() {
		return "Member [id=" + id + ", user_id=" + user_id + ", user_pw=" + user_pw + ", name=" + name + ", email="
				+ email + ", birthdate=" + birthdate + ", tel=" + tel + ", postcode=" + postcode + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", profile_img=" + profile_img + ", reg_date=" + reg_date + ", edit_date="
				+ edit_date + ", position=" + position + ", jo=" + jo + ", limitStart=" + limitStart + ", listCount="
				+ listCount + "]";
	}
	
	
}
