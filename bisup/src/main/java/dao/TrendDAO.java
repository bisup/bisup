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
		System.out.println(gucode);
		ArrayList total1 = (ArrayList) getSqlSession().selectList("trend.total", Integer.parseInt(gucode));
		return total1;	
	} 
	
	public List getListtotal1(String gucode){
		System.out.println(gucode);
		ArrayList total2 = (ArrayList) getSqlSession().selectList("trend.total1", Integer.parseInt(gucode));
		return total2;	
	} 
	
	public List getListtotal2(String gucode){
		System.out.println(gucode);
		ArrayList total3 = (ArrayList) getSqlSession().selectList("trend.total2", Integer.parseInt(gucode));
		return total3;	
	} 
	
	public List getListtotal3(String gucode){
		System.out.println(gucode);
		ArrayList total4 = (ArrayList) getSqlSession().selectList("trend.total3", Integer.parseInt(gucode));
		return total4;	
	} 
	

}
 