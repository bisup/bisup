package dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class JoinDAO extends SqlSessionDaoSupport {
	
	private MemberCommand membercommand;
	
	public void insertMem(){
	int x=getSqlSession().insert("join.joinsert", membercommand);
	if(x==1){
		System.out.println("insert¼º°ø");
	}
	
	}
}
