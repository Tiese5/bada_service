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
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;
@WebServlet("/admin/member/member_out_ok.do")
public class MemberOutOk extends BaseController {

	private static final long serialVersionUID = 2401616501496854128L;
	WebHelper web;
	SqlSession sqlSession;
	Logger logger;
	MemberService memberService;
	UploadHelper upload;
	
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

		
		/** (4) 파라미터 받기 */
		int id = web.getInt("id");
		logger.debug("id="+id);
		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		Member member = new Member();
		member.setId(id);
		
		/** (6) Service를 통한 탈퇴시도 */
		try{
			//삭제처리 
			memberService.deleteMember(member);

		}catch (Exception e) {
			// TODO: handle exception
			web.redirect(null,e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		//탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(member.getProfile_img());
		
		/** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
		web.redirect(web.getRootPath()+ "/admin/member/user_manage.do","삭제되었습니다.");
		return null;
	}

	}

