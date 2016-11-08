package com.badaservice.service;

import java.util.List;

import com.badaservice.controller.shop.cart;
import com.badaservice.model.Cart;
import com.badaservice.model.messenger;

public interface CartService {
	
	public void insertCart(Cart cart) throws Exception;
	
	public List<Cart> selectItemList(Cart cart) throws Exception;
	
	public int selectItemCount(Cart cart) throws Exception;
	
	public void deleteCartItem(Cart cart) throws Exception;
	
	public List<Cart> selectCartList(Cart cart) throws Exception;
}
