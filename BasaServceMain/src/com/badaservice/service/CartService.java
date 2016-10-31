package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Cart;

public interface CartService {
	
	public void insertCart(Cart cart) throws Exception;
	
	public List<Cart> selectItemList(Cart cart) throws Exception;
}
