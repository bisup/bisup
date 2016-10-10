package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public List<GuCommand> getListgu(){		
		List<GuCommand> total= getSqlSession().selectList("trend.concerting");
		return total;
	}
	

}
 