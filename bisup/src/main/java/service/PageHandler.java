package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dao.NoticeDAO;
import dao.QuestionDAO;

//페이지 갯수
public class PageHandler {

	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private NoticeDAO noticeDAO;

	public void setQuestionDAO(QuestionDAO questionDAO) {
		this.questionDAO = questionDAO; 
	}

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	// 페이지 사이즈, 페이지 그룹
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 5;

	// 문의 전체 게시글 수
	public int QboardAllNumber(Map<String, Object> map) throws Exception {
		int count = questionDAO.allCnt(map);
		return count;
	}

	// 공지사항 전체 게시글 수
	public int NboardAllNumber(Map<String, Object> map) throws Exception {
		int count = questionDAO.allCnt(map);
		return count;
	}

	// 문의 페이지 갯수
	public int QboardPageCount(Map<String, Object> map) throws Exception {
		int pageCount = QboardAllNumber(map) / PAGESIZE;
		if (QboardAllNumber(map) % PAGESIZE != 0) {
			pageCount++;
		}
		return pageCount;
	}

	// 공지사항 페이지 갯수
	public int NboardPageCount(Map<String, Object> map) throws Exception {
		int pageCount = NboardAllNumber(map) / PAGESIZE;
		if (NboardAllNumber(map) % PAGESIZE != 0) {
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
	public int QboardEndPage(int pageNum, Map<String, Object> map) throws Exception {
		int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
		if (endPage > QboardPageCount(map)) {
			endPage = QboardPageCount(map);
		}
		return endPage;
	}
	
	
	//공지 endPage
		public int NboardEndPage(int pageNum, Map<String, Object> map) throws Exception {
			int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
			if (endPage > NboardPageCount(map)) {
				endPage = NboardPageCount(map);
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