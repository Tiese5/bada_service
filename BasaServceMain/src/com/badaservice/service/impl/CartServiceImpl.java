package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.Cart;
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
			result = sqlsession.insert("CartMapper.inserCart");
			if(result == 0){
				throw new NullPointerException();}
		}catch (NullPointerException e) {
			// TODO: handle exception
			throw new Exception("저장된 상품정보가 없습니다.");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception("상품 저장에 실패했습니다.");
		}
		
		}
		

	@Override
	public List<Cart> selectItemList(Cart cart) throws Exception {
		// TODO Auto-generated method stub
		List<Cart> result = null;
		
		try{
			result = sqlsession.selectList("CartMapper.selectItemList");
			if(result==null){
				throw new NullPointerException();}
			}catch (NullPointerException e) {
				// TODO: handle exception
				throw new Exception("선택된 상품 리스트가 없습니다.");
			}catch (Exception e) {
				// TODO: handle exception
				throw new Exception("상품 리스트 조회에 실패했습니다.");
			}
		
		
		return result;
	}

}
