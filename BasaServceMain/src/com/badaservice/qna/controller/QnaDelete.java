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
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;
@WebServlet("/qna/qna_delete_ok.do")
public class QnaDelete extends BaseController{
	private static final long serialVersionUID = -3579405670866209284L;
	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	QnaService qnaService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession= MyBatisConnectionFactory.getSqlSession();
		logger= LogManager.getFormatterLogger(request.getRequestURI());
		qnaService = new QnaServiceImpl(sqlSession, logger);
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		/**게시판 번호 받기*/
		int qnaId = web.getInt("qna_id");
		if (qnaId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다");
			return null;
		}
		//파라미터를 Beans로 묶기
		Qna qna = new Qna();
		qna.setId(qnaId);
		
		/**게시물 일련번호를 사용한 데이터 조회*/
		int qnaCount=0;
		
		try {
			qnaCount=qnaService.selectQnaCount(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}finally{
			sqlSession.close();
		}
		
		/**7자신의 글에 대한 요청인지에 대한 여부를 view에 전달*/
		request.setAttribute("qnaId", qnaId);
		
		
		return "qna/qna_delete";
	}

}
