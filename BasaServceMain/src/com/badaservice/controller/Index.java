package com.badaservice.controller;

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
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;
@WebServlet("/index.do")
public class Index extends BaseController {
	private static final long serialVersionUID = 7065452114790381913L;
	SqlSession sqlSession;
	Logger logger;
	WebHelper web;
	ShopService shopService;
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	sqlSession = MyBatisConnectionFactory.getSqlSession();
	logger = LogManager.getFormatterLogger(request.getRequestURI());
	web = WebHelper.getInstance(request, response);
	shopService = new ShopServiceImpl(sqlSession, logger);
	
	String keyword = web.getString("keyword");
	Shop shop = new Shop();
	shop.setItem_title(keyword);
	shop.setContent(keyword);
	logger.debug("keyword=",keyword);
	List<Shop> shopList = null;
	
	try {
		shopList = shopService.selectItemList(shop);
	} catch (Exception e) {
		sqlSession.close();
		web.redirect(null, e.getLocalizedMessage());
		e.printStackTrace();
		return null;
	} finally {
		sqlSession.close();
	}
	
	request.setAttribute("shopList", shopList);
	
		// commit test
		// commit test
		return "index";
	}

}



