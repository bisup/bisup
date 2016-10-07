package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import dao.NoticeDAO;
import service.NoticeServiceImple;

@Controller
public class NoticeController {

	@Autowired
	private NoticeServiceImple boardService2;

	public NoticeServiceImple getboardService2() {
		return boardService2;
	}

	public void setboardService2(NoticeServiceImple boardService2) {
		this.boardService2 = boardService2;
	}

	@Autowired
	private NoticeDAO dao;

	public NoticeDAO getDao() {
		return dao;
	}

	public void setDao(NoticeDAO dao) {
		this.dao = dao;
	}

	ModelAndView mav = null;

	// �������� ��ü �� ���(��)
	@RequestMapping("/notice/nlist.do")
	public ModelAndView list() throws Exception {
		List<BoardCommand> list = null;

		mav = new ModelAndView("nlist");
		int pageNum = 1;
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow = (pageNum * 10) - 9;
		int endRow = (pageNum * pagesize);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		int cnt = boardService2.allCnt(); // ��ü �� ����
		// cnt(��ü �� ������)�� 0�̸� ����� �� ����
		if (cnt > 0) {
			list = boardService2.selectBoardList(map);
		}

		/**** ������ �� ���� ****/
		int pageCount = cnt / pagesize + (cnt % pagesize == 0 ? 0 : 1);
		int startPage = (int) (pageNum / 5) * 5 + 1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		mav.addObject("pageNumber", pageNum); // ������ ��ȣ
		mav.addObject("totalcnt", cnt); // ��ü �� ��
		mav.addObject("pageCount", pageCount); // ������ ��
		mav.addObject("startPage", startPage); // ���� ������
		mav.addObject("endPage", endPage); // �� ������
		mav.addObject("list", list);

		return mav;
	}
	
	// �� ���� ����
	@RequestMapping(value = "/notice/ncontents.do", method = RequestMethod.GET)
	public ModelAndView contents(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("ncontents");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService2.selectboardContents(num);
		mav.addObject("boardCommand", boardCommand);
		return mav;
	}
	
	// �� ��ȸ�� ī��Ʈ ����
		public void updateCnt(int num) {
			boardService2.updateCnt(num);
		}

}
