package com.badaservice.controller.shop;

public class ItemCategory {
	// 싱글톤 시작
	private static ItemCategory current = null;

	public static ItemCategory getInstance() {
		if (current == null) {
			current = new ItemCategory();
		}
		return current;
	}

	public static void freeInstance() {
		// 객체에 null을 대입하면 메모리 에서 삭제
		current = null;

	}

	// 기본 생성자를 private 으로 은닉하면 new를 통한 생성 불가
	private ItemCategory() {
		super();
		// 싱글톤 끝
	}

	public String getItemCategory(String category) throws Exception {
		String categoryName = null;
		// 카테고이값이 존재할 경우 게시판 이름 판별
		if (category != null) {
			if (category.equals("1")) {
				categoryName = "학문";
			} else if (category.equals("2")) {
				categoryName = "소설";
			} else if (category.equals("3")) {
				categoryName = "자기계발";
			} else if (category.equals("4")) {
				categoryName = "정기 간행물";
			} else if (category.equals("5")) {
				categoryName = "어린이 도서";
			}else if (category.equals("0")) {
				categoryName = "전체";
			}
			if (categoryName == null) {
				throw new Exception("존재하지 않는 카테고리 입니다.");
			}
		}
		return categoryName;
	}
}
