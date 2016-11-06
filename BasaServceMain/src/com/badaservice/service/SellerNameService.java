package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Qna;
import com.badaservice.model.SellerName;

public interface SellerNameService {

	/**
	 * 게시글 목록 조회
	 * 
	 * @param document
	 *            -카테고리 정보가 저장된 빈즈
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<SellerName> selelctbuyList(SellerName sellerName) throws Exception;

	/**
	 * 전체 게시물 조횐
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectBuyCount(SellerName sellerName) throws Exception;

}
