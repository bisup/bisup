package service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import command.BoardCommand;
import dao.NoticeDAO;

public class NoticeServiceImple implements BoardService{

	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	public NoticeDAO getNoticeDAO() {
		return noticeDAO;
	}

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public List<BoardCommand> selectBoardList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectBoardList(map);
	}

	@Override
	public BoardCommand selectboardContents(int num) throws Exception {
		noticeDAO.updateCnt(num);
		return noticeDAO.selectBoardContents(num);
	}

	@Override
	public void insertBoard(BoardCommand boardCommand) throws Exception {
		noticeDAO.insertBoard(boardCommand);
	}

	@Override
	public void updateBoard(BoardCommand boardCommand) throws Exception {
		noticeDAO.updateBoard(boardCommand);
	}

	@Override
	public void deleteBoard(int num) throws Exception {
		noticeDAO.deleteBoard(num);
	}

	@Override
	public void updateCnt(int num) {
		noticeDAO.updateCnt(num);
	}

	@Override
	public int allCnt() {
		return noticeDAO.allCnt();
	}

	//사용안함
	@Override
	public String selectPW(int num) {
		return null;
	}


}
