package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.NoticeDAO;
import dao.QuestionDAO;

//������ ����
@Component
public class PageHandler {

	@Autowired
	private QuestionDAO questionDAO;

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO; 
	}
	/*
	 * 		/*
		// ��ü ������ ����
		int totalPageCnt = pageHandler.QboardPageCount();  //0

		// ��ü �Խñۼ�
		int totalCnt = pageHandler.QboardAllNumber();
		
		// startPage, endPage
		int startPage = pageHandler.boardStartPage(pageNum);
		int endPage = pageHandler.QboardEndPage(pageNum);
	
		// ó��, ������ rowNumber
		List<Object> rowNumberList = new ArrayList<Object>();
		rowNumberList = pageHandler.boardSetPageNumber(pageNum);
		list = boardService.selectBoardList(map); //������ ������ŭ ������ ���� list�� ����
*/



	// ������ ������, ������ �׷�
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 5;

	// ���� ��ü �Խñ� ��
	public int QboardAllNumber() { //��ü ���� ����1
		int count = questionDAO.allCnt();
		return count;
	}


	// ���� ������ ����
	public int QboardPageCount() throws Exception {
		int x =questionDAO.allCnt();
		if(x <= 10 && x>= 0 ){
			x=10;
		}
		int pageCount =x/ PAGESIZE; //0
		if (x % PAGESIZE != 0) { 
			pageCount++;
		}
		return pageCount;
	}

	// startPage
	public int boardStartPage(int pageNum) throws Exception {
		int startPage = (pageNum - 1) / PAGEGROUP * PAGEGROUP + 1;
		return startPage;
	}

	//���� endPage
	public int QboardEndPage(int pageNum) throws Exception {
		int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
		if (endPage > QboardPageCount()) {
			endPage = QboardPageCount();
		}
		return endPage;
	}

	// ó��, ������ rowNumber
	public List<Object> boardSetPageNumber(int pageNum) throws Exception {
		List<Object> list = new ArrayList<Object>();
		int endRow = PAGESIZE * pageNum;
		int startRow = endRow - PAGESIZE + 1;
		list.add(startRow);
		list.add(endRow);
		return list;
	}
}