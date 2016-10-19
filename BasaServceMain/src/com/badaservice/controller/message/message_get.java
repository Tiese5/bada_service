package com.badaservice.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

/**
 * Servlet implementation class message_get
 */
@WebServlet("/message_get.do")
public class message_get extends BaseController {
	private static final long serialVersionUID = -3370403798071109586L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "/message/message_get";
	}


}
