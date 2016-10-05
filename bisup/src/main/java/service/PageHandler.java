package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.NoticeDAO;
import dao.QuestionDAO;

//페이지 갯수
@Component
public class PageHandler {

	@Autowired
	private QuestionDAO questionDAO;

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO; 
	}
	/*
	 * 		/*
		// 전체 페이지 갯수
		int totalPageCnt = pageHandler.QboardPageCount();  //0

		// 전체 게시글수
		int totalCnt = pageHandler.QboardAllNumber();
		
		// startPage, endPage
		int startPage = pageHandler.boardStartPage(pageNum);
		int endPage = pageHandler.QboardEndPage(pageNum);
	
		// 처음, 마지막 rowNumber
		List<Object> rowNumberList = new ArrayList<Object>();
		rowNumberList = pageHandler.boardSetPageNumber(pageNum);
		list = boardService.selectBoardList(map); //페이지 갯수만큼 가져온 값을 list에 저장
*/



	// 페이지 사이즈, 페이지 그룹
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 5;

	// 문의 전체 게시글 수
	public int QboardAllNumber() { //전체 개수 지금1
		int count = questionDAO.allCnt();
		return count;
	}


	// 문의 페이지 갯수
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

	//문의 endPage
	public int QboardEndPage(int pageNum) throws Exception {
		int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
		if (endPage > QboardPageCount()) {
			endPage = QboardPageCount();
		}
		return endPage;
	}

	// 처음, 마지막 rowNumber
	public List<Object> boardSetPageNumber(int pageNum) throws Exception {
		List<Object> list = new ArrayList<Object>();
		int endRow = PAGESIZE * pageNum;
		int startRow = endRow - PAGESIZE + 1;
		list.add(startRow);
		list.add(endRow);
		return list;
	}
}