package com.badaadmin.controller.document;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.document.controller.BBSCommon;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Document;
import com.badaservice.model.Member;
import com.badaservice.service.DocumentService;
import com.badaservice.service.impl.DocumentServiceImpl;



/**
 * Servlet implementation class AdminDocumentWriteOk
 */
@WebServlet("/admin_document_write_ok.do")
public class AdminDocumentWriteOk extends BaseController {
	private static final long serialVersionUID = -1834502835843337522L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	BBSCommon bbs;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.mysite.service.BbsDocumentService;
	DocumentService documentService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		regex = RegexHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.BbsDocumentServiceImpl;
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		String category = web.getString("category");
		String title = web.getString("title");
		String content = web.getString("content");
		String writerName = null;
		// 회원 일련번호 --> 비 로그인인 경우 0
		int memberId = 0;

		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			writerName = loginInfo.getName();
		}

		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("category=" + category);
		logger.debug("writer_name=" + writerName);
		logger.debug("content=" + content);
		logger.debug("title=" + title);
		logger.debug("memberId=" + memberId);

		/** (5) 게시판 카테고리 값을 받아서 View에 전달 */
		// 파일이 첨부된 경우 WebHelper를 사용할 수 없다.
		// String category = web.getString("category");
		request.setAttribute("category", category);

		/** (6) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		/** (7) 입력 받은 파라미터에 대한 유효성 검사 */
		// 이름 + 비밀번호
		if (!regex.isValue(writerName)) {
			sqlSession.close();
			web.redirect(null, "작성자 이름를 입력하세요.");
			return null;
		}


		// 제목 및 내용 검사
		if (!regex.isValue(title)) {
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}

		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}

		/** (8) 입력 받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		document.setCategory(category);
		document.setWriterName(writerName);
		document.setTitle(title);
		document.setContent(content);

		logger.debug("document >> " + document.toString());

		/** (9) Service를 통한 게시물 저장 */
		try {
			 //for(int i=1; i<=100; i++) {
			//	document.setSubject(subject + "(" + i + ")");
				documentService.insertDocument(document);
			 //}
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

	

		
		/** (11) 저장 완료 후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호값을 전달해야 한다.
		String url = "%s/admin_document_view.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getCategory(), document.getId());
		web.redirect(url, null);
		return null;
	}


}
