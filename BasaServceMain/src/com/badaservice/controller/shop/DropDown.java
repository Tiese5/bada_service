package com.badaservice.controller.shop;

public class DropDown {
	// 싱글톤 시작
	private static DropDown current = null;

	public static DropDown getInstance() {
		if (current == null) {
			current = new DropDown();
		}
		return current;
	}

	public static void freeInstance() {
		// 객체에 null을 대입하면 메모리 에서 삭제
		current = null;

	}

	// 기본 생성자를 private 으로 은닉하면 new를 통한 생성 불가
	private DropDown() {
		super();
		// 싱글톤 끝
	}

	public String getDropDown(String dropDown) throws Exception {
		String dropDownName = null;
		// 카테고이값이 존재할 경우 게시판 이름 판별
		if (dropDown != null) {
			if (dropDown.equals("1")) {
				dropDownName = "최신순";
			} else if (dropDown.equals("2")) {
				dropDownName = "인기순";
			} else if (dropDown.equals("3")) {
				dropDownName = "낮은 가격순";
			} else if (dropDown.equals("4")) {
				dropDownName = "가나다순";
			}

			if (dropDownName == null) {
				throw new Exception("존재하지 않는 카테고리 입니다.");
			}
		}
		return dropDownName;
	}
}
