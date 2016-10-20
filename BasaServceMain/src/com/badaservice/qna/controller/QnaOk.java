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
import com.badaservice.helper.BaseController;
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;

@WebServlet("/document/qna_ok.do")
public class QnaOk extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;
	PageHelper pageHelper;
	UploadHelper upload;
	QNACommon qna;
	RegexHelper regex;
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
		regex = RegexHelper.getInstance();
		/*로그인후 이용해주세요*/
		/*if (web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() +"/index.do","로그인 후에 이용 가능합니다");
			return null;
		}*/
		
		/*파라미터 받기*/
		String title = web.getString("title");
		String category = web.getString("category");
		String qContent = web.getString("qContent");
		
		/*로그로 검사*/
		logger.debug("title="+title);
		logger.debug("category="+category);
		logger.debug("qContent="+qContent);
		/*카테고리값 전달*/
		request.setAttribute("category", category);
		/*유효성검사*/
		//제목 선택검사
		if(!regex.isValue(title)){
			web.redirect(null, "제목을 입력해주세요");
			return null;
		}
		//카테고리 선택검사
		if(!regex.isValue(category)){
			web.redirect(null, "카테고리를 선택해주세요");
			return null;
		}
		//내용입력여부검사
		if(!regex.isValue(qContent)){
			web.redirect(null, "내용을 입력하세요");
			return null;
		}
		/*입력받은값 빈즈에 넣기*/
		Qna qna = new Qna();
		qna.setqContent(qContent);
		qna.setTitle(title);
		logger.debug("QNA="+qna.toString());
		
		try {
			qnaService.insertQna(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
		}
		return null;
		
		
	}

}
