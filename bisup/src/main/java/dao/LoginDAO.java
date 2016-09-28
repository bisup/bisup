package dao;

import org.apache.catalina.connector.Request;
import org.mybatis.spring.support.SqlSessionDaoSupport;

public class LoginDAO extends SqlSessionDaoSupport {
	
	public String selLog(String id){//login pW come
		String passw ="";
		passw=getSqlSession().selectOne("logmain.login",id);
		System.out.println();
		return passw;
		
	}

}
