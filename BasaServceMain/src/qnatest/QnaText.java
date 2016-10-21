package qnatest;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.model.Qna;
import com.badaservice.service.QnaService;
import com.badaservice.service.impl.QnaServiceImpl;

public class QnaText {
	public static void main(String[] args) {	
	Qna qna = new Qna();
	
	qna.setId(1);
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Logger logger = LogManager.getFormatterLogger();
	QnaService qnaService = new QnaServiceImpl(sqlSession, logger);
	logger.debug(qna.toString());
	
	try {
		qnaService.selectQna(qna);
	} catch (Exception e) {
		e.getLocalizedMessage();
		e.printStackTrace();
		sqlSession.close();
	}
	System.out.println(qna.toString());
	}
}
