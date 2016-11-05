package com.badaservice.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.ItemOrder;
import com.badaservice.service.ItemorderService;

public class ItemorderServiceImpl implements ItemorderService{
	Logger logger;
	SqlSession sqlsession;
	
	
	public ItemorderServiceImpl(Logger logger, SqlSession sqlsession) {
		super();
		this.logger = logger;
		this.sqlsession = sqlsession;
	}
	@Override
	public void insertItemOrder(ItemOrder itemorder) throws Exception {
		try {
			int result = sqlsession.insert("ItemOrderMapper.insertitemorder", itemorder);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlsession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		} catch (Exception e) {
			sqlsession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 정보 등록에 실패했습니다.");
		} finally {
			sqlsession.commit();
		}
	}

}
