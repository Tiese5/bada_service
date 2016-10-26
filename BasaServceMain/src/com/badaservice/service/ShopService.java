package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Shop;

public interface ShopService {

	/**
	 * 게시글 목록 조회
	 * @param document -카테고리 정보가 저장된 빈즈
	 * @return  List - 게시물 목록
	 * @throws Exception
	 */
	public List<Shop> selectItemList(Shop Item) throws Exception;
}
