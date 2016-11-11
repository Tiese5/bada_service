package com.badaservice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.badaservice.helper.BaseController;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ChartData.do")
public class ChartData extends BaseController {

	private static final long serialVersionUID = 388867595644153011L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");

		ChartItem item1 = new ChartItem();
		item1.setDate("2016-08-01");
		item1.setVisits(2345);
		item1.setVisits(1231);

		ChartItem item2 = new ChartItem();
		item2.setDate("2016-08-02");
		item2.setViews(6745);
		item2.setVisits(4231);

		ChartItem item3 = new ChartItem();
		item3.setDate("2016-08-03");
		item3.setViews(5500);
		item3.setVisits(1000);

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
