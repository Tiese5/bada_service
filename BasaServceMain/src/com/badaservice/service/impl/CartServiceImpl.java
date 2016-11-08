package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.controller.shop.cart;
import com.badaservice.model.Cart;
import com.badaservice.model.messenger;
import com.badaservice.service.CartService;

public class CartServiceImpl implements CartService {
		Logger logger;
	SqlSession sqlsession;
	
	
	public CartServiceImpl(Logger logger, SqlSession sqlsession) {
		
		this.logger = logger;
		this.sqlsession = sqlsession;
	}
	@Override
	public void insertCart(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		try{
			result = sqlsession.insert("CartMapper.insertCart",cart);
			if(result == 0){
				throw new NullPointerException();}
		}catch (NullPointerException e) {
			sqlsession.rollback();
			throw new Exception("저장된 상품정보가 없습니다.");
		}catch (Exception e) {
			sqlsession.rollback();
			e.printStackTrace();
			throw new Exception("상품 저장에 실패했습니다.");
		}finally {
			sqlsession.commit();
		}
		
		}
		

	@Override
	public List<Cart> selectItemList(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		List<Cart> result = null;
		
		try{
			result = sqlsession.selectList("CartMapper.selectItemList",cart);
			if(result==null){
				throw new NullPointerException();}
			}catch (NullPointerException e) {
				// TODO: handle exception
				throw new Exception("선택된 상품 리스트가 없습니다.");
			}catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
				throw new Exception("상품 리스트 조회에 실패했습니다.");
			}
		
		
		return result;
	}
	@Override
	public int selectItemCount(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		try{
		result = sqlsession.selectOne("CartMapper.selectItemCount",cart);
		if(result==0){
			throw new NullPointerException();}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("장바구니에 저장된 상품이 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			throw new Exception("장바구니 조회에 실패했습니다.");
		}
		return result;
	}
	@Override
	public void deleteCartItem(Cart cart) throws Exception {
		// TODO Auto-generated method stub
	
		try{
			int result = sqlsession.delete("CartMapper.deleteCartItem",cart);
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				// -->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQl 수행 내역을 되돌림
			sqlsession.rollback();
			throw new Exception("삭제할 게시물이 없습니다");

		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlsession.rollback(); // SQl문 문법에러 제약조건
			e.printStackTrace();
			throw new Exception("게시물 삭제에 실패했습니다");

		} finally {
			// 입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
			sqlsession.commit();
			// 데이터 베이스 접속 해제
		}
	}
	@Override
	public List<Cart> selectCartList(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		List<Cart> result = null;
		
		try{
			result = sqlsession.selectList("CartMapper.selectCartList",cart);
			if(result==null){
				throw new NullPointerException();}
			}catch (NullPointerException e) {
				// TODO: handle exception
				throw new Exception("선택된 상품 리스트가 없습니다.");
			}catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
				throw new Exception("상품 리스트 조회에 실패했습니다.");
			}
		
		
		return result;
	}

}
