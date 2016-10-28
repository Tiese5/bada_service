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
import com.badaservice.model.messenger;
import com.badaservice.service.MessageService;
import com.badaservice.service.impl.MessageServiceImpl;




/**
 * Servlet implementation class message_delete
 */
@WebServlet("/message_delete.do")
public class message_delete extends BaseController {
	private static final long serialVersionUID = 2216248263330058770L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MessageService messageService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURL());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		messageService = new MessageServiceImpl(logger, sqlSession);
		
		int messageId = web.getInt("message_id");
		String messageDeleteSend = "Y";
		
		if(messageId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		messenger messenger = new messenger();
		messenger.setId(messageId);
		messenger.setMessageDeleteSend(messageDeleteSend);
		
		try {
			messageService.updateMessage(messenger);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		sqlSession.close();
		
		String url = "%s/message.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, null);
		
		return null;
	}

}
