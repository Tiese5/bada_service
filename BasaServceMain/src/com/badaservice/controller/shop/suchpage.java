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
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class suchpage
 */
@WebServlet("/shop/suchpage.do")
public class suchpage extends BaseController {
	private static final long serialVersionUID = -8100384514899703268L;
	WebHelper web;
	ItemCategory itemCategory;
	Logger logger;
	SqlSession sqlSession;
	PageHelper pageHelper;
	UploadHelper upload;
	ShopService shopService;
	DropDown dropDown;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		itemCategory = ItemCategory.getInstance();
		shopService = new ShopServiceImpl(sqlSession, logger);
		dropDown = DropDown.getInstance();
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		String dropdown = web.getString("drop_down");
		request.setAttribute("category", category);	
		
		
		/* 조회할 정보에 대한 빈즈 생성 **/
		String keyword = web.getString("keyword");
		Shop shop = new Shop();
		shop.setCategory(category);
		shop.setDropDown(dropdown);
		// 현재 페이지 수 ->> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다
		shop.setItem_title(keyword);
		shop.setContent(keyword);

		/** 게시물 목록 조회 */
		List<Shop> shopList = null;
		List<Shop> allList = null;
		int totalCaCount = 0;
		
		
		try {
			// 전체 게시물 수
			totalCaCount = shopService.selectCaItemCount(shop);
				
			// 현제페이지 번호 계산하기
			// --->현제 페이지,전체 페이지 수, 한 페이지 목록 수, 그룹 갯수
			pageHelper.pageProcess(page, totalCaCount, 8, 5);
			// 페이지 현제 번호 계산 결과에서 Limit절에 필요한 값을 빈즈에 추가
			shop.setLimitStart(pageHelper.getLimitStart());
			shop.setListCount(pageHelper.getListCount());
			
			if (category=="1"||category=="2"||category=="3"||category=="4") {
				shopList = shopService.selectItemCategoryList(shop);	
			}else{
				shopList = shopService.selectItemList(shop);
			}
			
					
				
				
			
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();

			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("shopList", shopList);
		request.setAttribute("dropDown", dropdown);
		request.setAttribute("pageHelper", pageHelper);
		request.setAttribute("totalCount", totalCaCount);
		request.setAttribute("allList", allList);
		
		return "/shop/suchpage";
	}


}
