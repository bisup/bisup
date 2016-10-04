package service;

import java.util.List;
import java.util.Map;

import command.BoardCommand;

public interface BoardService {

	// ��ü ��
	List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception;

	// �� ����
	BoardCommand selectboardContents(int num) throws Exception;

	// �� ����
	public void insertBoard(BoardCommand boardCommand) throws Exception;

	// �� ����
	public void updateBoard(BoardCommand boardCommand) throws Exception;

	// �� ����
	public void deleteBoard(int num) throws Exception;

	// �� ��ȸ�� ����
	public void updateCnt(int num);

	// ��ü �� ����
	public int allCnt();

	// �� ��ȸ�� ��й�ȣ Ȯ��
	public String selectPW(int num);
}
