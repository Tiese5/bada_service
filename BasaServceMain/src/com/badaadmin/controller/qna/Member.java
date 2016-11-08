package com.badaadmin.controller.qna;

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
	private String join_date;
	private String join_edit;
	private String position;
	private String jo;
	private String new_user_pw;

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
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getJoin_edit() {
		return join_edit;
	}
	public void setJoin_edit(String join_edit) {
		this.join_edit = join_edit;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getJo() {
		return jo;
	}
	public void setJo(String jo) {
		this.jo = jo;
	}
	public String getNew_user_pw() {
		return new_user_pw;
	}
	public void setNew_user_pw(String new_user_pw) {
		this.new_user_pw = new_user_pw;
	}
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", user_id=" + user_id + ", user_pw=" + user_pw + ", name=" + name + ", email="
				+ email + ", birthdate=" + birthdate + ", tel=" + tel + ", postcode=" + postcode + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", profile_img=" + profile_img + ", join_date=" + join_date + ", join_edit="
				+ join_edit + ", position=" + position + ", jo=" + jo + ", new_user_pw=" + new_user_pw
				+ "]";
	}
	
	
}
