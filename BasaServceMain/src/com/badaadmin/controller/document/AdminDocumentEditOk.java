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
 * Servlet implementation class AdminDocumentEditOk
 */
@WebServlet("/admin_document_edit_ok.do")
public class AdminDocumentEditOk extends BaseController {
	private static final long serialVersionUID = 2254981795877130559L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	RegexHelper regex;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURL());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		regex = RegexHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		// 글 번호 가져오기 --> Map에서 가져오는 값은 모두 String이므로 형변환 필요
		int documentId = web.getInt("document_id");
		String category = web.getString("category");
		String title = web.getString("title");
		String content = web.getString("content");
		
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
		
		
		// 전달된 파라미터는 로그로 확인한다.
		logger.debug("documentId=" + documentId);
		logger.debug("category=" + category);
		logger.debug("title=" + title);
		logger.debug("content=" + content);
		
		
		// 제목 및 내용 검사
		if(!regex.isValue(title)) {
			sqlSession.close();
			web.redirect(null, "책 제목을 입력하세요.");
			return null;
		}
		
		if(!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}
		
		/** (9) 입력 받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		// UPDATE문의 WHERE절에서 사용해야 하므로 글 번호 추가
		// --> 글 번호는 숫자로 변환해서 처리해야 한다.
		document.setId(documentId);
		document.setCategory(category);
		document.setTitle(title);
		document.setContent(content);
		
		/** (10) 게시물 변경을 위한 Service 기능을 호출 */
		try {
			documentService.updateDocument(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
	
		/** (13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		sqlSession.close();
		
		String url = "%s/admin_document_view.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), category, documentId);
		web.redirect(url, "수정되었습니다");
		
		return null;
	}


}
