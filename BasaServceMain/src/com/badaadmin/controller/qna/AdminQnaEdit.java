package com.badaadmin.controller.qna;

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
@WebServlet("/admin/qna_edit.do")
public class AdminQnaEdit extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;
	AdminQNACommon qnacommon;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRemoteUser());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		qnacommon = AdminQNACommon.getInstance();
		qnaService = new QnaServiceImpl(sqlSession, logger);
		/**게시판 카테고리 값을 받아서 View에 전달*/
		String category = web.getString("category");
		request.setAttribute("category", category);
		/**글번호 파라미터 받기*/
		int qnaId=web.getInt("qna_id");
		logger.debug("qnaId:" +qnaId);
		
		if (qnaId ==0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다");
			sqlSession.close();
			return null;
		}
		/**파라미터 빈즈로 묶기*/
		Qna qna= new Qna();
		qna.setCategory(category);
		qna.setId(qnaId);
		
		/**게시물 일련번호를 사용할 데이터 조회*/
		Qna readQna = null;
		
		try {
			readQna = qnaService.selectQna(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
		}
		request.setAttribute("readQna",readQna);
		
		return "qna/qna_edit";
	}
}













