package com.badaservice.controller.shop;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class sale_bada
 */
@WebServlet("/sale_bada.do")
public class sale_bada extends BaseController {
	private static final long serialVersionUID = -2577585275732650295L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "/shop/sale_bada";
	}


}
