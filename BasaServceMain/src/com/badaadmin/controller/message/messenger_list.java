package com.badaadmin.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;


@WebServlet("/messenger_list.do")
public class messenger_list extends BaseController {
	private static final long serialVersionUID = 1724112781921752560L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "/admin/messenger/messenger_list";
	}
	

}
