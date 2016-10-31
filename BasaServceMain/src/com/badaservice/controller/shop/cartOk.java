package com.badaservice.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.Shop;
import com.badaservice.service.CartService;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.CartServiceImpl;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class buy
 */
@WebServlet("/shop/cart_ok.do")
public class cartOk extends BaseController {

	private static final long serialVersionUID = 3080838072812363339L;
	WebHelper web;
	ShopService shopService;
	CartService cartService;
	Logger logger;
	SqlSession sqlSession;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web=WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		shopService = new ShopServiceImpl(sqlSession, logger);
		cartService = new CartServiceImpl(logger, sqlSession);
		int Id = web.getInt("id");
		
		sqlSession.close();
		Shop shop = new Shop();
		shop.setId(Id);
		
		logger.debug("id = " + Id);
		
		Shop sh = null;
		try {
			sh=shopService.selectCartItemList(shop);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		Cart cart = new Cart();
		
		
		cart.setId(sh.getId());
		cart.setItemTitle(sh.getItem_title());
		cart.setMemberId(sh.getMember_id());
		cart.setPrice(sh.getPrice());
		cart.setItemImage(sh.getItem_image());
		
		logger.debug("id="+cart.getId());
		logger.debug("Item_title="+cart.getItemTitle());
		logger.debug("MemberId="+cart.getMemberId());
		logger.debug("Price="+cart.getPrice());
		logger.debug("Item_image="+cart.getItemImage());
		
		try {
			cartService.insertCart(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		
		web.redirect(null,"해당 상품이 장바구니에 저장되었습니다.");
		
		
		
		
		
		return null;
	}

}
