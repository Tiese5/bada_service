package com.badaadmin.controller.document;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.document.controller.BBSCommon;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;


/**
 * Servlet implementation class AdminDocumentWrite
 */
@WebServlet("/admin_document_write.do")
public class AdminDocumentWrite extends BaseController {
	private static final long serialVersionUID = -3968637655235576202L;
		WebHelper web;
		BBSCommon bbs;
		
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/admin_index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		return "/admin/document/admindocumentWrite";
	}


}
