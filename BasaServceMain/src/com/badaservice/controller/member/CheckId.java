package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;

@WebServlet("/member/check_id.do")
public class CheckId extends BaseController {

	private static final long serialVersionUID = -7647768726677412627L;
	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		String user_id = web.getString("user_id");
		
		request.setAttribute("user_id", user_id);
		
		return "member/check_id";
	}

}
