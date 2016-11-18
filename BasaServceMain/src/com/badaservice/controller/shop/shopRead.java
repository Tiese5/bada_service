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
import com.badaservice.service.MemberService;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.CartServiceImpl;
import com.badaservice.service.impl.MemberNameServiceImpl;
import com.badaservice.service.impl.MemberServiceImpl;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class detail_infomation
 */
@WebServlet("/shop/shop_read.do")
public class shopRead extends BaseController {
	private static final long serialVersionUID = 8762033538842386708L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	MemberNameService memberNameService;;
	MemberService memberService;
	CartService cartService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRemoteUser());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberNameService = new MemberNameServiceImpl(sqlSession, logger);
		memberService = new MemberServiceImpl(logger, sqlSession);
		cartService = new CartServiceImpl(logger, sqlSession);
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/shop/main.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);	
		
	
		/** 5)글번호 파라미터 받기 */
		int shopId = web.getInt("shop_id");
		logger.debug("shopId:" + shopId);
		int memberId = web.getInt("member_id");
		logger.debug("memberId:" + memberId);

		if (shopId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다");
			sqlSession.close();
			return null;
		}
		
		
		Member member = new Member();
		member.setId(memberId);
		MemberName memberName = new MemberName();
		memberName.setId(shopId);
		
		// 카테고리와 게시물 일련번호를 조합한 문자열을 생성
		String cookiekey = "shop" + "_" + shopId;
		// 준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookiekey);

		
		Shop readItem = null;
		Member readMember = null;
		
		
		
		try {
			// 쿠키값이 없다면 조회수 갱신
			if (cookieVar == null) {
				// 준비한 문자열에 대한 쿠키24시간 동안 저장
				web.setCookie(cookiekey, "Y", 60 * 60 * 24);
			}
		
			readItem = memberNameService.selectItem(memberName);
			readMember = memberService.selectMemberSendMessageList(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		request.setAttribute("shopId", shopId);
		request.setAttribute("readItem", readItem);
		request.setAttribute("readMember", readMember);
		
	

		return "/shop/detail_infomation";

	}
}
