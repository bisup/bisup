package dao;


import java.util.ArrayList;
import java.util.List;

//import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.SaleCommand;


public class SalesDAO extends SqlSessionDaoSupport{

//	public static ArrayList menuList (String id) {
//		ArrayList menuList = getSqlSession().selectList("sale.menulist", id);
//		return menuList;
//	}
//	
//	public List<MenuCommand> menuList(String id)
//	{
//		System.out.println("dd"+id);
//	return getSqlSession().selectList("sale.menuList",id);
//	
//	}
//	
	
	public int insertSales(SaleCommand salecommand)
	{
			return getSqlSession().insert("sale.insert", salecommand);
		}

//	public List<String> menulist(String id) {
//		List<String> menulist = getSqlSession().selectList("sale.menulist", id);
//		return menulist;
//	}
	public List<MenuCommand> menuList(String id) {
		return getSqlSession().selectList("sale.menulist", id);
	}

//	public List<String> getListData(String string,String id){
//		List<String> selectsales = getSqlSession().selectList(string,id);
//		return selectsales;
//	}
	
	public ArrayList salePerMon(String id){
		ArrayList salePerMon = (ArrayList) getSqlSession().selectList("sales.salePerMon", id);
		return salePerMon;
	}
}