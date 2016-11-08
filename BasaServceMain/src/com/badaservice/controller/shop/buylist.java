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
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.ItemOrder;
import com.badaservice.model.Member;
import com.badaservice.model.SellerName;
import com.badaservice.service.ItemorderService;
import com.badaservice.service.SellerNameService;
import com.badaservice.service.impl.ItemorderServiceImpl;
import com.badaservice.service.impl.SellerNameServiceImpl;

/**
 * Servlet implementation class Index
 */
@WebServlet("/shop/buy_list_do")
public class buylist extends BaseController {
	private static final long serialVersionUID = 6616939128807193868L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	PageHelper pageHelper;
	UploadHelper upload;
	ItemorderService itemorderService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		itemorderService = new ItemorderServiceImpl(logger, sqlSession);	
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		String userId = loginInfo.getUser_id();
		logger.debug("userId="+userId);
	
		ItemOrder itemorder = new ItemOrder();
		itemorder.setUserId(userId);
		
		
		int page = web.getInt("page", 1);
		
		/** 게시물 목록 조회 */
		List<ItemOrder> buyList = null;
		
		int totalCount = 0;
		
		try {
			buyList = itemorderService.selectBuyList(itemorder);
			totalCount = itemorderService.selectBuyCount(itemorder);
			// 현제페이지 번호 계산하기
			// --->현제 페이지,전체 페이지 수, 한 페이지 목록 수, 그룹 갯수
			pageHelper.pageProcess(page, totalCount, 8, 5);
			// 페이지 현제 번호 계산 결과에서 Limit절에 필요한 값을 빈즈에 추가
			itemorder.setLimitStart(pageHelper.getLimitStart());
			itemorder.setListCount(pageHelper.getListCount());
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
		} finally{
			sqlSession.close();
		}
		
		request.setAttribute("buyList", buyList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		return "/shop/buylist";
	}
}
