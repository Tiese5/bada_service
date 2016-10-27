package com.badaservice.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;

@WebServlet("/member/edit_pw_ok.do")
public class EditPwOk extends BaseController {
	
	private static final long serialVersionUID = -2241300429311712742L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import study.jsp.helper.WebHelper;
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	MemberService memberService;
	RegexHelper regex;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger=LogManager.getFormatterLogger(request.getRequestURI());
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		memberService = new MemberServiceImpl(logger, sqlSession);
		regex = RegexHelper.getInstance();
		
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		/** (3) 로그인 여부 검사 */
		//로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (loginInfo == null) {
		web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
		return null;
		}
		
		/** (4) 패스워드 파라미터 받기*/
		String UserPw = web.getString("user_pw");
		String NewUserPw = web.getString("new_user_pw");
		String NewUserPwRe=web.getString("new_user_pw_re");
		
		logger.debug("UserPw="+UserPw);
		logger.debug("NewUserPw="+NewUserPw);
		logger.debug("NewUserPwRe="+NewUserPwRe);
	
		
		/** (5) 입력값의 유효성 검사 (아이디 검사 수행안함) */
		// 현재 비밀번호 검사
		if (!regex.isValue(UserPw)) {
			sqlSession.close();
			web.redirect(null, "현재 비밀번호를 입력하세요.");
			return null;
		}
		
		// 신규 비밀번호 검사
		// --> 신규 비밀번호가 입력된 경우는 변경으로 간주하고, 입력하지 않은 경우는
		//     변경하지 않도록 처리한다. 그러므로 입력된 경우만 검사해야 한다.
		if (regex.isValue(NewUserPw)) {
			if (!regex.isEngNum(NewUserPw) || NewUserPw.length() > 20) {
				sqlSession.close();
				web.redirect(null, "새로운 비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
				return null;
			}
	
			// 비밀번호 확인
			if (!NewUserPw.equals(NewUserPwRe)) {
				sqlSession.close();
				web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
				return null;
			}
		}
		
		
		//파라미터를 Beans로 묶기
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUser_pw(UserPw);
		member.setNew_user_pw(NewUserPw);

		/** (6) Service를 통한 데이터베이스 저장 처리 */
		// 변경된 정보를 저장하기 위한 객체

		try {
			memberService.selectUserPasswordCount(member);
			memberService.updateMemberPassword(member);
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 수정이 완료되었으므로 다시 로그인 페이지로 이동 */
		web.redirect(web.getRootPath() + "/member/info.do", 
				"비밀번호가 수정되었습니다.");
		
		/** (5) 패스워드 변경 */
		return null;
	}
}
