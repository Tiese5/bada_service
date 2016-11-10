package com.badaadmin.controller.qna;

public class AdminQNACommon {
	// 싱글톤 시작
	private static AdminQNACommon current = null;

	public static AdminQNACommon getInstance() {
		if (current == null) {
			current = new AdminQNACommon();
		}
		return current;
	}

	public static void freeInstance() {
		// 객체에 null을 대입하면 메모리 에서 삭제
		current = null;

	}

	// 기본 생성자를 private 으로 은닉하면 new를 통한 생성 불가
	private AdminQNACommon() {
		super();
		// 싱글톤 끝
	}

	public String getQNAName(String category) throws Exception {
		String qnaName = null;
		// 카테고이값이 존재할 경우 게시판 이름 판별
		if (category != null) {
			if (category.equals("1")) {
				qnaName = "판매관련";
			} else if (category.equals("2")) {
				qnaName = "배송";
			} else if (category.equals("3")) {
				qnaName = "환불";
			} else if (category.equals("4")) {
				qnaName = "기타";
			}
		}
		if (qnaName == null) {
			throw new Exception("존재하지 않는 카테고리 입니다.");
		}
		return qnaName;
	}
	
}
