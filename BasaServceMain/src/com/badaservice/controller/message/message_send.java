package com.badaservice.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.model.messenger;
import com.badaservice.service.MemberService;
import com.badaservice.service.MessageService;
import com.badaservice.service.impl.MemberServiceImpl;
import com.badaservice.service.impl.MessageServiceImpl;

/**
 * Servlet implementation class message_send
 */
@WebServlet("/message_send.do")
public class message_send extends BaseController {
	private static final long serialVersionUID = -3022851980472374394L;
	WebHelper web;
	SqlSession sqlSession;
	MessageService messageService;
	RegexHelper regex;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web=WebHelper.getInstance(request, response);
		messageService = new MessageServiceImpl(logger, sqlSession);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		String userId = web.getString("user_id");
		Member member = new Member();
		String senderName = null;
		String content = null;
		int senderId= 0;
		member.setUser_id(userId);
		Member receiver = null;
		
		try {
			receiver = memberService.selectMemberMessageList(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		messenger messenger = new messenger();
		messenger.setReceiverId(receiver.getId());
		messenger.setReceiverName(receiver.getName());
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			senderName = loginInfo.getName();
			senderId = loginInfo.getId();
		}
		
		messenger.setSenderName(senderName);
		messenger.setSenderId(senderId);
		messenger.setContent(content);
		
		try {
			messageService.insertMessage(messenger);
			messageService.insertSendMessage(messenger);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		return "/message/message_send";
	}

}
