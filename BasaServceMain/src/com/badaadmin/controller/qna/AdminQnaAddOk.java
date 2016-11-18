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
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;

@WebServlet("/admin/qna_add_ok.do")
public class AdminQnaAddOk extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;
	PageHelper pageHelper;
	UploadHelper upload;
	AdminQNACommon qna;
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
		qna = AdminQNACommon.getInstance();
		regex = RegexHelper.getInstance();
		
		/*Member loginInfo = (Member) web.getSession("loginInfo");*/
		/*로그인후 이용해주세요*/
		/*if (web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() +"/index.do","로그인 후에 이용 가능합니다");
			return null;
		}*/
		
		/*파라미터 받기*/
		int qnaId = web.getInt("qna_id");
		String category = web.getString("category");
		String aContent = web.getString("aContent");
		String title = web.getString("title");
		String qContent = web.getString("qContent");
		int writerId = web.getInt("writer_id");
		/*int writerId = loginInfo.getId();*/
		
		
		/*로그로 검사*/
		
		
		logger.debug("aContent="+aContent);
		/*카테고리값 전달*/
		request.setAttribute("category", category);
		/*유효성검사*/
		//제목 선택검사
		
		
		//내용입력여부검사
		if(!regex.isValue(aContent)){
			web.redirect(null, "내용을 입력하세요");
			return null;
		}
		/*입력받은값 빈즈에 넣기*/
		Qna qna = new Qna();
		qna.setId(qnaId);
		qna.setaContent(aContent);
		qna.setTitle(title);
		qna.setCategory(category);
		qna.setqContent(qContent);
		qna.setWriterId(writerId);
		logger.debug("QNA="+qna.toString());
		
		try {
			qnaService.insertAdminQna(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
		}
		String url = web.getRootPath()+"/admin/qna.do";
		web.redirect(url, "작성완료");
		
		
		return null;
	}

}
