package dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import command.MemoCommand;
import command.MenuCommand;

public class SocketDAO extends SqlSessionDaoSupport {

	public ArrayList<MemoCommand> selectText(String id){
		ArrayList<MemoCommand> textList = new ArrayList<MemoCommand>();
		textList=(ArrayList) getSqlSession().selectList("text.selectText", id);
		return textList;
	}
	
	public int insertText(MemoCommand command){
		int check = 0;
		check=getSqlSession().insert("text.insertText", command);
		return check;
	}
}
