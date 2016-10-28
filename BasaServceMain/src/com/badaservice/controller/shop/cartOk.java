package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;

/**
 * Servlet implementation class buy
 */
@WebServlet("/shop/cart_ok.do")
public class cartOk extends BaseController {

	private static final long serialVersionUID = 3080838072812363339L;
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web=WebHelper.getInstance(request, response);
		
		
		return null;
	}

}
