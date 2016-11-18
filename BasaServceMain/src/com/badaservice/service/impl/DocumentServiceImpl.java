package com.badaservice.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.badaservice.model.Document;
import com.badaservice.model.messenger;
import com.badaservice.service.DocumentService;




public class DocumentServiceImpl implements DocumentService {
	Logger logger;
	SqlSession sqlSession;

	public DocumentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertDocument(Document documentmodel) throws Exception {
		// 수정 삭제 입력 패턴
		try {
			// ProfessorMapper.updateProfessorItem 기능을 호출한다.
			// 두번째 파라미터는 저장할 데이터를 담고있는 Beans객체
			int result = sqlSession.insert("DocumentMapper.insertDocument", documentmodel);
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
			throw new Exception("저장된 게시물이 없습니다");
		} catch (Exception e) {
			// 에러가 발생했으므로 SQL 수행 내역을 되돌림
			sqlSession.rollback(); // SQl문 문법에러 제약조건
			e.printStackTrace();
			throw new Exception("게시물 정보 등록에 실패했습니다");
		} finally {
			// 입력,수정,삭제 처리의 경우 실레 반영을 위해서 commit 필요함
			sqlSession.commit();
			// 데이터 베이스 접속 해제
		}

	}

	@Override
	public List<Document> selectDocumentList(Document document) throws Exception {

		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentMapper.selectDocumentList", document);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Document selectDocument(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("DocumentMapper.selectDocument", document);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다");
		}
		return result;
	}

	@Override
	public int selectDocumentCount(Document document) throws Exception {
		int result = 0;
		
		try {
			// 게시물 수가 0건인 경우도 있으므로
			// 결과값이 0인 경우에 대한 에외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentMapper.selectDocumentCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다");
		}
		
		return result;
	}

	@Override
	public void deleteDocument(Document document) throws Exception {
		try{
			int result = sqlSession.delete("DocumentMapper.deleteDocument", document);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch (NullPointerException e) {
			// TODO: handle exception
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다..");
		}catch (Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			e.printStackTrace();
			throw new Exception("게시물 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}

	}

	@Override
	public void updateDocument(Document document) throws Exception {
		try {
			int result = sqlSession.update("DocumentMapper.updateDocument", document);
			if( result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("글 수정 실패에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

}
