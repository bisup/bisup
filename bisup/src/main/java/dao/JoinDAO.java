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
	 
	 public void upcerti(String id){  //인증다오
			int x= 0;
			System.out.println("디에이오 아이디::"+id);
			 x = getSqlSession().update("JoinDAO.upcer", id);
		 }
	 
	 public MemberCommand selectId(MemberCommand membercommand){
		 MemberCommand result =(MemberCommand) getSqlSession().selectOne("JoinDAO.find", membercommand);   
		 return result;
	 }
	 

	 public int selectall(String id){ //아이디를 다가져오는것
		 
		 int mc = getSqlSession().selectOne("JoinDAO.selectid", id); 
		 System.out.println("mc="+mc);
		 return mc;
		 
	 } 
	 public List select(){ //아이디를 다가져오는것
		 
		 List mc = getSqlSession().selectList("JoinDAO.selectAll"); 
		 return mc;
	 }	 
}
