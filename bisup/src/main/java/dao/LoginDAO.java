package dao;

import org.apache.catalina.connector.Request;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class LoginDAO extends SqlSessionDaoSupport {
	
	public int selLog(String id, String pw){//login pW come
		int x=0;
		String passw=getSqlSession().selectOne("logmain.login", id);
		System.out.println(passw);
		if(passw.equals(pw))
		{
			 x=1;
		}else{
			x=-1;
		}
		System.out.println(x);
		return x;
		
	}

}
