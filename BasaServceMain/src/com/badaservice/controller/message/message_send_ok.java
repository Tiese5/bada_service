package com.badaservice.controller.message;

import java.io.IOException;
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
 * Servlet implementation class message_send_ok
 */
@WebServlet("/message_send_ok.do")
public class message_send_ok extends BaseController {
	private static final long serialVersionUID = 391656074030539863L;
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
		
		
		/** (5) 글 번호 파라미터 받기 */
		int ReceiverId = web.getInt("sender_id");
		String ReceiverName = web.getString("sender_name");
		
		int receiverId = ReceiverId;
		String receiverName = ReceiverName;
		String content = web.getString("content");
		String senderName = null;
		int senderId = 0;
		
		messenger messenger = new messenger();
		
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			senderName = loginInfo.getName();
			senderId = loginInfo.getId();
		}
		
		// 로그로 기록
		
		// 빈즈로 묶기
		messenger.setReceiverId(receiverId);
		messenger.setReceiverName(receiverName);
		messenger.setSenderName(senderName);
		messenger.setSenderId(senderId);
		messenger.setContent(content);
		
		
		try {
			messageService.insertMessage(messenger);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		String url = "%s/message.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, null);
		
		return null;
	}
	
	

}
