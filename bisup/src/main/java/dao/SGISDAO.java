package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;

public class SGISDAO extends SqlSessionDaoSupport {
	
	public List<GuCommand> guselect(){
	return getSqlSession().selectList("JoinDAO.selectGu");
	}
}
