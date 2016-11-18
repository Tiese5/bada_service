package com.badaservice.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
@WebServlet("/document/qna_view.do")
public class QnaView extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	SqlSession sqlSession;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		return "/document/qna_view";
	}

}
