package itemtest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.model.Shop;
import com.badaservice.service.ShopService;
import com.badaservice.service.impl.ShopServiceImpl;

public class ItemListTest {
public static void main(String[] args) {
	Logger logger = LogManager.getFormatterLogger();
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	ShopService itemService = new ShopServiceImpl(sqlSession, logger);
	
	List<Shop> list = null;
	
	try {
		list = itemService.selectItemList(null);
	} catch (Exception e) {
		System.out.println(e.getLocalizedMessage());
		e.printStackTrace();
		return;
	}finally{
		sqlSession.close();
	}
	for (int i = 0; i < list.size(); i++) {
		System.out.println(list.get(i).toString());
	}
	
}
}
