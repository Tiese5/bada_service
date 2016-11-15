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
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Document;
import com.badaservice.service.DocumentService;
import com.badaservice.service.impl.DocumentServiceImpl;

/**
 * Servlet implementation class Document
 */
@WebServlet("/admin_document_list.do")
public class AdminDocument extends BaseController{
	private static final long serialVersionUID = 5289592583095039548L;
	WebHelper web;
	BBSCommon bbs;
	Logger logger;
	SqlSession sqlSession;
	DocumentService documentService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
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
		
		Document adminDocument = new Document();
		adminDocument.setCategory(category);
		
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		List<Document> documentList = null;
		
		try {
			// 전체 게시물 수
			 totalCount = documentService.selectDocumentCount(adminDocument);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			adminDocument.setLimitStart(pageHelper.getLimitStart());
			adminDocument.setListCount(pageHelper.getListCount());
			logger.debug(pageHelper.toString());
			
			documentList = documentService.selectDocumentList(adminDocument);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("documentList", documentList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		return "/admin/document/admindocument_list";
	}


}
