package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.Chart;
import com.badaservice.service.ChartService;

public class ChartServiceImpl implements ChartService{

	
	Logger logger;
	SqlSession sqlSession;

	public ChartServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	
	
	@Override
	public List<Chart> chartNum(Chart chart) throws Exception {
		// TODO Auto-generated method stub
				List<Chart> result = null;
				try{
				result = sqlSession.selectList("chartmapper.chartNum",chart);
				logger.debug("result:" +result);

					}catch (Exception e) {
						System.out.println(e.getLocalizedMessage());
					logger.debug("result:" +result);
					throw new Exception("데이터 조회에 실패했습니다.");
				}
		return result;
	}
	
}
