package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Member;


public interface MemberService {
	public Member selectLoginInfo(Member member) throws Exception;
	
	public Member selectAdminLoginInfo(Member member) throws Exception;
	
	public List<Member> selectMemberList(Member member) throws Exception;
	
	public Member selectMember(Member member) throws Exception;
	
	public int selectMemberCount(Member member) throws Exception;
	
	public void updateMember(Member member) throws Exception;
	
	public void insertMember(Member member) throws Exception;
	
	public void selectUserIdCount(Member member) throws Exception;
		
	public void selectEmailCount(Member member) throws Exception; 
	
	public void selectUserPasswordCount(Member member) throws Exception;
	
	public void updateMemberOut(Member member) throws Exception;
	

	
}
