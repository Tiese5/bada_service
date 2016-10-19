package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
@WebServlet("/member/info_update.do")
public class InfoUpdate extends BaseController {

	private static final long serialVersionUID = 4349079243528795668L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "member/info_update";
	}

}
