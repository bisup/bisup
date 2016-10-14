package dao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.OtherCommand;
import command.SaleCommand;

public class SalesDAO extends SqlSessionDaoSupport{

	public List<MenuCommand> menuList(String id)
	{
		System.out.println("menuList"+id);
	return getSqlSession().selectList("sales.menuList",id);
	
	}
	
	public List<MenuCommand> menuList2(Map<String, String> map)
	{
		System.out.println("menuList"+map);
	return getSqlSession().selectList("sales.menuList2",map);
	
	}
	
	
	public int insertSales(SaleCommand saleCommand)
	{
		System.out.println("insert sales"+saleCommand);
	return getSqlSession().insert("sales.insertSales",saleCommand);
	
	}
	
	public List<SaleCommand> saleList(Map<String, String> map)
	{
		System.out.println("saleList"+map);
	return getSqlSession().selectList("sales.saleList",map);
	
	}
	
	public int insertTotal(SaleCommand saleCommand)
	{
		System.out.println("insert sales");
	return getSqlSession().update("sales.insertTotal",saleCommand);
	
	}
	
	public int updateSales(SaleCommand saleCommand)
	{
		System.out.println("update sales"+saleCommand);
	return getSqlSession().update("sales.updateSales",saleCommand);
	
	}
	
	
	
	// 부수비용 부분
	public int insertOther(OtherCommand otherCommand)
	{
		System.out.println("insertOther"+otherCommand);
	return getSqlSession().insert("sales.insertOther",otherCommand);
	
	}
	
	public List<OtherCommand> otherList(String id)
	{
		System.out.println("otherList"+id);
	return getSqlSession().selectList("sales.otherList",id);
	
	}
	
	public int otherTotal(OtherCommand otherCommand)
	{System.out.println("other Total"+otherCommand);
	return getSqlSession().update("sales.otherTotal",otherCommand);
	
	}
	
	public int updateOther(OtherCommand otherCommand)
	{
		System.out.println("updateOther"+otherCommand);
	return getSqlSession().update("sales.updateOther",otherCommand);
	
	}

	
	// 월별 매출 차트
	public ArrayList salePerMon(String id){
		ArrayList salePerMon = (ArrayList) getSqlSession().selectList("sales.salePerMon", id);
		return salePerMon;
	}
}