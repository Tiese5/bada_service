package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;

/**
 * Servlet implementation class sale
 */
@WebServlet("/shop/item_add.do")
public class sale extends BaseController {
	private static final long serialVersionUID = -407841913444091929L;
	WebHelper web;
	ItemCategory itemcategory;
	SqlSession sqlSession;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		itemcategory = ItemCategory.getInstance();
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		/**존재하는 게시판인지 판별하기*/
		try {
			String categoryName = itemcategory.getItemCategory(category);
			request.setAttribute("categoryName", categoryName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
		sqlSession.close();
			return null;
		}
		
		
		return "/shop/sale";
	}

}
