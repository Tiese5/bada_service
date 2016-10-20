package com.badaservice.service;

import java.util.List;

import com.badaservice.model.Qna;

public interface QnaService {
	/**
	 * 1대1 질문 등록
	 * @param qna
	 * @throws Exception
	 */
	public void insertQna(Qna qna)throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document -카테고리 정보가 저장된 빈즈
	 * @return  List - 게시물 목록
	 * @throws Exception
	 */
	public List<Qna> selelctQnaList(Qna qna) throws Exception;
	/**
	 * 전체 게시물 조횐
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectQnaCount(Qna qna) throws Exception;
	
}
