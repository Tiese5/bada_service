package com.badaservice.controller.shop;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.helper.BaseController;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.service.ShopService;

/**
 * Servlet implementation class sale
 */
@WebServlet("/sale_ok.do")
public class saleOk extends BaseController {
	private static final long serialVersionUID = 1387125215824808421L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	UploadHelper upload;
	RegexHelper regex;
	ItemCategory itemcategory;
	ShopService shopService;
	Shop
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		itemcategory = ItemCategory.getInstance();
		
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		/**존재하는 게시판인지 판별하기*/
		try {
			String categoryName = itemcategory.getItemCategory(category);
			request.setAttribute("categoryName", categoryName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		return "/shop/sale";
	}

}
