package dao;

import org.apache.poi.util.SystemOutLogger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class MypageDAO extends SqlSessionDaoSupport{
	
	public String Checkpw(String id){
		//�α��εǾ��ִ� ���¿��� ȸ������������ ���� ��й�ȣ Ȯ�� dao
		String cpw=getSqlSession().selectOne("mypage.checkpw", id);  
		System.out.println("DAO���� cpw="+cpw);
		return cpw;
	}
	
	public MemberCommand updateForm(String id){
		MemberCommand membercommand = getSqlSession().selectOne("mypage.updateForm",id);
		return membercommand;
	}
	
	
	public int updatePro(MemberCommand membercommand){
		//modifyPro
		int x = getSqlSession().update("mypage.updatePro",membercommand);
	
		return x;  
	}
	
	public int updatePro(MemberCommand membercommand,String ch){
		//modifyPro
		int sort1=membercommand.getSort();
		
		int x = getSqlSession().update("mypage.updatePro",membercommand);
		
		int sort2=membercommand.getSort();
		System.out.println("1��° ��Ʈ="+sort1+"2��° ��Ʈ="+sort2);
		System.out.println("ch="+ch);
		if(ch.equals("1")){
			String id=membercommand.getId();
			System.out.println(id);
			int y = getSqlSession().insert("mypage.changId",id);
			System.out.println(y);
			if(y==1)
			System.out.println("â���ڷ� ����");
		}
		
		return x;  
	}
	
	public int updatePro1(MemberCommand membercommand){
		//modifyPro
		int x = getSqlSession().update("mypage.updatePro1",membercommand);
		System.out.println("dao���� x="+x);
		return x;  
	}
	
	public int deleteMem(String id){
		int x = getSqlSession().delete("mypage.deleteMember", id);
		System.out.println("x="+x);
		return x;
	}

}
