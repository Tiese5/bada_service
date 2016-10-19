package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;

@WebServlet("/member/id_search.do")
public class IdSerch extends BaseController {

	private static final long serialVersionUID = -7647768726677412627L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "member/id_search";
	}

}
