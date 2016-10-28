package com.badaservice.service;

import com.badaservice.model.MemberName;

public interface MemberNameService {
	/**
	 * 게시물 한건 조회
	 * @param document 읽어들인 게시물 일련번호가 저장된 빈즈
	 * @return
	 * @throws Exception
	 */
	public MemberName selectItem(MemberName memberName) throws Exception;
	
}
