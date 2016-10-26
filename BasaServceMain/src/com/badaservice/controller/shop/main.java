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
 * Servlet implementation class main
 */
@WebServlet("/shop/main.do")
public class main extends BaseController {
	private static final long serialVersionUID = 8402102792742769620L;
	WebHelper web;
	ItemCategory itemCategory;
	Logger logger;
	SqlSession sqlSession;
	PageHelper pageHelper;
	UploadHelper upload;
	ShopService shopService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		itemCategory = ItemCategory.getInstance();
		shopService = new ShopServiceImpl(sqlSession,logger);
		
		String category = web.getString("category");
		String dropName =web.getString("drop_down");
		int id= web.getInt("id");
		request.setAttribute("category", category);
		request.setAttribute("id", id);
		try {
			String bbsName = itemCategory.getItemCategory(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		/*조회할 정보에 대한 빈즈 생성**/
		
		Shop shop = new Shop();
		shop.setCategory(category);
		shop.setId(id);
		shop.setDropDown(dropName);
		/**게시물 목록 조회*/
		List<Shop> shopList = null;
		
		try {
			shopList=shopService.selectItemList(shop);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
		}
		request.setAttribute("shopList", shopList);
		
		return "/shop/main";
	}

}
