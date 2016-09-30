package dao;

import org.apache.catalina.connector.Request;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class LoginDAO extends SqlSessionDaoSupport {
	
	public int selLog(String id, String pw){//login pW come
		int x=0;
		String loginID ="";
		loginID = getSqlSession().selectOne("logmain.loginID",id);
	if(loginID != null){
		String passw=getSqlSession().selectOne("logmain.login", id);
		int sort=getSqlSession().selectOne("logmain.loginType",id);
		System.out.println(passw);
		if(passw.equals(pw))
		{
			x=sort;
		}else{
			x=-1;
		}
		System.out.println(x);
		return x;
		
	}else{
			x=-2;
			return x;
		}
	}
}
