package dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.SaleCommand;

public class SalesDAO extends SqlSessionDaoSupport{

	public int insertSales(SaleCommand salecommand)
	{
			return getSqlSession().insert("sale.insert", salecommand);
		}

	public List<String> getListData(String string,String id){
		List<String> selectsales = getSqlSession().selectList(string,id);
		return selectsales;
}
}