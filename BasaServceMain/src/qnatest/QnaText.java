package qnatest;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.badaservice.dao.MyBatisConnectionFactory;
import com.badaservice.document.service.QnaService;
import com.badaservice.model.Qna;
import com.badaservice.service.impl.QnaServiceImpl;

public class QnaText {
	public static void main(String[] args) {	
	Qna qna = new Qna();
	
	qna.setaContent("답변");
	qna.setAnswererId(1);
	qna.setCategory("D");
	qna.setqContent("질문");
	qna.setTitle("질문 제목");
	qna.setWriterId(1);
	
	SqlSession sqlSession = MyBatisConnectionFactory.getSqlSession();
	Logger logger = LogManager.getFormatterLogger();
	QnaService qnaService = new QnaServiceImpl(sqlSession, logger);
	logger.debug(qna.toString());
	
	try {
		qnaService.insertQna(qna);
	} catch (Exception e) {
		e.getLocalizedMessage();
		e.printStackTrace();
		sqlSession.close();
	}
	System.out.println(qna.toString());
	}
}
