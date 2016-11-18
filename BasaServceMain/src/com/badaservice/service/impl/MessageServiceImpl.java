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
			logger.debug("result :" + result);
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


	@Override
	public void updateMessage(messenger messenger) throws Exception {
		try {
			int result = sqlsession.update("MessageMapper.updateMessage", messenger);
			if( result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlsession.rollback();
			throw new Exception("존재하지 않는 쪽지에 대한 요청입니다.");
		} catch (Exception e) {
			sqlsession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지삭제에 실패했습니다.");
		} finally {
			sqlsession.commit();
		}
		
	}


	@Override
	public void updateReceiverMessage(messenger messenger) throws Exception {
		try {
			int result = sqlsession.update("MessageMapper.updateReceiverMessage", messenger);
			if( result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlsession.rollback();
			throw new Exception("존재하지 않는 쪽지에 대한 요청입니다.");
		} catch (Exception e) {
			sqlsession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("쪽지삭제에 실패했습니다.");
		} finally {
			sqlsession.commit();
		}
		
	}


	@Override
	public List<messenger> selectAdminMessageList(messenger messenger) throws Exception {

		List<messenger> result = null;

		try {
			result = sqlsession.selectList("MessageMapper.selectAdminMessageList", messenger);
			logger.debug("result :" + result);
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
	public int selectAdminMessageCount(messenger messenger) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 대한 에외를 발생시키지 않는다.
			result = sqlsession.selectOne("MessageMapper.selectAdminMessageCount", messenger);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다");
		}
		
		return result;
	}


	@Override
	public messenger selectAdminMessage(messenger messenger) throws Exception {
		
		messenger result = null;
		
		try {
			result = sqlsession.selectOne("MessageMapper.selectAdminMessage", messenger);
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
	public void deleteAdminMessage(messenger messenger) throws Exception {
		// 수정 삭제 입력 패턴
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			int result = sqlsession.delete("MessageMapper.deleteAdminMessage", messenger);
			// 리턴값이 저장된 행의 수
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				// -->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQl 수행 내역을 되돌림
			sqlsession.rollback();
			throw new Exception("삭제할 게시물이 없습니다");

		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlsession.rollback(); // SQl문 문법에러 제약조건
			e.printStackTrace();
			throw new Exception("게시물 삭제에 실패했습니다");

		} finally {
			// 입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
			sqlsession.commit();
			// 데이터 베이스 접속 해제
		}
	}
	
	
}


