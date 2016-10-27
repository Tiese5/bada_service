package itemtest;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;

public class InsertItemTest {
	public static void main(String[] args) {
		Shop shop = new Shop();
		shop.setCategory("1");
		shop.setContent("테스트으으");
		shop.setDropDown("1");
		shop.setHit(1);
		shop.setItem_title("테스트!@!@");
		shop.setPrice("10000");
		shop.setMember_id(5);
		shop.setHit(1);
		
		SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
		Logger logger = LogManager.getFormatterLogger();
		ShopService shopService = new ShopServiceImpl(sqlSession, logger);
		
		try {
			shopService.insertItem(shop);
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			e.printStackTrace();
			sqlSession.close();
		}
	}
}
