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
	 
	 public List<GuCommand> gu(){//������ �������°�
		
		List<GuCommand> list= new ArrayList<GuCommand>();
		list = getSqlSession().selectList("JoinDAO.selectGu");
		return list;
	 }
	 
 public int selectnick(String nick){ //�г��� �ߺ�
		 
		 int mc = getSqlSession().selectOne("JoinDAO.nick", nick); 
		 System.out.println("mc="+mc);
		 return mc;
		 
	 } 
 public int selectsnum(int snum){ //����ڹ�ȣ �ߺ�
	 
	 int mc = getSqlSession().selectOne("JoinDAO.ss", snum); 
	 //System.out.println("mc="+mc);
	 return mc;
	 
 } 
 public int countid(MemberCommand command){ //�̸��� �̸� ����
	 
	 int idc = getSqlSession().selectOne("JoinDAO.count", command); 
	 //System.out.println("mc="+mc);
	 return idc;
	 
 } 
 public int selectE(String email){ //�̸��� �ߺ�
	 
	 int idc = getSqlSession().selectOne("JoinDAO.cemail", email); 
	 //System.out.println("mc="+mc);
	 return idc;
	 
 } 

}
