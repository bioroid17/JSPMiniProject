package mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapClient {
	private static SqlSession session;
	static {
		// 이 안의 모든 요소는 static으로 선언됨
		String resource = "mybatis/sqlMapConfig.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
			session = factory.openSession(true); // transcation 처리를 위해 기본적으로 이 코드는 적용이 안됨. true를 주면 auto commit 가능
			// JDBC는 기본적으로 auto commit
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSession() {
		return session;
	}
}
