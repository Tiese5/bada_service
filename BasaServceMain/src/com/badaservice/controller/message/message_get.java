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
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web=WebHelper.getInstance(request, response);
		messageService = new MessageServiceImpl(logger, sqlSession);
		
		
		int receiverId = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			receiverId = loginInfo.getId();
		}
		
		messenger messenger = new messenger();
		messenger.setReceiverId(receiverId);
		List<messenger> messengerList = null;
		try {
		messengerList = messageService.selectMessageList(messenger);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("messengerList", messengerList);
		
		return "/message/message_get";
	}


}
