package com.badaservice.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class message
 */
@WebServlet("/message.do")
public class message extends BaseController {
	private static final long serialVersionUID = -3165659462670755911L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "/message/message";
	}

	
}
