package com.badaservice.controller.shop;

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
import com.badaservice.model.Member;
import com.badaservice.model.Shop;
import com.badaservice.model.messenger;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class trade
 */
@WebServlet("/shop/trade.do")
public class trade extends BaseController {
	private static final long serialVersionUID = -6940745766762395207L;
	WebHelper web;
	SqlSession sqlSession;
	ShopService shopService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		shopService = new ShopServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		// item_title, price, reg_date, item_order --> username
		int memberId = 0;
		
		Shop shop = new Shop();
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		shop.setMember_id(memberId);
		
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		List<Shop> shopList = null;
		try {
			// 전체 게시물 수
			totalCount = shopService.selectItemCount(shop);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			shop.setLimitStart(pageHelper.getLimitStart());
			shop.setListCount(pageHelper.getListCount());
			logger.debug(pageHelper.toString());
			
			shopList = shopService.selectSellList(shop);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("shopList", shopList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		return "/shop/trade";
		
	}

}
