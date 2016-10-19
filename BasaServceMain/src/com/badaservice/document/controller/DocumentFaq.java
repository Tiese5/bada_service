package com.badaservice.document.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
@WebServlet("/document/faq_list.do")
public class DocumentFaq extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		return "/document/faq_list";
	}

}
