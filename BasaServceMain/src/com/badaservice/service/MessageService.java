package com.badaservice.service;

import java.util.List;

import com.badaservice.model.messenger;



public interface MessageService {
	/**
	 * 받은 쪽지함 목록을 조회한다
	 * @param messenger - 받은 쪽지함 목록
	 * @return messenger - 읽어들인 쪽지 데이터
	 * @throws Exception
	 */
	public List<messenger> selectMessageList(messenger messenger) throws Exception;
	
	/**
	 * 보낸 쪽지함 목록을 조회한다
	 * @param messenger - 보낸 쪽지함 목록
	 * @return messenger - 보낸 쪽지 데이터
	 * @throws Exception
	 */
	public List<messenger> selectMessageSendList(messenger messenger) throws Exception;
	
	
}
