package com.badaadmin.controller.qna;

import java.io.IOException;
import java.util.List;

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
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;

@WebServlet("/admin/qna.do")
public class AdminQnaList extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	QnaService qnaService;
	PageHelper pageHelper;
	AdminQNACommon qnaComm;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		qnaService = new QnaServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		qnaComm = AdminQNACommon.getInstance();
		
		/*Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() +"/index.do","로그인 후에 이용 가능합니다");
			return null;
		}*/
		
		/* 카테고리값 받기 */
		String category = web.getString("category");
		int writerId	= web.getInt("writer_id");
		request.setAttribute("category", category);
		request.setAttribute("writer_id", writerId);
		
		Qna qna = new Qna();
		int page = web.getInt("page", 1);

		/** 게시물 목록 조회 */
		int totalCount = 0;
		List<Qna> qnaList = null;
		try {
			// 전체 게시물 수
			totalCount = qnaService.selectQnaCount(qna);
			// 현제페이지 번호 계산하기
			// --->현제 페이지,전체 페이지 수, 한 페이지 목록 수, 그룹 갯수
			pageHelper.pageProcess(page, totalCount, 5, 5);
			// 페이지 현제 번호 계산 결과에서 Limit절에 필요한 값을 빈즈에 추가
			qna.setLimitStart(pageHelper.getLimitStart());
			qna.setListCount(pageHelper.getListCount());

			qnaList = qnaService.selelctQnaAllList(qna);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
		} 
		/**조회 결과를 뷰에 전달*/
		request.setAttribute("qnaList", qnaList);
		request.setAttribute("totalCount", totalCount);
		
		//페이지 번호 계산 결과를 뷰에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "admin/qna/qna_list";

	}

}
