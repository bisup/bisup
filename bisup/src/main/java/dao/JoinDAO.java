package dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;
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
	 
	 public List<GuCommand> gu(){//행정구 가져오는것
		
		List<GuCommand> list= new ArrayList<GuCommand>();
		list = getSqlSession().selectList("JoinDAO.selectGu");
		return list;
	 }
	 
 public int selectnick(String nick){ //닉네임 중복
		 
		 int mc = getSqlSession().selectOne("JoinDAO.nick", nick); 
		 System.out.println("mc="+mc);
		 return mc;
		 
	 } 
 public int selectsnum(int snum){ //사업자번호 중복
	 
	 int mc = getSqlSession().selectOne("JoinDAO.ss", snum); 
	 //System.out.println("mc="+mc);
	 return mc;
	 
 } 
 public int countid(MemberCommand command){ //이메일 이름 존재
	 
	 int idc = getSqlSession().selectOne("JoinDAO.count", command); 
	 //System.out.println("mc="+mc);
	 return idc;
	 
 } 
 public int selectE(String email){ //이메일 중복
	 
	 int idc = getSqlSession().selectOne("JoinDAO.cemail", email); 
	 //System.out.println("mc="+mc);
	 return idc;
	 
 } 

}
