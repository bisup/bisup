package dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.SaleCommand;

public class SalesDAO extends SqlSessionDaoSupport{

//	public static ArrayList menuList (String id) {
//		ArrayList menuList = getSqlSession().selectList("sale.menulist", id);
//		return menuList;
//	}
	
//	public List<MenuCommand> menuList(String id)
//	{ List<MenuCommand> menulist= getSqlSession().selectList("sale.selectList",id);
//	return menulist;
//	}
//	
	public int insertSales(SaleCommand salecommand)
	{
			return getSqlSession().insert("sale.insert", salecommand);
		}

	public List<String> getListData(String string,String id){
		List<String> selectsales = getSqlSession().selectList(string,id);
		return selectsales;
	}

}
