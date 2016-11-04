package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.service.CartService;
import com.badaservice.service.impl.CartServiceImpl;

/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/shop/cart_delete_ok.do")
public class CartDelete extends BaseController {

	private static final long serialVersionUID = 7819124891032206925L;
	WebHelper web;
	SqlSession sqlSession;
	CartService cartService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		cartService = new CartServiceImpl(logger, sqlSession);
		
		int cartid = web.getInt("cartid");
		logger.debug("cartid=" + cartid);
		
		Cart cart = new Cart();
		cart.setId(cartid);
		
		try {
			cartService.deleteCartItem(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		
		String url = web.getRootPath()+"/shop/cart.do";
		web.redirect(url, "삭제 되었습니다");
		
		return null;
	}
	
	
}