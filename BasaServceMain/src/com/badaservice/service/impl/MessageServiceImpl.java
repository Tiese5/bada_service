package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.messenger;
import com.badaservice.service.MessageService;



public class MessageServiceImpl implements MessageService {
	Logger logger;
	SqlSession sqlsession;
	
	
	public MessageServiceImpl(Logger logger, SqlSession sqlsession) {
		super();
		this.logger = logger;
		this.sqlsession = sqlsession;
	}


	@Override
	public List<messenger> selectMessageList(messenger messenger) throws Exception {

		List<messenger> result = null;

		try {
			result = sqlsession.selectList("MessageMapper.selectMessageList", messenger);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 쪽지 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지 목록 조회에 실패했습니다.");
		}

		return result;
	}


	@Override
	public List<messenger> selectMessageSendList(messenger messenger) throws Exception {

		List<messenger> result = null;

		try {
			result = sqlsession.selectList("MessageMapper.selectMessageSendList", messenger);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 쪽지 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지 목록 조회에 실패했습니다.");
		}

		return result;
	}
}


