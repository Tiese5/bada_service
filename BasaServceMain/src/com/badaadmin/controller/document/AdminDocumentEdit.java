package com.badaadmin.controller.document;

import java.io.IOException;
import java.util.List;

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
import com.badaservice.service.DocumentService;
import com.badaservice.service.impl.DocumentServiceImpl;


/**
 * Servlet implementation class AdminDocumentEdit
 */
@WebServlet("/admin_document_edit.do")
public class AdminDocumentEdit extends BaseController {
	private static final long serialVersionUID = -3485661129719813161L;
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

		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);

		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		/** (5) 글 번호 파라미터 받기 */
		int documentId = web.getInt("document_id");
		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			return null;
		}

		// 파라미터를 Beans로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);


		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 게시물이 저장될 객체
		Document readDocument = null;

		try {
			readDocument = documentService.selectDocument(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (7) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("readDocument", readDocument);

		return "/admin/document/admindocumentEdit";
	}


}
