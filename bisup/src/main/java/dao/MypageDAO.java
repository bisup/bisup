package dao;

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
		System.out.println("dao에서 x="+x);
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
