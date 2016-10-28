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

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		return "/message/message_send";
	}

}
