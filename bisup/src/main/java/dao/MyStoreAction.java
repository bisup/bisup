package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;

public class MyStoreAction extends SqlSessionDaoSupport {

	public ArrayList selectMenu(String id){
		ArrayList menuList = (ArrayList) getSqlSession().selectList("mystore.selectMenu", id);
		return menuList;
	}
	
	public MenuCommand selectOneMenu(Map menu){
		MenuCommand oneMenu = getSqlSession().selectOne("mystore.selectOneMenu", menu);
		System.out.println("DB로 값 가져옴. item은 "+oneMenu.getItem()+", price는 "+oneMenu.getPrice());
		return oneMenu;	
	}
	
	public String isInsertOrUpdate(Map info){
		String result = getSqlSession().selectOne("mystore.isInsertOrUpdate", info);
		return result;
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
