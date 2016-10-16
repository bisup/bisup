package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;

public class SGISDAO extends SqlSessionDaoSupport {
	
	public List<GuCommand> guselect(){
	return getSqlSession().selectList("JoinDAO.selectGu");
	}
	
	//admcd���̺� ���� ��������
	public List<GuCommand> GuS(){
		return getSqlSession().selectList("JoinDAO.GuS");
	}
	
	//admcd���̺� ����������
	public List<GuCommand> dongS(int gcode){
		
		return getSqlSession().selectList("JoinDAO.dongS",gcode);
	}
	
	public List<GuCommand> getdan(int dcode){
		return getSqlSession().selectList("JoinDAO.danger",dcode);
	}
	
	public List<GuCommand> getd(int dcode){
		return getSqlSession().selectList("JoinDAO.dand",dcode);
	}
	
}
