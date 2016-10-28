package com.badaservice.controller.shop;

import java.io.IOException;

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
import com.badaservice.model.MemberName;
import com.badaservice.model.Shop;
import com.badaservice.service.MemberNameService;
import com.badaservice.service.impl.MemberNameServiceImpl;

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

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRemoteUser());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberNameService = new MemberNameServiceImpl(sqlSession, logger);

		/** 5)글번호 파라미터 받기 */
		int shopId = web.getInt("shop_id");
		logger.debug("shopId:" + shopId);

		if (shopId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다");
			sqlSession.close();
			return null;
		}
		
		MemberName memberName = new MemberName();
		memberName.setId(shopId);
		
		// 카테고리와 게시물 일련번호를 조합한 문자열을 생성
		String cookiekey = "shop" + "_" + shopId;
		// 준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookiekey);
		Shop readItem = null;
		try {
			// 쿠키값이 없다면 조회수 갱신
			if (cookieVar == null) {
				// 준비한 문자열에 대한 쿠키24시간 동안 저장
				web.setCookie(cookiekey, "Y", 60 * 60 * 24);
			}
			
			readItem = memberNameService.selectItem(memberName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		request.setAttribute("shopId", shopId);
		request.setAttribute("readItem", readItem);

		return "/shop/detail_infomation";

	}
}
