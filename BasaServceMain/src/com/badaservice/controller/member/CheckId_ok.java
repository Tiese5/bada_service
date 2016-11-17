package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONObject;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;

@WebServlet("/checkId_ok.do")
public class CheckId_ok extends BaseController {

	private static final long serialVersionUID = 5397256277607375189L;
	WebHelper web;
	SqlSession sqlSession;
	MemberService memberService;
	Logger logger;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberService = new MemberServiceImpl(logger, sqlSession);
		logger = LogManager.getFormatterLogger(request.getRequestURL());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		
		//String user_id = web.getString("user_id");
		String userId = request.getParameter("user_id");
		logger.debug("JSP에서 넘어온 아이디 중복체크>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+userId);
		
		Member member = new Member();
		member.setUser_id(userId);
		int check = 0;
		
		try {
			check=memberService.selectUserIdCount2(member);
			logger.debug("check 검사 :"+ check);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		String result = "OK";
		
		if(check >= 1){
			result = "NO";
		}
		
		JSONObject json = new JSONObject();
		json.put("result",result);
		response.getWriter().print(json);
	
		
		return null;
	}

	}
