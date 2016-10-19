package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class detail_infomation
 */
@WebServlet("/detail_infomation.do")
public class detail_infomation extends BaseController {
	private static final long serialVersionUID = 8762033538842386708L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "/shop/detail_infomation";
	}


}
