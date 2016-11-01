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
	 * 장바구니에 넣을 아이템 조회
	 * @param shop
	 * @return
	 * @throws Exception
	 */
	
	public Shop selectCartItemList(Shop shop) throws Exception;
	
	/**
	 * 게시물을 등록한다
	 * @param document 등록한 게시물 일련번가호 저장된 빈즈
	 * @throws Exception
	 */
	public void insertItem(Shop shop) throws Exception;
	
	/**
	 * 전체 게시물 조횐
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectItemCount(Shop shop) throws Exception;
	/**
	 * 조회수를 1씩 증가시킨다
	 * @param document	현재글에 대한 게시물 번호가 저장된 빈즈
	 * @throws Exception
	 */
	public void updeteItemHit(Shop shop) throws Exception;
	
	/**
	 * 카테고리 + 상품 검색 목록 조회
	 * @param Shop -카테고리 정보가 저장된 빈즈
	 * @return  List - 게시물 목록
	 * @throws Exception
	 */
	public List<Shop> selectItemCategoryList(Shop shop) throws Exception;
	
	/**
	 * 카테고리별 전체 게시물 조회
	 * @param shop
	 * @return
	 * @throws Exception
	 */
	public int selectCaItemCount(Shop shop) throws Exception;
	
	
}
