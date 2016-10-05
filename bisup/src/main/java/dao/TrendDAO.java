package dao;


import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public int list(String item){
		int selectsales=getSqlSession().selectOne("trend.list", item);
		return selectsales;
	}


}
 