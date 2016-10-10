package dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class AdminMemberDAO extends SqlSessionDaoSupport {

	public ArrayList selectMembers(){
		ArrayList allMembers = (ArrayList) getSqlSession().selectList("admin.selectMembers");
		return allMembers;
	}

	public int getMemberCount() {
		// TODO Auto-generated method stub
		int check = 0;
		check = getSqlSession().selectOne("admin.getMemberCount");
		return check;
	}

	public ArrayList selectPagingMembers(int page) {
		// TODO Auto-generated method stub
		ArrayList allMembers = (ArrayList) getSqlSession().selectList("admin.selectPagingMembers",page);
		return allMembers;
	}

	public ArrayList getMember(Map map) {
		// TODO Auto-generated method stub
		ArrayList members = (ArrayList) getSqlSession().selectList("admin.getMember",map);
		return members;
	}
}
