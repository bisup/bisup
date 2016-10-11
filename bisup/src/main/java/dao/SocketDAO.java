package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemoCommand;
import command.MenuCommand;

public class SocketDAO extends SqlSessionDaoSupport {

	public ArrayList selectText(String id){
		ArrayList textList = new ArrayList();
		textList=(ArrayList) getSqlSession().selectList("text.selectText", id);
		return textList;
	}
	
	public int insertText(MemoCommand command){
		int check = 0;
		check=getSqlSession().insert("text.insertText", command);
		return check;
	}

	public MemoCommand selectOneText(String mcontents) {
		// TODO Auto-generated method stub
		MemoCommand command = new MemoCommand();
		ArrayList arrayList = new ArrayList();
		arrayList=(ArrayList) getSqlSession().selectList("text.selectOneText",mcontents);
		command=(MemoCommand) arrayList.get(0);
		return command;
	}

	public int deleteText(String mcontents) {
		// TODO Auto-generated method stub
		int check=0;
		check=getSqlSession().delete("text.deleteText",mcontents);
		return check;
	}

	public void replyText(String mcontents) {
		// TODO Auto-generated method stub
		
	}
	
}
