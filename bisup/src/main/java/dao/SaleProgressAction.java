package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;

public class SaleProgressAction extends SqlSessionDaoSupport {

	public ArrayList salePerDay(String id){
		ArrayList salePerDay = (ArrayList) getSqlSession().selectList("sale.salePerDay", id);
		return salePerDay;
	}
	
}
