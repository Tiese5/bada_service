package com.badaservice.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ChartData.do")
public class ChartData extends BaseController {

	private static final long serialVersionUID = 388867595644153011L;
	SqlSession sqlSession;
	Logger logger;
	WebHelper web;
	ChartService chartService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		web = WebHelper.getInstance(request, response);
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger();
		chartService = new ChartServiceImpl(sqlSession, logger);

	

		Chart chart = new Chart();
		
		List<Chart> num = null;

		try {
			num = chartService.chartNum(chart);
		} catch (Exception e) {
			e.printStackTrace();
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}


		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), num);

		return null;
	}
}
