package com.badaservice.document.controller;

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
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Document;
import com.badaservice.service.DocumentService;
import com.badaservice.service.impl.DocumentServiceImpl;







@WebServlet("/document_view.do")
public class DocumentNoticeView extends BaseController {
	private static final long serialVersionUID = -7255918033093832468L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	RegexHelper regex; 
	DocumentService documentService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		regex = RegexHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		int documentId = web.getInt("document_id");
		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		Document readDocument = null;
		
		try {

			readDocument = documentService.selectDocument(document);

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("readDocument", readDocument);
		
		return "/document/notice_view";
	}

}
