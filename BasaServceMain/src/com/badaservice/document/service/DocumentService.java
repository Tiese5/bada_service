package com.badaservice.document.service;

import com.badaservice.model.Document;

public interface DocumentService {
	/**
	 * 게시물 등록
	 * @param documentmodel
	 * @throws Exception
	 */
	public void insertDocument(Document documentmodel)throws Exception;
	
}
