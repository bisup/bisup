package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;
import command.MemberCommand;

public class AdminMemberDAO extends SqlSessionDaoSupport {

	public ArrayList selectMembers(){
		ArrayList allMembers = (ArrayList) getSqlSession().selectList("admin.selectMembers");
		return allMembers;
	}//member���̺��� ��� ������ �ҷ����� �޼ҵ�

	public int getMemberCount() {
		// TODO Auto-generated method stub
		int check = 0;
		check = getSqlSession().selectOne("admin.getMemberCount");
		return check;
	}//member���̺��� �� ����

	public ArrayList getMember(Map map) {
		// TODO Auto-generated method stub
		ArrayList members = (ArrayList) getSqlSession().selectList("admin.getMember",map);
		return members;
	}//pageNumber�� �Ѿ���� �� �ش� ȸ���� �������� �ϴ� �޼ҵ�
	
	
	public List<MemberCommand> getStore(){
		List<MemberCommand> getstore = getSqlSession().selectList("admin.getStore");
		return getstore;
	}
	
	public List<MemberCommand> getGucode(){
		return getSqlSession().selectList("admin.getgucode");
	}
}
