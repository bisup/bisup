package dao;


import java.util.ArrayList;
import java.util.List;

//import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.SaleCommand;
import command.SaleList;


public class SalesDAO extends SqlSessionDaoSupport{

	public List<MenuCommand> menuList(String id)
	{
		System.out.println("menuList"+id);
	return getSqlSession().selectList("sales.menuList",id);
	
	}
	
	public int insertSales(List<SaleList> saleList)
	{
		System.out.println("insertdao");
	return getSqlSession().insert("sales.insertSales",saleList);
	
	}

	public ArrayList salePerMon(String id){
		ArrayList salePerMon = (ArrayList) getSqlSession().selectList("sales.salePerMon", id);
		return salePerMon;
	}
}