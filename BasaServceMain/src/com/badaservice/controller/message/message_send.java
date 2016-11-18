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
	MemberService memberService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberService = new MemberServiceImpl(logger, sqlSession);
		
		if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}
		
		String userId = web.getString("user_id");
		int senderId = web.getInt("sender_id");
		int receiverId = web.getInt("receiver_id");
		
		
		
		Member member = new Member();
		if(senderId != 0) {
			member.setId(senderId);
		} else if(receiverId != 0) {
			member.setId(receiverId);
		}
		Member readMember = null;
		
		try {
			if(senderId != 0) {
				readMember = memberService.selectMemberSendMessageList(member);
					if(readMember.getUser_id() != null) {
							userId = readMember.getUser_id();
					}
			} else if(receiverId != 0) {
				readMember = memberService.selectMemberSendMessageList(member);
				if(readMember.getUser_id() != null) {
					userId = readMember.getUser_id();
				}
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("userId", userId);
		
		return "/message/message_send";
	}

}
