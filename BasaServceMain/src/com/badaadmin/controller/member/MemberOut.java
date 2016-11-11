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
@WebServlet("/admin/member/member_out.do")
public class MemberOut extends BaseController {

	private static final long serialVersionUID = 2401616501496854128L;
	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	MemberService memberService;
	

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		web = WebHelper.getInstance(request, response);

		int id= web.getInt("id");
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		/**if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}*/
		
		request.setAttribute("id", id);
		/** (4) 사용할 View의 이름 리턴 */
		return "admin/member/member_out";
	}

	}

