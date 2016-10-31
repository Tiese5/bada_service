package com.badaservice.controller.shop;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.helper.BaseController;
import com.badaservice.helper.FileInfo;
import com.badaservice.helper.RegexHelper;
import com.badaservice.helper.UploadHelper;
import com.badaservice.helper.WebHelper;
import com.badaservice.model.Member;
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;

/**
 * Servlet implementation class sale
 */
@WebServlet("/shop/item_add_ok.do")
public class saleOk extends BaseController {
	private static final long serialVersionUID = 1387125215824808421L;
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	UploadHelper upload;
	RegexHelper regex;
	ItemCategory itemcategory;
	ShopService shopService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		web = WebHelper.getInstance(request, response);
		itemcategory = ItemCategory.getInstance();
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		logger = LogManager.getFormatterLogger(request.getRemoteUser());
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		shopService = new ShopServiceImpl(sqlSession, logger);
		
		/**3)파라미터 받기*/
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.close();
			web.redirect(null, "mulltipart 데이터가 아닙니다");
			return null;
		}
		
		Map<String, String> ParamMap = upload.getParamMap();
		String itemTitle = ParamMap.get("item_title");
		String category = ParamMap.get("category");
		String price = ParamMap.get("price");
		int memberId = 0;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		logger.debug("item_title=" + itemTitle);
		logger.debug("category=" + category);
		logger.debug("price=" + price);
		

		if (!regex.isValue(itemTitle)) {
			sqlSession.close();
			web.redirect(null, "책 제목을 입력하세요");
			return null;
		}
		if (!regex.isEngNum(category)) {
			sqlSession.close();
			web.redirect(null, "카테고리를 선택해 주세요");
			return null;
		}
		if (!regex.isValue(price)) {
			sqlSession.close();
			web.redirect(null, "가격을 입력해 주세요");
			return null;
		}
		if (!regex.isNum(price)) {
			sqlSession.close();
			web.redirect(null, "가격은 숫자로 입력해 주세요");
			return null;
		}
		
		/** 6) 업로드된 파일 정보 추출 */
		List<FileInfo> fileList = upload.getFileList();
		// 업로드 된 프로필 사진 경로가 저장될 변수
		String itemImage = null;

		if (fileList.size() > 0) {
			FileInfo fileInfo = fileList.get(0);
			itemImage = fileInfo.getFileDir() + "/" + fileInfo.getFileName();
		}
		Shop shop = new Shop();
		shop.setItem_title(itemTitle);
		shop.setCategory(category);
		shop.setPrice(price);
		shop.setItem_image(itemImage);
		shop.setMember_id(memberId);

		
		try {
			shopService.insertItem(shop);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			e.printStackTrace();
		}

		
		web.redirect(web.getRootPath() + "/shop/main.do", "상품이 등록 되었습니다");

		return null;

	}

}
