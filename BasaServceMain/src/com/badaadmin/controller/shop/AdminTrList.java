package com.badaadmin.controller.shop;

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
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.ItemOrder;
import com.badaservice.model.Shop;
import com.badaservice.service.ItemorderService;
import com.badaservice.service.impl.ItemorderServiceImpl;
@WebServlet("/admin/shop/TrList")
public class AdminTrList extends BaseController{
	private static final long serialVersionUID = -1289039233563273690L;
	WebHelper web;
	ItemorderService itemorderService;
	SqlSession sqlSession;
	Logger logger;
	PageHelper pageHelper;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		pageHelper = PageHelper.getInstance();
		itemorderService = new ItemorderServiceImpl(logger, sqlSession);
		

		ItemOrder itemOrder = new ItemOrder();
		
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		List<ItemOrder> trList = null;
		try {
			// 전체 게시물 수
			totalCount = itemorderService.selectBuyCount(itemOrder);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			itemOrder.setLimitStart(pageHelper.getLimitStart());
			itemOrder.setListCount(pageHelper.getListCount());
			logger.debug(pageHelper.toString());
			
			trList = itemorderService.selectAdminItemList(itemOrder);
		} catch (Exception e) {	
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("trList", trList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		
		
		
		return "/admin/shop/TrList";
	}

	
}
