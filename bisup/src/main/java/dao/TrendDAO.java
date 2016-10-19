package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.GuCommand;
import command.ReportedCommand;

public class TrendDAO extends SqlSessionDaoSupport{
	
	public List<GuCommand> getListgu(){		
		List<GuCommand> total= getSqlSession().selectList("trend.concerting");
		return total;
	}
	 
	public List getListtotal(String gucode){
		ArrayList total1 = (ArrayList) getSqlSession().selectList("trend.total", Integer.parseInt(gucode));
		return total1;	
	} 
	
	public List getListtotal1(String gucode){
		ArrayList total2 = (ArrayList) getSqlSession().selectList("trend.total1", Integer.parseInt(gucode));
		return total2;	
	} 
	
	public List getListtotal2(String gucode){
		ArrayList total3 = (ArrayList) getSqlSession().selectList("trend.total2", Integer.parseInt(gucode));
		return total3;	
	} 
	
	public List getListtotal3(String gucode){
		ArrayList total4 = (ArrayList) getSqlSession().selectList("trend.total3", Integer.parseInt(gucode));
		return total4;	
	} 
	
	public String listOne(String gucode){
		String one = getSqlSession().selectOne("trend.one", Integer.parseInt(gucode));
		return one;
	}
	
	public List<ReportedCommand> selectReportList(){
		List<ReportedCommand> list = getSqlSession().selectList("trend.selectReportList");
		return list;
	}

	public int insertReport(ReportedCommand rc) {
		int check1 = getSqlSession().insert("trend.insert", rc);
		return check1;
	}
	
	
	
	
	
	

}
 