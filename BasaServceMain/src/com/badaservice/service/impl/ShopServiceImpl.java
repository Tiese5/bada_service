package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;

public class ShopServiceImpl implements ShopService {
	Logger logger;
	SqlSession sqlSession;

	public ShopServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertItem(Shop shop) throws Exception {
		// 수정 삭제 입력 패턴
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			int result = sqlSession.insert("ShopMapper.insertItem", shop);
			// 리턴값이 저장된 행의 수
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				// -->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			// 에러가 발생했으므로 SQl 수행 내역을 되돌림
			sqlSession.rollback();
			System.out.println(e.getLocalizedMessage());
			throw new Exception("저장된 상품이 없습니다");
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlSession.rollback(); // SQl문 문법에러 제약조건
			e.printStackTrace();
			throw new Exception("상품 정보 등록에 실패했습니다");
		} finally {
			// 입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
			sqlSession.commit();
			// 데이터 베이스 접속 해제
		}

	}

	@Override
	public List<Shop> selectItemList(Shop shop) throws Exception {

		List<Shop> result = null;
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlSession.selectList("ShopMapper.selectItemList", shop);
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
			sqlSession.commit();
			// 데이터 베이스 접속 해제
		}
		return result;
	}

	@Override
	public int selectItemCount(Shop shop) throws Exception {
		int result = 0;
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlSession.selectOne("ShopMapper.selectItemCount", shop);
			// 리턴값이 저장된 행의 수
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			logger.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패 했습니다 ");
		}

		return result;

	}

	@Override
	public Shop selectItem(Shop shop) throws Exception {
		Shop result = null;
		try {
			//ProfessorMapper.updateProfessorItem 기능을 호출한다.
			//두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			result = sqlSession.selectOne("ShopMapper.selectItem",shop);
			//리턴값이 저장된 행의 수
			if (result == null) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				//-->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
				}	
			} catch (NullPointerException e) {
				//에러가 발생했으므로 SQl 수행 내역을 되돌림
				System.out.println("조회된 게시물이 없습니다");
			} catch (Exception e) {
				//에러가 발생했으므로 SQL 수행 내역을 되돌림
				logger.error(e.getLocalizedMessage());
				throw new Exception("게시물 조회에 실패 했습니다 ");
			}finally {
				//입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
				sqlSession.commit();
				//데이터 베이스 접속 해제
			}
		return result;
	}

	@Override
	public void updeteItemHit(Shop shop) throws Exception {
		try {
			//ProfessorMapper.updateProfessorItem 기능을 호출한다.
			//두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			int result = sqlSession.update("ShopMapper.updeteItemHit",shop);
			//리턴값이 저장된 행의 수
			if (result == 0) {
				// 저장된 행이 없다면 강제로 예외를 발생시킨다
				//-->이 예외를 처리 가능한 catch 블록으로 제어가 이동한다.
				throw new NullPointerException();
				}	
			} catch (NullPointerException e) {
				//에러가 발생했으므로 SQl 수행 내역을 되돌림
				sqlSession.rollback();
				throw new Exception("존재하지 않는 게시물에 대한 요청입니다");
			} catch (Exception e) {
				//에러가 발생했으므로 SQL 수행 내역을 되돌림
				sqlSession.rollback();	//SQl문 문법에러 제약조건 
				e.printStackTrace();
				throw new Exception("조회수 갱신에 실패 했습니다");
			}finally {
				//입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
				sqlSession.commit();
			}

	}

}
