package com.badaadmin.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.PageHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;
@WebServlet("/admin/member/user_manage.do")
public class MemberList extends BaseController {

	private static final long serialVersionUID = 2401616501496854128L;
	WebHelper web;
	PageHelper pageHelper;
	SqlSession sqlSession;
	Logger logger;
	MemberService memberService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		web=WebHelper.getInstance(request, response);
		sqlSession=MyBatisConnectionFactory.getSqlSession();
		logger=LogManager.getFormatterLogger(request.getRequestURI());
		memberService=new MemberServiceImpl(logger, sqlSession);
		pageHelper = PageHelper.getInstance();
		
		
		/**if(web.getSession("loginInfo") == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}*/
		
		
		Member member = new Member();
		member.setLimitStart(0);
		member.setListCount(10);
		
		List<Member> memberList = null;
		
		int page = web.getInt("page", 1);
		
		
		
		int totalCount = 0;
		
		
		
		try {
			totalCount = memberService.selectMemberCount(member);
			System.out.println(totalCount);
			
			
			pageHelper.pageProcess(page, totalCount, 20,5);
			member.setLimitStart(pageHelper.getLimitStart());
			member.setListCount(pageHelper.getListCount());
			
			memberList = memberService.selectMemberList(member);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
			return null;
			
		}
		
		request.setAttribute("memberList", memberList);
		request.setAttribute("totalCount", totalCount);
		request.setAttribute("pageHelper", pageHelper);
		
		return "/admin/member/user_manage";
	}

}
