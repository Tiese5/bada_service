package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

@WebServlet("/member/out.do")
public class Out extends BaseController {

	private static final long serialVersionUID = 1739101230817433899L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "member/out";
	}

}
