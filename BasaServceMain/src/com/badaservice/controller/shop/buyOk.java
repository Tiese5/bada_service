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
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.ItemOrder;
import com.badaservice.model.Member;
import com.badaservice.model.MemberName;
import com.badaservice.model.Shop;
import com.badaservice.service.CartService;
import com.badaservice.service.ItemorderService;
import com.badaservice.service.MemberNameService;
import com.badaservice.service.MemberService;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.CartServiceImpl;
import com.badaservice.service.impl.ItemorderServiceImpl;
import com.badaservice.service.impl.MemberNameServiceImpl;
import com.badaservice.service.impl.MemberServiceImpl;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class buy
 */
@WebServlet("/shop/buy_ok.do")
public class buyOk extends BaseController {
	private static final long serialVersionUID = 8466002060641398016L;
	WebHelper web;
	SqlSession sqlsession;
	Logger logger;
	CartService cartService;
	MemberService memberService;
	UploadHelper upload;
	MemberNameService membernameService;
	ItemorderService itemorderService;
	ShopService shopService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		sqlsession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		cartService = new CartServiceImpl(logger, sqlsession);
		memberService = new MemberServiceImpl(logger, sqlsession);
		upload = UploadHelper.getInstance();
		membernameService =  new MemberNameServiceImpl(sqlsession, logger);
		itemorderService = new ItemorderServiceImpl(logger, sqlsession);
		shopService = new ShopServiceImpl(sqlsession, logger);
		
		int myid = 0;
		String userId = null;
		int memberId = 0;
		int sellermemberId = 0;
		String state = null;
		
		if(web.getSession("loginInfo") == null) {
			sqlsession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}

		Member loginInfo = (Member) web.getSession("loginInfo");
		
		
		
		String addr1 = web.getString("addr1");
		String addr2 = web.getString("addr2");
		String postcode = web.getString("postcode");
		String email = null;
		String tel = null;
		
		
		if (loginInfo != null) {
			myid = loginInfo.getId();
			email = loginInfo.getEmail();
			tel = loginInfo.getTel();
			userId = loginInfo.getUser_id();
			logger.debug("Myid="+myid);
			logger.debug("email="+email);
			logger.debug("tel="+tel);
			}
		
		Cart cart = new Cart();
		cart.setMyId(myid);
		Cart deletecart = new Cart();
		Shop shop = new Shop();
		ItemOrder itemorder = new ItemOrder();
		Member member = new Member();
		Member seller = null;
		
		List<Cart> result= null;
		
		try {
			result= cartService.selectItemList(cart);
			for(int i=0; i<result.size(); i++) {
			member.setId(result.get(i).getMemberId());
			seller = memberService.selectSellerName(member);
			itemorder.setSellerName(seller.getName());
			itemorder.setUserId(userId);
			itemorder.setMemberId(result.get(i).getMemberId());
			itemorder.setItemTitle(result.get(i).getItemTitle());
			itemorder.setPrice(result.get(i).getPrice());
			itemorder.setItemImg(result.get(i).getItemImage());
			itemorder.setAddr1(addr1);
			itemorder.setAddr2(addr2);
			itemorder.setPostcode(postcode);
			itemorder.setEmail(email);
			itemorder.setTel(tel);
			itemorder.setState(state);
			logger.debug(itemorder.toString());
			itemorderService.insertItemOrder(itemorder);
			shop.setId(result.get(i).getItemId());
			shop.setUserId(userId);
			shopService.updateUserId(shop);
			deletecart.setId(result.get(i).getId());
			cartService.deleteCartItem(deletecart);
			
			}
		} catch (Exception e) {
			sqlsession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlsession.close();
		}
		
		
		request.setAttribute("cartList",result);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2); 
		request.setAttribute("postcode", postcode);
		
		
		String url = "%s/shop/cart.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, null);
		
		return null;
	}

}

