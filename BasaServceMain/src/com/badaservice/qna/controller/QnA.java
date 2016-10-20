package com.badaservice.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.document.service.QnaService;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.service.impl.QnaServiceImpl;

@WebServlet("/document/qna.do")
public class QnA extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;
	PageHelper pageHelper;
	UploadHelper upload;
	QNACommon qna;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		upload = UploadHelper.getInstance();
		qnaService = new QnaServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		qna = QNACommon.getInstance();
		/*카테고리값 받기*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		return "/qna/qna";
		
		
	}

}
