package com.badaservice.dao;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnectionFactory {

	/**데이터베이트 접속 객체*/
	private static SqlSessionFactory sqlSessionFactory;
	
	/** XML에 명시된 접속 정보를 읽어 들인다 */
	static{
		//접속 정보를 명시하고 있는 XML 의 경로 읽기
		try {
			Reader reader = Resources.getResourceAsReader(
					"com/badaservice/dao/config.xml");
			
			if (sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		}catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
}
	/**데이터 베이스 접속 객체를 리턴한다*/
	public static SqlSession getSqlSession(){
		return sqlSessionFactory.openSession();
		
	}
}




