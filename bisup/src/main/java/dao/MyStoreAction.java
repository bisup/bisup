package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MenuCommand;
import command.SaleCommand;

public class MyStoreAction extends SqlSessionDaoSupport {

	public ArrayList selectMenu(String id){
		ArrayList menuList = (ArrayList) getSqlSession().selectList("mystore.selectMenu", id);
		return menuList;
	}
	
	public MenuCommand selectOneMenu(Map menu){
		MenuCommand oneMenu = getSqlSession().selectOne("mystore.selectOneMenu", menu);
		System.out.println("DB�� �� ������. item�� "+oneMenu.getItem()+", price�� "+oneMenu.getPrice());
		return oneMenu;	
	}
	
	public List searchMenuByItem(String item){
		List menuByItem = getSqlSession().selectList("mystore.searchMenuByItem", item);
		return menuByItem;
	}
	
	public List searchMenuByPrice(int price){
		List menuByPrice = getSqlSession().selectList("mystore.searchMenuByItem", price);
		return menuByPrice;
	}
	
	public int isInsertOrUpdate(Map info){
		System.out.println("�Է�/���� ������ �׽�Ʈ id:::"+info.get("id")+", item:::"+info.get("item"));
		int check = 0;
		check = getSqlSession().selectOne("mystore.isInsertOrUpdate", info);
		return check;
	}
	
	public int insertMenu(MenuCommand command){
		System.out.println("�޴��Է� ������ �׽�Ʈ id:::"+command.getId()+", item:::"+command.getItem()+", price:::"+command.getPrice());
		int check = 0; check=getSqlSession().insert("mystore.insertMenu", command);
		return check;
	}
	
	public int updateMenu(MenuCommand command){
		System.out.println("�޴����� ������ �׽�Ʈ id:::"+command.getId()+", item:::"+command.getItem()+", price:::"+command.getPrice());
		int check = 0; check=getSqlSession().update("mystore.updateMenu", command);
		return check;
	}
	
	public int deleteMenu(Map info){
		System.out.println("�޴����� �׽�Ʈ id:::"+info.get("id")+", item:::"+info.get("item"));
		int check = 0;
		check = getSqlSession().delete("mystore.deleteMenu", info);
		return check;
	}

	public int getAllUsers(int allUsers) {
		// TODO Auto-generated method stub
		allUsers=getSqlSession().selectOne("mystore.getAllUsers");
		return allUsers;
	}

	public int getUpdatedUsers(int updatedUsers) {
		// TODO Auto-generated method stub
		updatedUsers=getSqlSession().selectOne("mystore.getUpdatedUsers");
		return updatedUsers;
	}
	
	public int inmenu(MenuCommand mc) {
		int check = 0;
		check = getSqlSession().insert("JoinDAO.inmenu", mc);
		return check;
	}
}
