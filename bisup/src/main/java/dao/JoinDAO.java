package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class JoinDAO extends SqlSessionDaoSupport{
	
	 public int insertMember(MemberCommand command){
		int x= 0;
		x=getSqlSession().insert("JoinDAO.insertMember", command);
		return x; 
	 }
	 
	 public void upcerti(String id){  //�����ٿ�
			int x= 0;
			System.out.println("���̿� ���̵�::"+id);
			 x = getSqlSession().update("JoinDAO.upcer", id);
		 }
	 
	 public MemberCommand selectId(MemberCommand membercommand){
		 MemberCommand result =(MemberCommand) getSqlSession().selectOne("JoinDAO.find", membercommand);   
		 return result;
	 }
	 

	 public int selectall(String id){ //���̵� �ٰ������°�
		 
		 int mc = getSqlSession().selectOne("JoinDAO.selectid", id); 
		 System.out.println("mc="+mc);
		 return mc;
		 
	 } 
	 public List select(){ //���̵� �ٰ������°�
		 
		 List mc = getSqlSession().selectList("JoinDAO.selectAll"); 
		 return mc;
	 }	 
}
