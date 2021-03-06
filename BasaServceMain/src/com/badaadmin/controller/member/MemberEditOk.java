package com.badaadmin.controller.member;

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
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;
@WebServlet("/admin/member/member_edit_ok.do")
public class MemberEditOk extends BaseController {

	private static final long serialVersionUID = 2401616501496854128L;
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		// 회원가입 처리를 위한 Service객체
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(logger, sqlSession);
        
		int id = web.getInt("id");
		logger.debug("id="+id);
		
		String userId = web.getString("user_id");
		String name = web.getString("name");
		String email = web.getString("email");
		String birthdate = web.getString("birthdate");
		String tel = web.getString("tel");
		String postcode = web.getString("postcode");
		String addr1 = web.getString("addr1");
		String addr2 = web.getString("addr2");
		String join_date = web.getString("join_date");

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		
		logger.debug("userid=" + userId);
		logger.debug("name=" + name);
		logger.debug("email=" + email);
		logger.debug("tel=" + tel);
		logger.debug("birthdate=" + birthdate);
		logger.debug("postcode=" + postcode);
		logger.debug("addr1=" + addr1);
		logger.debug("addr2=" + addr2);
		logger.debug("join_date=" + join_date);


		/** (5) 입력값의 유효성 검사 (아이디 검사 수행안함) */
	

		// 이름 검사
		if (!regex.isValue(name)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}

		if (!regex.isKor(name)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}

		if (name.length() < 2 || name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
			return null;
		}

		// 이메일 검사
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요.");
			return null;
		}

		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}

		// 연락처 검사
		if (!regex.isValue(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요.");
			return null;
		}

		if (!regex.isCellPhone(tel) && !regex.isTel(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}


	
		/** (8) 전달받은 파라미터를 Beans 객체에 담는다. */
		//  아이디는 변경할 수 없으므로 제외한다.
		Member member = new Member();
		// WHERE절에 사용할 회원번호는 세션에서 취득
		member.setId(id);
		member.setName(name);
		member.setUser_id(userId);
		member.setEmail(email);
		member.setTel(tel);
		member.setBirthdate(birthdate);
		member.setPostcode(postcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setJoin_date(join_date);

	
		/** (9) Service를 통한 데이터베이스 저장 처리 */
		// 변경된 정보를 저장하기 위한 객체
		
		try {
			
			memberService.updateMember2(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (10) 세션, 쿠키 갱신 
		// 일단 쿠키의 썸네일 정보를 삭제한다.
		if (imgDel != null && imgDel.equals("Y")) {
			web.removeCookie("profileThumbnail");
		}
		
		// 프로필 이미지가 있을 경우 썸네일을 생성하여 쿠키에 별도로 저장
		String newProfileImg = editInfo.getProfileImg();
		if (newProfileImg != null) {
			try {
				String profileThumbnail = upload.createThumbnail(newProfileImg, 40, 40, true);
				web.setCookie("profileThumbnail", profileThumbnail, -1);
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}**/
		
		
		request.setAttribute("view", member);
		

		
		/** (11) 수정이 완료되었으므로 다시 수정페이지로 이동 */
		web.redirect(web.getRootPath() + "/admin/member/member_view.do?id="+ id, 
				"회원정보가 수정되었습니다.");
		
		
		// INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은 자체적으로 View를
		// 갖지 않고 결과를 확인할 수 있는 다른 페이지로 강제 이동시켜야 한다. 
		// 그러므로 View의 경로를 리턴하지 않는다.(중복실행 방지)
		return null;
	}

}
