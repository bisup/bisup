package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.AdmcdCommand;
import command.GuCommand;
import command.MemberCommand;

public class AdminMemberDAO extends SqlSessionDaoSupport {

	public ArrayList selectMembers(Map startEndNum){
		ArrayList allMembers = (ArrayList) getSqlSession().selectList("admin.selectMembers",startEndNum);
		return allMembers;
	}//member테이블의 모든 정보를 불러오는 메소드

	public int getMemberCount() {
		// TODO Auto-generated method stub
		int check = 0;
		check = getSqlSession().selectOne("admin.getMemberCount");
		return check;
	}//member테이블의 줄 갯수

	public ArrayList getMember(Map map) {
		// TODO Auto-generated method stub
		ArrayList members = (ArrayList) getSqlSession().selectList("admin.getMember",map);
		return members;
	}//pageNumber가 넘어왔을 시 해당 회원만 나오도록 하는 메소드
	
	
	public List<MemberCommand> getStore(){
		List<MemberCommand> getstore = getSqlSession().selectList("admin.getStore");
		return getstore;
	}
	
	public List<MemberCommand> getGucode(){
		return getSqlSession().selectList("admin.getgucode");
	}

	public ArrayList getGu() {
		// TODO Auto-generated method stub
		return (ArrayList) getSqlSession().selectList("admin.getGu");
	}

	public int getGuMem(AdmcdCommand command) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("admin.getGuMem",command.getGcode());
	}
}
