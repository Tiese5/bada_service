package com.badaadmin.controller;

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
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Chart;
import com.badaservice.service.ChartService;
import com.badaservice.service.impl.ChartServiceImpl;
@WebServlet("/admin_chart.do")
public class chart extends BaseController {
	private static final long serialVersionUID = 7065452114790381913L;
	SqlSession sqlSession;
	Logger logger;
	WebHelper web;
	ChartService chartService;
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	web = WebHelper.getInstance(request, response);
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	logger = LogManager.getFormatterLogger();

	chartService = new ChartServiceImpl(sqlSession, logger);

	memberService = new MemberServiceImpl(logger, sqlSession);
	itemorderService = new ItemorderServiceImpl(logger, sqlSession);

	
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/admin_index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}


		
		int dayTr = web.getInt("reg_data");
		int dayJoin = web.getInt("join_date");

		
		String regDate = web.getString("reg_data");
		String joinData = web.getString("join_date");
		
		Chart chart = new Chart();
		chart.setRegData(regDate);
		chart.setJoinData(joinData);
		
		List<Chart> num = null;
		
		try {
			num = chartService.chartNum(chart);
		} catch (Exception e) {
			e.printStackTrace();
			web.redirect(null, e.getLocalizedMessage());
		}finally{
			sqlSession.close();
		}
		request.setAttribute("num", num);
		
		/*int Tr = memberService.*/
		return "admin/chart";
	}

}



