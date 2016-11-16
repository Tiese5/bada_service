package com.badaadmin.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.ItemOrder;
import com.badaservice.model.messenger;
import com.badaservice.service.ItemorderService;
import com.badaservice.service.impl.ItemorderServiceImpl;

/**
 * Servlet implementation class AdminOrderSelect
 */
@WebServlet("/admin_order_select.do")
public class AdminOrderSelect extends BaseController {
	private static final long serialVersionUID = -7525535741469179168L;
	WebHelper web;
	SqlSession sqlSession;
	ItemorderService itemorderService;
	PageHelper pageHelper;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		itemorderService = new ItemorderServiceImpl(logger, sqlSession);
		pageHelper = PageHelper.getInstance();
		
		String state = web.getString("state");
		String juState = web.getString("juState");
		int id = web.getInt("id");
		
		logger.debug("state : " + state);
		logger.debug("juState : " + juState);
	
		ItemOrder itemorder = new ItemOrder();
		itemorder.setState(state);
		itemorder.setJuState(juState);
		itemorder.setId(id);
		
		
		List<ItemOrder> itemOrderList = null;
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		
		try {
			if(state != null) {
					itemorderService.updateItemOrder(itemorder);
			} else if(juState != null) {
					itemorderService.updateJuItemOrder(itemorder);
			}
			// 전체 게시물 수
			totalCount = itemorderService.selectAdminBuyCount(itemorder);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			itemorder.setLimitStart(pageHelper.getLimitStart());
			itemorder.setListCount(pageHelper.getListCount());
			logger.debug(pageHelper.toString());
			itemOrderList = itemorderService.selectOrderSelectList(itemorder);
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		
		request.setAttribute("itemOrderList", itemOrderList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		return "admin/shop/order_select";
	}


}
