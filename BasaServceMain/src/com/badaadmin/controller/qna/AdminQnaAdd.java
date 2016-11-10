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

@WebServlet("/admin/qna_add.do")
public class AdminQnaAdd extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	AdminQNACommon qnaCommon;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		qnaCommon = AdminQNACommon.getInstance();
		logger = LogManager.getFormatterLogger(request.getRemoteUser());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		qnaService = new QnaServiceImpl(sqlSession, logger);
		/* 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);

		/** 5)글번호 파라미터 받기 */
		int qnaId = web.getInt("qna_id");
		int writerId = web.getInt("writer_id");
		String title = web.getString("title");
		logger.debug("qna_id:" + qnaId);

		if (qnaId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다");
			sqlSession.close();
			return null;
		}
		// 파라미터를 빈즈로 묶기
		Qna qna = new Qna();
		qna.setCategory(category);
		qna.setId(qnaId);
		qna.setWriterId(writerId);
		qna.setTitle(title);
		/**6)게시물 일련번호를 사용할 데이터 조회*/
		Qna readQna = null;
		
		try {
			readQna = qnaService.selectQna(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		request.setAttribute("readQna", readQna);
		request.setAttribute("qnaId",qnaId);
		request.setAttribute("title", title);
		
		return "/admin/qna/qna_add";
	}

}
