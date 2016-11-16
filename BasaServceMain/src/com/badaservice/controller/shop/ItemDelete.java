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
import com.badaservice.model.Member;
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;


@WebServlet("/shop/item_delete.do")
public class ItemDelete extends BaseController{
	private static final long serialVersionUID = 4269016119798260551L;
	WebHelper web;
	SqlSession sqlSession;
	ShopService shopService;
	Logger logger;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger= LogManager.getFormatterLogger(request.getRequestURI());
		shopService = new ShopServiceImpl(sqlSession, logger);
		
		
		/**게시판 번호 받기*/
		int itemId = web.getInt("id");
		if (itemId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다");
			return null;
		}
		
		Shop shop = new Shop();
		shop.setId(itemId);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			shop.setMember_id(loginInfo.getId());
		}
		
		int ItemCount=0;
		
		try {
			ItemCount=shopService.selectItemCount(shop);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		/**7자신의 글에 대한 요청인지에 대한 여부를 view에 전달*/
		boolean myDocument = ItemCount>0;
		request.setAttribute("itemId", itemId);
		request.setAttribute("myDocument", myDocument);
		
		
		return "/shop/item_delete";
	}

}
