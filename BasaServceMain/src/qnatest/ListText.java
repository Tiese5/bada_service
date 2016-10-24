package qnatest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.model.Qna;

public class ListText {
public static void main(String[] args) {
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	
	List<Qna> list = null;
	
	try {
		list = sqlSession.selectList("QnaMapper.selelctQnaList",null);	
	} catch (Exception e) {
		System.out.println(e.getLocalizedMessage());
		System.out.println("데이터 조회 실패");
	}finally {
		sqlSession.close();
	}
	for (int i = 0; i < list.size(); i++) {
		System.out.println(list.get(i));
	}
	
			
}
}
