package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Document;
import com.badaservice.model.messenger;





public interface DocumentService {
	/**
	 * 게시물 등록
	 * @param documentmodel
	 * @throws Exception
	 */
	public void insertDocument(Document documentmodel)throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document - 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록 
	 * @throws Exception
	 */
	public List<Document> selectDocumentList(Document document) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다
	 * @param document - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return BbsDocument - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public Document selectDocument(Document document) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param messenger
	 * @return int
	 * @throws Exception
	 */
	public int selectDocumentCount(Document document) throws Exception;
	
	public void deleteDocument(Document document) throws Exception;
	
	public void updateDocument(Document document) throws Exception;
}
