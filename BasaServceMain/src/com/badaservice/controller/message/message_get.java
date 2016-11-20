package com.badaservice.controller.message;

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
import com.badaservice.helper.BaseController;
import com.badaservice.helper.PageHelper;
import com.badaservice.model.messenger;
import com.badaservice.service.MessageService;
import com.badaservice.service.impl.MessageServiceImpl;



import com.badaservice.model.Member;

import com.badaservice.helper.WebHelper;



/**
 * Servlet implementation class message_get
 */
@WebServlet("/message_get.do")
public class message_get extends BaseController {
	private static final long serialVersionUID = -3370403798071109586L;
	Logger logger;
	SqlSession sqlSession;
	MessageService messageService;
	WebHelper web;
	PageHelper pageHelper;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web=WebHelper.getInstance(request, response);
		messageService = new MessageServiceImpl(logger, sqlSession);
		pageHelper = PageHelper.getInstance();
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		
		int receiverId = 0;
		String messageDelete = web.getString("message_delete");
		messageDelete = "N";
		
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			receiverId = loginInfo.getId();
		}
		
		Member member = new Member();
		
		messenger messenger = new messenger();
		messenger.setReceiverId(receiverId);
		messenger.setMessageDelete(messageDelete);
		
		
		int page = web.getInt("page", 1);
		
		int totalCount = 0;
		List<messenger> messengerList = null;
		try {
			// 전체 게시물 수
			totalCount = messageService.selectMessageCount(messenger);
			
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			messenger.setLimitStart(pageHelper.getLimitStart());
			messenger.setListCount(pageHelper.getListCount());
			logger.debug(pageHelper.toString());
			
		messengerList = messageService.selectMessageList(messenger);
	
		
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("messengerList", messengerList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);

		
		return "/message/message_get";
	}


}
