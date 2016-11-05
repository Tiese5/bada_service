package com.badaservice.service;

import com.badaservice.model.ItemOrder;
import com.badaservice.model.messenger;

public interface ItemorderService {
	/**
	 * 구매하다
	 * @param itemorder
	 * @throws Exception 
	 */
	public void insertItemOrder(ItemOrder itemorder) throws Exception;
}
