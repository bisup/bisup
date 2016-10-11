package dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class consultingDAO extends SqlSessionDaoSupport{
	
	public List list1(String division){
		ArrayList concerting = (ArrayList) getSqlSession().selectList("trend.concerting1", division);
		return concerting;
	}
}
