package dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public List<String> getListgu(String string){		
		List<String> total= getSqlSession().selectList(string);
		return total;
	}
	

}
 