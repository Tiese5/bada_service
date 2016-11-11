package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Member;


public interface MemberService {
	public Member selectLoginInfo(Member member) throws Exception;
	/**관리자 로그인 */
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
	
	public void updateMemberPasswordByEmail(Member member) throws Exception;
	
	public String selectMemberId(Member member) throws Exception;
	
	public String selectMemberIdChange(Member member) throws Exception;
	
	public void updateMemberPassword(Member member) throws Exception;

	public Member selectMemberMessageList(Member member) throws Exception;
	
	public Member selectMemberSendMessageList(Member member) throws Exception;
	
	public Member selectSellerName(Member member) throws Exception;
	/**
	 * 일일 회원가입 자를 조회한다
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public int selectJoinIdCount(Member member)throws Exception;
	
	
}
