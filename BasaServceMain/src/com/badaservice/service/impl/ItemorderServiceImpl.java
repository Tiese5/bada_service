package com.badaservice.service.impl;

import java.util.List;

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
	@Override
	public List<ItemOrder> selectBuyList(ItemOrder itemorder) throws Exception {

		List<ItemOrder> result = null;

		try {
			result = sqlsession.selectList("ItemOrderMapper.selectBuyList", itemorder);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 구매내역 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("구매내역 목록 조회에 실패했습니다.");
		}

		return result;
	}
	@Override
	public int selectBuyCount(ItemOrder itemorder) throws Exception {
		int result = 0;
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlsession.selectOne("ItemOrderMapper.selectBuyCount", itemorder);
			// 리턴값이 저장된 행의 수
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패 했습니다 ");
		}

		return result;
	}
	@Override
	public List<ItemOrder> selectAdminItemList(ItemOrder itemorder) throws Exception {
		List<ItemOrder> result = null;

		// 조회패턴
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlsession.selectList("ItemOrderMapper.selectAdminItemList", itemorder);
			// 리턴값이 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				// -->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQl 수행 내역을 되돌림
			throw new Exception("조회된 데이터가 없습니다");
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패 했습니다 ");
		} finally {
			// 입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
			sqlsession.commit();
			// 데이터 베이스 접속 해제

		}
		return result;
	}

	@Override
	public int selectAdminItemCount(ItemOrder itemorder) throws Exception {
		int result = 0;
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlsession.selectOne("ItemOrderMapperw.selectAdminItemCount", itemorder);
			// 리턴값이 저장된 행의 수
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패 했습니다 ");
		}
		return result;
		
		
	}
	

}



