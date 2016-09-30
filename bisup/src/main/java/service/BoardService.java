package service;

import java.util.List;
import java.util.Map;

import command.BoardCommand;

public interface BoardService {
	
	//��ü ��
	List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception; 
	//�� ����
	BoardCommand selectboardContents(Map<String, Object>Map, int num)throws Exception;
	
	//�� ī��Ʈ?....
	
	//�� ����
	public void updateBoard(BoardCommand boardCommand) throws Exception;
	//�� ����
	public void deleteBoard(int num) throws Exception;
	//�� ����
	public void insertBoard(BoardCommand boardCommand) throws Exception;
	
}
