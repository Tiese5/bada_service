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
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Document;
import com.badaservice.model.Member;
import com.badaservice.service.DocumentService;
import com.badaservice.service.impl.DocumentServiceImpl;

/**
 * Servlet implementation class AdminDocumentDelete
 */
@WebServlet("/admin_document_delete_ok.do")
public class AdminDocumentDelete extends BaseController {
	private static final long serialVersionUID = 4016702166316197244L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURL());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
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
		
		/** (5) 게시글 번호와 비밀번호 받기 */
		int documentId = web.getInt("document_id");
		logger.debug("documentId" + documentId);
		
		if(documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** (6) 파라미터를 Beans로 묶기 */
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
	
		
		try {
			documentService.deleteDocument(document);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (9) 페이지 이동 */
		String url = "%s/admin_document_list.do?category=%s";
		url = String.format(url, web.getRootPath(), category);
		
		web.redirect(url, "삭제되었습니다.");
		return null;
	}
	


}
