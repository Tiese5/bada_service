package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class suchpage
 */
@WebServlet("/suchpage.do")
public class suchpage extends BaseController {
	private static final long serialVersionUID = -8100384514899703268L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "/shop/suchpage";
	}


}
