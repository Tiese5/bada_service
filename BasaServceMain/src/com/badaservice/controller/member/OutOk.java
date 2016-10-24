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
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;


@WebServlet("/member/out_ok.do")
public class OutOk extends BaseController {

	private static final long serialVersionUID = -269562222435057607L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import study.jsp.helper.WebHelper;
	// --> import org.apache.logging.log4j.Logger;
		Logger logger;
		// --> import org.apache.ibatis.session.SqlSession;
		SqlSession sqlSession;
		// --> import study.jsp.helper.WebHelper;
		WebHelper web;
		// --> import study.jsp.helper.UploadHelper;
		UploadHelper upload;
		// --> import study.jsp.mysite.service.MemberService;
		MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
				logger = LogManager.getFormatterLogger(request.getRequestURI());
				// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
				sqlSession = MyBatisConnectionFactory.getSqlSession();
				web = WebHelper.getInstance(request, response);
				upload = UploadHelper.getInstance();
				// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
				memberService = new MemberServiceImpl( logger, sqlSession);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** (4) 파라미터 받기 */
		String userPw = web.getString("user_pw");
		logger.debug("userPw=" + userPw);
		
		if(userPw == null){
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}
		
		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUser_pw(userPw);
		
		/** (6) Service를 통한 탈퇴시도 */
		try{
			//비밀번호 검사 --> 비밀번호가 잘못된 경우 예외발생
			memberService.selectUserPasswordCount(member);
			//탈퇴처리
			memberService.updateMemberOut(member);
			
		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null,e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		//탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(loginInfo.getProfile_img());
		
		/** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
		web.removeAllSession();
		web.redirect(web.getRootPath()+ "/index.do","탈퇴되었습니다.");
		return null;
	}
}
