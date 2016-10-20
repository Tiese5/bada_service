package com.badaservice.document.service;

import com.badaservice.model.Qna;

public interface QnaService {
	/**
	 * 1대1 질문 등록
	 * @param qna
	 * @throws Exception
	 */
	public void insertQna(Qna qna)throws Exception;
	
}
