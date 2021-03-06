package com.badaservice.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.Member;
import com.badaservice.model.MemberName;
import com.badaservice.model.Shop;
import com.badaservice.service.CartService;
import com.badaservice.service.MemberNameService;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.CartServiceImpl;
import com.badaservice.service.impl.MemberNameServiceImpl;
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
	MemberNameService memberNameService;
	Logger logger;
	SqlSession sqlSession;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web=WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		shopService = new ShopServiceImpl(sqlSession, logger);
		cartService = new CartServiceImpl(logger, sqlSession);
		memberNameService = new MemberNameServiceImpl(sqlSession, logger);
		
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		
		int Id = web.getInt("id");
		int myId = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			myId = loginInfo.getId();
			}
		
		Cart cart = new Cart();
		cart.setMyId(myId);
		
		MemberName memberName = new MemberName();
		memberName.setId(Id);
		
		Shop shop = new Shop();
		shop.setId(Id);
		logger.debug("id = " + Id);
		
		MemberName readItem = null;
		Shop sh = null;
		List<Cart> cartList = null;
		try {
			sh=shopService.selectCartItemList(shop);
			cartList = cartService.selectCartList(cart);
			readItem = memberNameService.selectItem(memberName);
			for(int i=0; i<cartList.size(); i++) {
				if(cartList.get(i).getItemId() == readItem.getId()) {
					sqlSession.close();
					web.redirect(null, "이미 장바구니에 담겨있습니다.");
					return null;
				} 
			}
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		

		cart.setId(sh.getId());
		cart.setItemTitle(sh.getItem_title());
		cart.setMemberId(sh.getMember_id());
		cart.setPrice(sh.getPrice());
		cart.setItemImage(sh.getItem_image());
		cart.setMyId(myId);
		cart.setItemId(sh.getId());
		
		
		logger.debug("id="+cart.getId());
		logger.debug("Item_title="+cart.getItemTitle());
		logger.debug("MemberId="+cart.getMemberId());
		logger.debug("Price="+cart.getPrice());
		logger.debug("Item_image="+cart.getItemImage());
		logger.debug("Myid="+cart.getId());
		logger.debug("Itemid="+cart.getItemId());
		
		try {
			
			cartService.insertCart(cart);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		logger.debug("end");
		
		web.redirect(null,"해당 상품이 장바구니에 저장되었습니다.");
		
		
		
		
		
		return null; 
	}

}
