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


	@Override
	public messenger selectMessage(messenger messenger) throws Exception {
		messenger result = null;
		
		try {
			result = sqlsession.selectOne("MessageMapper.selectMessage", messenger);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지 조회에 실패했습니다");
		}
		return result;
	}


	@Override
	public void insertMessage(messenger messenger) throws Exception {
		try {
			int result = sqlsession.insert("MessageMapper.insertMessage", messenger);
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


	@Override
	public int selectMessageCount(messenger messenger) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 대한 에외를 발생시키지 않는다.
			result = sqlsession.selectOne("MessageMapper.selectMessageCount", messenger);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다");
		}
		
		return result;
	}


	@Override
	public int selectMessageSendCount(messenger messenger) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 대한 에외를 발생시키지 않는다.
			result = sqlsession.selectOne("MessageMapper.selectMessageSendCount", messenger);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다");
		}
		
		return result;
	}


	@Override
	public messenger selectSendMessage(messenger messenger) throws Exception {
		messenger result = null;
		
		try {
			result = sqlsession.selectOne("MessageMapper.selectSendMessage", messenger);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지 조회에 실패했습니다");
		}
		return result;
	}


	@Override
	public void insertSendMessage(messenger messenger) throws Exception {
		try {
			int result = sqlsession.insert("MessageMapper.insertSendMessage", messenger);
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


