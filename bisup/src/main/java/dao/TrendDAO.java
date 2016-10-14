package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public List<GuCommand> getListgu(){		
		List<GuCommand> total= getSqlSession().selectList("trend.concerting");
		return total;
	}
	
	public List getListtotal(String gucode){
		ArrayList total1 = (ArrayList) getSqlSession().selectList("trend.total", Integer.parseInt(gucode));
		return total1;	
	} 
	

}
 