package service;

import java.util.List;
import java.util.Map;

import command.BoardCommand;

public interface BoardService {

	// 전체 글
	List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception;

	// 글 내용
	BoardCommand selectboardContents(int num) throws Exception;

	// 글 쓰기
	public void insertBoard(BoardCommand boardCommand) throws Exception;

	// 글 수정
	public void updateBoard(BoardCommand boardCommand) throws Exception;

	// 글 삭제
	public void deleteBoard(int num) throws Exception;

	// 글 조회수 증가
	public void updateCnt(int num);

	// 전체 글 개수
	public int allCnt();

	// 글 조회시 비밀번호 확인
	public String selectPW(int num);
}
