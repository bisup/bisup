package dao;


import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class JoinDAO extends SqlSessionDaoSupport{
	
	 public int insertMember(MemberCommand command){
		int x= 0;
		x=getSqlSession().insert("JoinDAO.insertMember", command);
		return x; 
	 }
	 
	 public int upcerti(String id){  //�����ٿ�
			int x= 0;
			System.out.println("���̿� ���̵�::"+id);
			x=getSqlSession().update("JoinDAO.upcer", id);
			return x; 
		 }
	 
	 public MemberCommand selectId(MemberCommand membercommand){
		 MemberCommand result =(MemberCommand) getSqlSession().selectOne("JoinDAO.find", membercommand);   
		 return result;
	 }
}
