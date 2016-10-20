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
	public ModelAndView list(@RequestParam(value="pageNum", defaultValue="1") String page) throws Exception {
		List<BoardCommand> list = null;

		mav = new ModelAndView("nlist");
		int pageNum = Integer.parseInt(page);
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow = (pageNum * 10) - 9;
		int endRow = (pageNum * pagesize);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		int cnt = boardService2.allCnt(); // ��ü �� ����
		
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
		mav.addObject("list", list);//��ü ȸ��

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
		
		
		
		/**********������ �κ�**********/
		/*����*/
		// �������� ��ü �� ���(������)
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

					int cnt = boardService2.allCnt(); // ��ü �� ����
					
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
			
			
			// �۾��� ù��° ��
			@RequestMapping(value = "/notice/nwrite.do", method = RequestMethod.GET)
			public String writeForm() {
				return "nwrite";
			}

			// Ŀ�ǵ� ��ü ����
			@ModelAttribute("board")
			public BoardCommand formBacking() {
				return new BoardCommand();
			}

			// �۾���(������)
			@RequestMapping(value = "/notice/success.do", method = RequestMethod.POST)
			public ModelAndView write(
					@RequestParam(value = "title") String title,
					@RequestParam(value = "contents") String contents, 
					@RequestParam(value = "writer") String writer)
					throws Exception {
				
				int a = 1;
				ModelAndView mav = new ModelAndView();
				BoardCommand boardCommand = new BoardCommand();
				boardCommand.setCnt(0);
				boardCommand.setContents(contents);
				boardCommand.setTitle(title);
				boardCommand.setWriter(writer);
				boardService2.insertBoard(boardCommand);
				mav.setViewName("success");
				mav.addObject("a", a);
				return mav;
			}

			// �ۼ���(update)
			// �� ���� ��
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
			
			
			
			// �� ���� ��(������)
			@RequestMapping(value = "/notice/nupdate_m.do", method = RequestMethod.POST)
			public ModelAndView updateForm_m(
					@RequestParam(value = "num") int num, 
					@RequestParam(value = "title") String title,
					@RequestParam(value = "contents") String contents, 
					@RequestParam(value = "writer") String writer,
					@RequestParam(value = "cnt") int cnt) throws Exception {
				ModelAndView mav = new ModelAndView("nupdate_m");
				BoardCommand boardCommand = new BoardCommand();
				boardCommand.setCnt(cnt);
				boardCommand.setNum(num);
				boardCommand.setContents(contents);
				boardCommand.setTitle(title);
				boardCommand.setWriter(writer);

				mav.addObject("boardCommand", boardCommand);

				return mav;
			}
			
			

			// �� ���� ���� ���� �� ����(�Ϲ�)
			@RequestMapping(value = "/notice/successUp.do", method = RequestMethod.POST)
			public ModelAndView update(
					@RequestParam(value = "num") int num, 
					@RequestParam(value = "title") String title,
					@RequestParam(value = "contents") String contents, 
					@RequestParam(value = "writer") String writer,
					@RequestParam(value = "cnt") int cnt) throws Exception {

				ModelAndView mav = new ModelAndView();
				BoardCommand boardCommand = new BoardCommand();
				boardCommand.setNum(num);
				boardCommand.setTitle(title);
				boardCommand.setContents(contents);
				boardCommand.setWriter(writer);
				boardCommand.setCnt(cnt);
				boardService2.updateBoard(boardCommand);
				mav.setViewName("successUp");
				return mav;
			}
			
			// �� ���� ����
			@RequestMapping(value = "/notice/ncontents_m.do", method = RequestMethod.GET)
			public ModelAndView contents_m(@RequestParam("num") int num) throws Exception {
				ModelAndView mav = new ModelAndView("ncontents_m");
				BoardCommand boardCommand = new BoardCommand();
				boardCommand = boardService2.selectboardContents(num);
				mav.addObject("boardCommand", boardCommand);
				return mav;
			}
			
			// �ۻ���
			@RequestMapping(value = "/notice/ndelete.do", method = RequestMethod.GET)
			public ModelAndView delete(@RequestParam("num") int num) throws Exception {
				ModelAndView mav = new ModelAndView("ndelete");
				boardService2.deleteBoard(num);
				return mav;
			}
			
}
