package qnatest;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;

public class DeleteQna {
public static void main(String[] args) {
	Qna qna= new Qna();
	qna.setId(1);
	
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Logger logger = LogManager.getFormatterLogger();
	QnaService qnaService = new QnaServiceImpl(sqlSession, logger);
	
	try {
		qnaService.deleteQna(qna);
	} catch (Exception e) {
		System.out.println(e.getLocalizedMessage());
		e.printStackTrace();
	}
	System.out.println(qna.getId()+"번쨰 아이디 삭제");
}
}
