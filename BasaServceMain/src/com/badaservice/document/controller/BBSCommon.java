package com.badaservice.document.controller;


public class BBSCommon {
	// --------- 싱글톤 객체 생성을 위한 준비 시작 ------------
	private static BBSCommon current = null;
	
	public static BBSCommon getInstance() {
		if(current == null) {
		current = new BBSCommon();
		}
		return current;
	}
	
	public static void freeInstance() {
		// 객체에 null을 대입하면 메모리에서 삭제된다.
		current = null;
	}
	
	// 기본 생성자를 private로 은닉하게 되면 new를 통한 객체 생성이 금지된다.
	private BBSCommon() {
		super();
	}
	
	// -------------- 싱글톤 객체 생성을 위한 준비 끝 ---------------
	
	public String getBbsName(String category) throws Exception {
		// 리턴할 게시판 이름
		String bbsName = null;
		
		// 카테코리값이 존재할 경우 게시판이름 판별
		if(category != null) {
			if(category.equals("n")) {
				bbsName ="공지사항";
			} else if(category.equals("f")) {
				bbsName = "자주묻는질문";
			}
		}
		
		// 생성된 게시판 이름이 없다면 예외를 발생시킨다.
		if(bbsName == null) {
			throw new Exception("존재하지 않는 게시판 입니다.");
		}
		return bbsName;
	}
}
