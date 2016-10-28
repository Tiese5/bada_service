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
	
	/**
	 * 하나의 게시물을 읽어들인다
	 * @param messenger - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return messenger - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public messenger selectMessage(messenger messenger) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다
	 * @param messenger - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return messenger - 읽어들인 게시물 내용
	 * @throws Exception
	 */
	public messenger selectSendMessage(messenger messenger) throws Exception;
	
	/**
	 * 쪽지를 저장한다
	 * @param messenger
	 * @throws Exception 
	 */
	public void insertMessage(messenger messenger) throws Exception;
	
	/**
	 * 쪽지를 저장한다
	 * @param messenger
	 * @throws Exception 
	 */
	public void insertSendMessage(messenger messenger) throws Exception;
	
	/**
	 * 받은 쪽지함 전체 게시물 수 조회
	 * @param messenger
	 * @return int
	 * @throws Exception
	 */
	public int selectMessageCount(messenger messenger) throws Exception;
	
	/**
	 * 보낸 쪽지함 전체 게시물 수 조회
	 * @param messenger
	 * @return int
	 * @throws Exception
	 */
	public int selectMessageSendCount(messenger messenger) throws Exception;
	
	/**
	 * 보낸쪽지함 삭제
	 * @param messenger
	 * @throws Exception
	 */
	public void updateMessage(messenger messenger) throws Exception;
	
	/**
	 * 받은쪽지함 삭제
	 * @param messenger
	 * @throws Exception
	 */
	public void updateReceiverMessage(messenger messenger) throws Exception;
}
