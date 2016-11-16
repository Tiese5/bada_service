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


@WebServlet("/shop/item_delete_ok.do")
public class ItemDeleteOk extends BaseController{
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
		int itemId = web.getInt("item_id");
		logger.debug("itemId="+itemId);
		
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
		
		int documentCount=0;
		
		try {
			
			//Beans에 추가된 회원번호를 사용하셔 자신의 글임을 판변한다
			//--->자신의 글이 아니라면 비밀번호 검사
			if (shopService.selectItemCountMemberId(shop)==0) {
				web.redirect(null, "자신의 글이 아닙니다");
			} else if(shopService.selectItemCountMemberId(shop)>0) {
				shopService.deleteItem(shop);
				String url = web.getRootPath()+"/shop/main.do";
				web.redirect(url, "삭제 되었습니다");
			}
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		/**7자신의 글에 대한 요청인지에 대한 여부를 view에 전달*/
		boolean myDocument = documentCount>0;
		request.setAttribute("itemId", itemId);
		request.setAttribute("myDocument", myDocument);
		
		
		
	
		return null;
	}

}
