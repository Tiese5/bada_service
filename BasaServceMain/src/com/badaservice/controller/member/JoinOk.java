package com.badaservice.controller.member;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.FileInfo;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.MemberServiceImpl;
@WebServlet("/member/join_ok.do")
public class JoinOk extends BaseController {

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7358162710540203294L;
	/**(1) 사용하고자	하는 Helper + Service 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	MemberService memberservice;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
			/** (2) 사용하고자 하는 Helper+Service 객체 생성*/
			logger = LogManager.getFormatterLogger(request.getRequestURI());
			sqlSession = MyBatisConnectionFactory.getSqlSession();
			web=WebHelper.getInstance(request, response);
			regex=RegexHelper.getInstance();
			upload=UploadHelper.getInstance();
			memberservice = new MemberServiceImpl(logger, sqlSession);
			
			/** (3) 로그인 여부 검사*/
			if(web.getSession("loginInfo") != null) {
				sqlSession.close();
				web.redirect(web.getRootPath() + "/index", "이미 로그인 중입니다.");
				return null;
			}
			
			/** (4) 파일이 포함된 POST 파라미터 받기*/
			//<form>태그 안에 <input type="file">요소가 포함되어 있고,
			//<form>태그에 enctype="multipart/form-data"가 정의되어 있는 경우
			//WebHelper의 getString()|getInt() 메서드는 더 이상 사용할 수 없게 된다.	]
			try{
				upload.multipartRequest(request);
			}catch(Exception e){
				sqlSession.close();
				web.redirect(null, "mutitype 데이터가 아닙니다.");
				return null;
			}
			//UploadHelper에서 텍스트 형식의 파라미터를 분류한 Map을 리턴받아서 값을 추출한다.
			Map<String, String> paramMap = upload.getParamMap();
			String userId = paramMap.get("user_id");
			String userPw = paramMap.get("user_pw");
			String userPwRe = paramMap.get("user_pw_re");
			String name = paramMap.get("name");
			String email = paramMap.get("email");
			String birthdate = paramMap.get("birthdate");
			String tel = paramMap.get("tel");
			String postcode = paramMap.get("postcode");
			String addr1 = paramMap.get("addr1");
			String addr2 = paramMap.get("addr2");
			
			//전달받은 파라미터는 값의 정상여부
			logger.debug("userId="+userId);
			logger.debug("userPw="+userPw);
			logger.debug("userPwRe="+userPwRe);
			logger.debug("name="+name);
			logger.debug("email="+email);
			logger.debug("birthdate="+birthdate);
			logger.debug("tel="+tel);
			logger.debug("postcode="+postcode);
			logger.debug("addr1="+addr1);
			logger.debug("addr2="+addr2);
			
			/** (5) 입력값의 유효성 검사*/
			//아이디 검사
			if(!regex.isValue(userId)){
				sqlSession.close();
				web.redirect(null, "아이디를 입력하세요.");
				return null;
			}
			if(!regex.isEngNum(userId)){
				sqlSession.close();
				web.redirect(null, "아이디는 숫자는 영문의 조합으로 20자까지만 가능합니다.");
				return null;
			}
			if(userId.length()>20){
				sqlSession.close();
				web.redirect(null, "아이디는 숫자는 영문의 조합으로 20자까지만 가능합니다.");
				return null;
			}
			
			//비밀번호 검사
			if(!regex.isValue(userPw)){
				sqlSession.close();
				web.redirect(null, "비밀번호를 입력하세요.");
				return null;
			}
			if(!regex.isEngNum(userPw)){
				sqlSession.close();
				web.redirect(null, "비밀번호는 숫자는 영문의 조합으로 20자까지만 가능합니다.");
				return null;
			}
			if(userPw.length()>20){
				sqlSession.close();
				web.redirect(null, "비밀번호는 숫자는 영문의 조합으로 20자까지만 가능합니다.");
				return null;
			}
			
			//비밀번호 확인
			if(!userPw.equals(userPwRe)){
				sqlSession.close();
				web.redirect(null, "비밀번호가 맞지 않습니다.");
				return null;
			}
			
			
			
			
			//이름 검사
			if(!regex.isKor(name)){
				sqlSession.close();
				web.redirect(null, "이름은 한글만 입력 가능합니다.");
				return null;
			}
			if(name.length()<2||name.length()>5){
				sqlSession.close();
				web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
				return null;
			}
			
			
			
			//이메일 검사
			if(!regex.isValue(email)){
				sqlSession.close();
				web.redirect(null, "이메일을 입력하세요.");
				return null;
			}
			if(!regex.isEmail(email)){
				sqlSession.close();
				web.redirect(null, "연락처를 입력하세요.");
				return null;
			}
			
			// 생년월일 검사
			if (!regex.isValue(birthdate)) {
				sqlSession.close();
				web.redirect(null, "생년월일을 입력하세요.");
				return null;
			}
			
			
			//연락처 검사
			
			if(!regex.isValue(tel)){
				sqlSession.close();
				web.redirect(null, "연락처를 입력하세요.");
				return null;
			}
			
			if(!regex.isCellPhone(tel)){
				sqlSession.close();
				web.redirect(null, "연락처의 형식이 잘못되었습니다.");
				return null;
			}
			
			/** (6) 업로드 된 파일 정보 추출*/
			List<FileInfo> fileList = upload.getFileList();
			//업로드된 프로필 사진 경로가 저장될 변수
			String profileImg = null;
			//업로드된 파일이 존재할 경우만 변수값을 할당한다.
			if(fileList.size()>0){
				//단일 업로드이므로 0번째 항목만 가져온다.
				FileInfo info = fileList.get(0);
				profileImg = info.getFileDir()+"/"+info.getFileName();
			}
			
			//파일경로를 로그로 기록
			logger.debug("profileImg:"+profileImg);
			
			/** (7) 전달받은 파라미터를 Beans 객체에 담는다.*/
			Member member = new Member();
			member.setUser_id(userId);
			member.setUser_pw(userPwRe);
			member.setName(name);
			member.setEmail(email);
			member.setBirthdate(birthdate);
			member.setTel(tel);
			member.setPostcode(postcode);
			member.setAddr1(addr1);
			member.setAddr2(addr2);
			member.setProfile_img(profileImg);
			/** (8) Service를 통한 데이터베이스 저장 처리*/
			
			try	{
				System.out.println("hede");
				memberservice.insertMember(member);
				
			}catch (Exception e) {
				// TODO: handle exception
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				//예외가 발생한 경우이므로, 더이상 진행하지 않는다.
				return null;
			}
			/** (9) 가입이 완료되었으므로 메인페이지로 이동*/
			sqlSession.close();
			
			web.redirect(web.getRootPath()+"/index.do","회원가입이 완료되었습니다."
					+ "로그인 해 주세요.");
			//INSERT,UPDATE,DELETE 처리를 수행하는 action 페이지들은 자체적으로 View를
			//갖지 않고 결과를 확인할 수  있는다른 페이지로 강제 이동시켜야 한다. (중복실행 방지)
			//그러므로 View의 경로를 리턴하지 않는다.
			
			return null;
		
		
	}

}
