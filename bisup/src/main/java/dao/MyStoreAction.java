package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;

public class MyStoreAction extends SqlSessionDaoSupport {

	public ArrayList selectMenu(String id){
		ArrayList menuList = (ArrayList) getSqlSession().selectList("mystore.selectMenu", id);
		return menuList;
	}
	
	public MenuCommand selectOneMenu(HashMap menu){
		MenuCommand oneMenu = getSqlSession().selectOne("mystore.selectOneMenu", menu);
		return oneMenu;	
	}
	
	public int insertMenu(MenuCommand command){
		int check = 0; check=getSqlSession().insert("mystore.insertMenu", command);
		return check;
	}
	
	public int updateMenu(MenuCommand command){
		int check = 0; check=getSqlSession().update("mystore.updateMenu", command);
		return check;
	}
}
