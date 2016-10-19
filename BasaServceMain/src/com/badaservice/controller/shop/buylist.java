package com.badaservice.controller.shop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class Index
 */
@WebServlet("/buylist.do")
public class buylist extends BaseController {
	private static final long serialVersionUID = 6616939128807193868L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "/shop/buylist";
	}

}
