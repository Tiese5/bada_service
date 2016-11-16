package com.badaservice.service;

import java.util.List;

import com.badaservice.model.ItemOrder;
import com.badaservice.model.SellerName;
import com.badaservice.model.Shop;
import com.badaservice.model.messenger;

public interface ItemorderService {
	/**
	 * 구매하다
	 * @param itemorder
	 * @throws Exception 
	 */
	public void insertItemOrder(ItemOrder itemorder) throws Exception;
	
	/**
	 * 구매내역을 조회한다
	 * @param shop - 판매내역 목록
	 * @return messenger - 읽어들인 판매목록 데이터
	 * @throws Exception
	 */
	public List<ItemOrder> selectBuyList(ItemOrder itemorder) throws Exception;
	
	/**
	 * 전체 게시물 조횐
	 * 
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectBuyCount(ItemOrder ItemOrder) throws Exception;
	
	
	

	/**
	 * 관리자 거래내역 조회
	 * @param shop
	 * @return
	 * @throws Exception
	 */
	public List<ItemOrder> selectAdminItemList(ItemOrder ItemOrder) throws Exception;
	
	/**
	 * 카테고리별 전체 게시물 조회
	 * @param shop
	 * @return
	 * @throws Exception
	 */
	public int selectAdminItemCount(ItemOrder ItemOrder) throws Exception;
	/**
	 * 일일 거래량 조회
	 * @param ItemOrder
	 * @return
	 * @throws Exception
	 */
	public int selectDayTrCount(ItemOrder ItemOrder) throws Exception;
	
	public void updateItemOrder(ItemOrder ItemOrder) throws Exception;
	
	public void updateJuItemOrder(ItemOrder ItemOrder) throws Exception;
	
	public List<ItemOrder> selectOrderSelectList(ItemOrder ItemOrder) throws Exception;
	
	public int selectAdminBuyCount(ItemOrder ItemOrder) throws Exception;
	
}
