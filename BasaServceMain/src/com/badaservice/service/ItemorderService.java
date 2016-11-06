package com.badaservice.service;

import java.util.List;

import com.badaservice.model.ItemOrder;
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
	 * 판매내역을 조회한다
	 * @param shop - 판매내역 목록
	 * @return messenger - 읽어들인 판매목록 데이터
	 * @throws Exception
	 */
	public List<Shop> selectSellList(Shop shop) throws Exception;
}
