package com.badaservice.controller.message;

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
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.model.messenger;
import com.badaservice.service.MessageService;
import com.badaservice.service.impl.MessageServiceImpl;

/**
 * Servlet implementation class message
 */
@WebServlet("/message.do")
public class message extends BaseController {
	private static final long serialVersionUID = -3165659462670755911L;
	Logger logger;
	SqlSession sqlSession;
	MessageService messageService;
	WebHelper web;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web=WebHelper.getInstance(request, response);
		messageService = new MessageServiceImpl(logger, sqlSession);
		
		
		int senderId = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			senderId = loginInfo.getId();
		}
		
		messenger messenger = new messenger();
		messenger.setSenderId(senderId);
		List<messenger> messengerList = null;
		try {
		messengerList = messageService.selectMessageSendList(messenger);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("messengerList", messengerList);
		
		return "/message/message";
	}
	
}
