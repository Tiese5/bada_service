package com.badaservice.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;

/**
 * Servlet implementation class message_send
 */
@WebServlet("/message_send.do")
public class message_send extends BaseController {
	private static final long serialVersionUID = -3022851980472374394L;
	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		
		String receiverName = web.getString("receiverName");
		return "/message/message_send";
	}

}
