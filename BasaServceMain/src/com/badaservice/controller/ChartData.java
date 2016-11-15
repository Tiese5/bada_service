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
		} finally {
			sqlSession.close();
		}

			ChartItem item1 = new ChartItem();
			item1.setDate("num");
			item1.setViews(num.get(0).getReg());
			item1.setVisits(num.get(0).getJon());
			
			ChartItem item2 = new ChartItem();
			item2.setDate("num");
			item2.setViews(Integer.parseInt("num"));
			item2.setVisits(Integer.parseInt("num"));
			
			ChartItem item3 = new ChartItem();
			item3.setDate(("num"));
			item3.setViews(Integer.parseInt("num"));
			item3.setVisits(Integer.parseInt("num"));

		
		List<ChartItem> list = new ArrayList<ChartItem>();
		list.add(item1);
		list.add(item2);
		list.add(item3);

		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), list);

		return null;
	}
}
