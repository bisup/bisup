package dao;

import org.apache.poi.util.SystemOutLogger;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemberCommand;

public class MypageDAO extends SqlSessionDaoSupport{
	
	public String Checkpw(String id){
		//로그인되어있는 상태에서 회원정보수정을 위한 비밀번호 확인 dao
		String cpw=getSqlSession().selectOne("mypage.checkpw", id);  
		System.out.println("DAO에서 cpw="+cpw);
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
		System.out.println("1번째 솔트="+sort1+"2번째 솔트="+sort2);
		System.out.println("ch="+ch);
		if(ch.equals("1")){
			String id=membercommand.getId();
			System.out.println(id);
			int y = getSqlSession().insert("mypage.changId",id);
			System.out.println(y);
			if(y==1)
			System.out.println("창업자로 변경");
		}
		
		return x;  
	}
	
	public int updatePro1(MemberCommand membercommand){
		//modifyPro
		int x = getSqlSession().update("mypage.updatePro1",membercommand);
		System.out.println("dao에서 x="+x);
		return x;  
	}
	
	public int deleteMem(String id){
		int x = getSqlSession().delete("mypage.deleteMember", id);
		System.out.println("x="+x);
		return x;
	}

}
