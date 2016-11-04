package com.badaservice.controller.shop;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Cart;
import com.badaservice.model.Member;
import com.badaservice.model.MemberName;
import com.badaservice.service.CartService;
import com.badaservice.service.MemberNameService;
import com.badaservice.service.MemberService;
import com.badaservice.service.impl.CartServiceImpl;
import com.badaservice.service.impl.MemberNameServiceImpl;
import com.badaservice.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class buy
 */
@WebServlet("/shop/buy.do")
public class buy extends BaseController {
	private static final long serialVersionUID = 8466002060641398016L;
	WebHelper web;
	SqlSession sqlsession;
	Logger logger;
	CartService cartService;
	MemberService memberService;
	UploadHelper upload;
	MemberNameService membernameService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		sqlsession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		cartService = new CartServiceImpl(logger, sqlsession);
		memberService = new MemberServiceImpl(logger, sqlsession);
		upload = UploadHelper.getInstance();
		membernameService =  new MemberNameServiceImpl(sqlsession, logger);
		
		if(web.getSession("loginInfo") == null) {
			sqlsession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 사용하실수 있습니다.");
			return null;
		}

		Member loginInfo = (Member) web.getSession("loginInfo");
		int myid = loginInfo.getId();
		String addr1 =  loginInfo.getAddr1();
		String addr2 =  loginInfo.getAddr2();
		String postcode = loginInfo.getPostcode();
		logger.debug("Myid="+myid);
	
		Cart cart = new Cart();
		cart.setMyId(myid);
		
		List<Cart> result= null;
		
		
		try {
			result=cartService.selectItemList(cart);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlsession.close();
		}
		
		int sum = 0;
		for(int i=0; i<result.size(); i++){
			sum+= result.get(i).getPrice();
		}
	
	

		request.setAttribute("cartList",result);
		request.setAttribute("sum", sum);
		request.setAttribute("addr1", addr1);
		request.setAttribute("addr2", addr2);
		request.setAttribute("postcode", postcode);
		
		
		
		
		return "shop/buy";
	}

}

