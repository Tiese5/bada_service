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
 * Servlet implementation class MessageSendView
 */
@WebServlet("/message_send_view.do")
public class MessageSendView extends BaseController {
	private static final long serialVersionUID = 2179779756019773863L;
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
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		
		/** (5) 글 번호 파라미터 받기 */
		int MessageId = web.getInt("message_id");
		if (MessageId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			return null;
		}
		
		int senderId = 0;
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			senderId = loginInfo.getId();
		}
		
		messenger messenger = new messenger();
		messenger.setId(MessageId);
		messenger.setSenderId(senderId);
		
		messenger readMessage = new messenger();
		try {
			readMessage = messageService.selectSendMessage(messenger);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("readMessage", readMessage);
		
		return "/message/message_send_view";
	}
	


}
