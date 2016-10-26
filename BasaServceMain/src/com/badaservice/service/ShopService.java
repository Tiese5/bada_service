package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Shop;

public interface ShopService {

	/**
	 * 상품 목록 조회
	 * @param Shop -카테고리 정보가 저장된 빈즈
	 * @return  List - 게시물 목록
	 * @throws Exception
	 */
	public List<Shop> selectItemList(Shop shop) throws Exception;
	
	/**
	 * 게시물을 등록한다
	 * @param document 등록한 게시물 일련번가호 저장된 빈즈
	 * @throws Exception
	 */
	public void insertItem(Shop shop) throws Exception;
	
}
