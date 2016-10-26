package com.badaservice.controller.shop;

public class ITEMDrop {
	// 싱글톤 시작
	private static ITEMDrop current = null;

	public static ITEMDrop getInstance() {
		if (current == null) {
			current = new ITEMDrop();
		}
		return current;
	}

	public static void freeInstance() {
		// 객체에 null을 대입하면 메모리 에서 삭제
		current = null;

	}

	// 기본 생성자를 private 으로 은닉하면 new를 통한 생성 불가
	private ITEMDrop() {
		super();
		// 싱글톤 끝
	}

	public String getdropName(String category) throws Exception {
		String dropName = null;
		// 카테고이값이 존재할 경우 게시판 이름 판별
		if (category != null) {
			if (category.equals("1")) {
				dropName = "최신순";
			} else if (category.equals("2")) {
				dropName = "인기순";
			} else if (category.equals("3")) {
				dropName = "낮은가격순";
			} else if (category.equals("4")) {
				dropName = "가나다순";
			}
		}
		if (dropName == null) {
			throw new Exception("존재하지 않는 카테고리 입니다.");
		}
		return dropName;
	}
	
}
