package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import dao.NoticeDAO;
import dao.QuestionDAO;

//������ ����
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

	// ������ ������, ������ �׷�
	private final int PAGESIZE = 10;
	private final int PAGEGROUP = 5;

	// ���� ��ü �Խñ� ��
	public int QboardAllNumber(Map<String, Object> map) throws Exception {
		int count = questionDAO.allCnt(map);
		return count;
	}

	// �������� ��ü �Խñ� ��
	public int NboardAllNumber(Map<String, Object> map) throws Exception {
		int count = questionDAO.allCnt(map);
		return count;
	}

	// ���� ������ ����
	public int QboardPageCount(Map<String, Object> map) throws Exception {
		int pageCount = QboardAllNumber(map) / PAGESIZE;
		if (QboardAllNumber(map) % PAGESIZE != 0) {
			pageCount++;
		}
		return pageCount;
	}

	// �������� ������ ����
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

	//���� endPage
	public int QboardEndPage(int pageNum, Map<String, Object> map) throws Exception {
		int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
		if (endPage > QboardPageCount(map)) {
			endPage = QboardPageCount(map);
		}
		return endPage;
	}
	
	
	//���� endPage
		public int NboardEndPage(int pageNum, Map<String, Object> map) throws Exception {
			int endPage = boardStartPage(pageNum) + (PAGEGROUP - 1);
			if (endPage > NboardPageCount(map)) {
				endPage = NboardPageCount(map);
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