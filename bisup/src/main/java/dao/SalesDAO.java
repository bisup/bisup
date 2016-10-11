package dao;


import java.util.ArrayList;
import java.util.List;

//import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.SaleCommand;

public class SalesDAO extends SqlSessionDaoSupport{

	public List<MenuCommand> menuList(String id)
	{
		System.out.println("menuList"+id);
	return getSqlSession().selectList("sales.menuList",id);
	
	}
	

	public ArrayList salePerMon(String id){
		ArrayList salePerMon = (ArrayList) getSqlSession().selectList("sales.salePerMon", id);
		return salePerMon;
	}
}