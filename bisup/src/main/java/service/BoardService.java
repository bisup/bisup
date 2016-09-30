package service;

import java.util.List;
import java.util.Map;

import command.BoardCommand;

public interface BoardService {
	
	//전체 글
	List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception; 
	//글 내용
	BoardCommand selectboardContents(Map<String, Object>Map, int num)throws Exception;
	
	//글 카운트?....
	
	//글 수정
	public void updateBoard(BoardCommand boardCommand) throws Exception;
	//글 삭제
	public void deleteBoard(int num) throws Exception;
	//글 쓰기
	public void insertBoard(BoardCommand boardCommand) throws Exception;
	
}
