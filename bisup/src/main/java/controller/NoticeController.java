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

	// 공지사항 전체 글 목록(고객)
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

		int cnt = boardService2.allCnt(); // 전체 글 갯수
		// cnt(전체 글 갯수가)가 0이면 저장된 글 없음
		if (cnt > 0) {
			list = boardService2.selectBoardList(map);
		}

		/**** 페이지 수 연산 ****/
		int pageCount = cnt / pagesize + (cnt % pagesize == 0 ? 0 : 1);
		int startPage = (int) (pageNum / 5) * 5 + 1;
		int pageBlock = 5;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		mav.addObject("pageNumber", pageNum); // 페이지 번호
		mav.addObject("totalcnt", cnt); // 전체 글 수
		mav.addObject("pageCount", pageCount); // 페이지 수
		mav.addObject("startPage", startPage); // 시작 페이지
		mav.addObject("endPage", endPage); // 끝 페이지
		mav.addObject("list", list);

		return mav;
	}
	
	// 글 내용 보기
	@RequestMapping(value = "/notice/ncontents.do", method = RequestMethod.GET)
	public ModelAndView contents(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("ncontents");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService2.selectboardContents(num);
		mav.addObject("boardCommand", boardCommand);
		return mav;
	}
	
	// 글 조회시 카운트 증가
		public void updateCnt(int num) {
			boardService2.updateCnt(num);
		}

}
