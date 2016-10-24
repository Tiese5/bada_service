package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.Member;
import com.badaservice.service.MemberService;

public class MemberServiceImpl implements MemberService {

		Logger logger;
		SqlSession sqlsession;
		
		
	public MemberServiceImpl(Logger logger, SqlSession sqlsession) {
			
			this.logger = logger;
			this.sqlsession = sqlsession;
		}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		// TODO Auto-generated method stub
		Member result = null;
		try{
			result=sqlsession.selectOne("MemberMapper.selectLoginInfo", member);
			if(result == null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("로그인 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception("로그인 정보 검색에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Member selectAdminLoginInfo(Member member) throws Exception {
		// TODO Auto-generated method stub
		Member result = null;
		try{
			result=sqlsession.selectOne("MemberMapper.selectAdminLoginInfo",member);
			if(result==null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("로그인 정보가 없습니다.");
		}catch(Exception e){
			e.printStackTrace();
			throw new Exception("로그인 정보 검색에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Member> selectMemberList(Member member) throws Exception {
		// TODO Auto-generated method stub
		List<Member> result= null;
		try{
			result=sqlsession.selectList("MemberMapper.selectMemberList",member);
			if(result==null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("로그인 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(); 
			throw new Exception("로그인 정보 검색에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Member selectMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		Member result = null;
		try{
			result=sqlsession.selectOne("MemberMapper.selectMember",member);
			if(result==null){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("조회된 데이터가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("회원조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectMemberCount(Member member) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try{
			result=sqlsession.selectOne("MemberMapper.selectMemberCount",member);
			if(result==0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("조회된 회원수가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("회원수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result=sqlsession.update("MemberMapper.updateMember",member);
			if(result==0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("수정할 회원 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("회원 수정에 실패했습니다.");
		}
		
	}

	@Override
	public void insertMember(Member member) throws Exception {
		// TODO Auto-generated method stub
		selectUserIdCount(member);
		selectEmailCount(member);

		try{
			int result = sqlsession.insert("MemberMapper.insertMember",member);
			if(result==0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("저장된 회원 정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("회원 저장에 실패했습니다.");
		}
		
	}

	@Override
	public void selectUserIdCount(Member member) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result=sqlsession.selectOne("MemberMapper.selectUserIdCount",member);
			if(result>0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("이미 사용중인 아이디 입니다.");
		}catch (Exception e) {
			// TODO: handle exception
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사에 실패했습니다.");
		}
	}

	@Override
	public void selectEmailCount(Member member) throws Exception {
		// TODO Auto-generated method st
		try{
			int result=sqlsession.selectOne("MemberMapper.selectEmailCount",member);
			if(result>0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("이미 사용중인 이메일 입니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("이메일 중복검사에 실패했습니다.");
		}
	}

	@Override
	public void selectUserPasswordCount(Member member) throws Exception {
		// TODO Auto-generated method stub
		try{
			int result = sqlsession.selectOne("MemberMapper.selectUserPasswordCount",member);
			if(result==0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("잘못된 비밀번호 입니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("비밀번호 검사에 실패했습니다.");
		}
		
	}

	@Override
	public void updateMemberOut(Member member) throws Exception {
		// TODO Auto-generated method stub
		
		try{
			int result = sqlsession.delete("Membermapper.updateMemberOut",member);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlsession.rollback();
			throw new Exception("이미 탈퇴된 회원 입니다.");
		}catch (Exception e){
			sqlsession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원탈퇴에 실패했습니다.");
		}finally{
			sqlsession.commit();
		}
	}

}
