package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import dao.NoticeDAO;
import dao.QuestionDAO;
import service.NoticeServiceImple;
import service.QuestionServiceImple;

public class board_mController {

	@Autowired
	private QuestionServiceImple boardService;

	public void setBoardService(QuestionServiceImple boardService) {
		this.boardService = boardService;
	}

	public QuestionServiceImple getBoardService() {
		return boardService;
	}

	@Autowired
	private QuestionDAO qdao;

	public QuestionDAO getQdao() {
		return qdao;
	}

	public void setQdao(QuestionDAO qdao) {
		this.qdao = qdao;
	}
	
	@Autowired
	private NoticeServiceImple boardService2;

	public NoticeServiceImple getboardService2() {
		return boardService2;
	}

	public void setboardService2(NoticeServiceImple boardService2) {
		this.boardService2 = boardService2;
	}

	@Autowired
	private NoticeDAO ndao;
	public NoticeDAO getNdao() {
		return ndao;
	}

	public void setNdao(NoticeDAO ndao) {
		this.ndao = ndao;
	}

	ModelAndView mav = null;
	
	
	
	
	/*본문*/
	// 공지사항 전체 글 목록(관리자)
			@RequestMapping("/notice/nlist_m.do")
			public ModelAndView list_m() throws Exception {
				List<BoardCommand> list = null;

				mav = new ModelAndView("nlist_m");
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
		
		
		// 글쓰기 첫번째 폼
		@RequestMapping(value = "/notice/nwrite.do", method = RequestMethod.GET)
		public String writeForm() {
			return "nwrite";
		}

		// 커맨드 객체 생성
		@ModelAttribute("board")
		public BoardCommand formBacking() {
			return new BoardCommand();
		}

		// 글쓰기
		@RequestMapping(value = "/notice/good.do", method = RequestMethod.POST)
		public ModelAndView write(
				@RequestParam(value = "title") String title,
				@RequestParam(value = "contents") String contents, 
				@RequestParam(value = "writer") String writer)
				throws Exception {

			ModelAndView mav = new ModelAndView("good");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand.setCnt(0);
			boardCommand.setContents(contents);
			boardCommand.setTitle(title);
			boardCommand.setWriter(writer);
			boardService2.insertBoard(boardCommand);
			return mav;
		}

		// 글수정(update)
		// 글 수정 폼
		@RequestMapping(value = "/notice/nupdate.do", method = RequestMethod.POST)
		public ModelAndView updateForm(
				@RequestParam(value = "num") int num, 
				@RequestParam(value = "title") String title,
				@RequestParam(value = "contents") String contents, 
				@RequestParam(value = "writer") String writer,
				@RequestParam(value = "cnt") int cnt) throws Exception {
			ModelAndView mav = new ModelAndView("nupdate");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand.setCnt(cnt);
			boardCommand.setNum(num);
			boardCommand.setContents(contents);
			boardCommand.setTitle(title);
			boardCommand.setWriter(writer);

			mav.addObject("boardCommand", boardCommand);

			return mav;
		}

		// 글 수정 내용 변경 후 저장
		@RequestMapping(value = "/notice/good2.do", method = RequestMethod.POST)
		public ModelAndView update(
				@RequestParam(value = "num") int num, 
				@RequestParam(value = "title") String title,
				@RequestParam(value = "contents") String contents, 
				@RequestParam(value = "writer") String writer,
				@RequestParam(value = "cnt") int cnt) throws Exception {

			ModelAndView mav = new ModelAndView("good2");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand.setNum(num);
			boardCommand.setTitle(title);
			boardCommand.setContents(contents);
			boardCommand.setWriter(writer);
			boardCommand.setCnt(cnt);
			boardService2.updateBoard(boardCommand);
			return mav;
		}
		
		// 글 내용 보기
		@RequestMapping(value = "/notice/ncontents_m.do", method = RequestMethod.GET)
		public ModelAndView contents_m(@RequestParam("num") int num) throws Exception {
			ModelAndView mav = new ModelAndView("ncontents_m");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand = boardService2.selectboardContents(num);
			mav.addObject("boardCommand", boardCommand);
			return mav;
		}
		
		// 글삭제
		@RequestMapping(value = "/notice/ndelete.do", method = RequestMethod.GET)
		public ModelAndView delete(@RequestParam("num") int num) throws Exception {
			ModelAndView mav = new ModelAndView("qdelete");
			boardService.deleteBoard(num);
			return mav;
		}
		
		

}
