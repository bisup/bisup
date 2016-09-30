package controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import mybatis.FileDB;
import mybatis.QuestionFileDAO;
import service.BoardService;
import service.PageHandler;

@Controller
public class QuestionController {
	
	@Autowired
	private QuestionFileDAO dao;

	public void setDao(QuestionFileDAO dao) {
		this.dao = dao;
	}

	@Resource(name = "boardService")
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private PageHandler pageHandler;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}

	public void setPageHandler(PageHandler pageHandler) {
		this.pageHandler = pageHandler;
	}

	ModelAndView mav = null;

	// 게시판리스트
	// 문의사항 전체 글 목록
	@RequestMapping("/question/qlist.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardCommand> list = null;
		mav = new ModelAndView();
		int pageNum = 1;
		Map<String, Object> map = new HashMap<String, Object>();

		// 전체 게시글수
		int totalCnt = pageHandler.QboardAllNumber(map);

		// 전체 페이지 갯수
		int totalPageCnt = pageHandler.QboardPageCount(map);

		// startPage, endPage
		int startPage = pageHandler.boardStartPage(pageNum);
		int endPage = pageHandler.NboardEndPage(pageNum, map);

		// 처음, 마지막 rowNumber
		List<Object> rowNumberList = new ArrayList<Object>();
		rowNumberList = pageHandler.boardSetPageNumber(pageNum);
		map.put("startRow", rowNumberList.get(0));
		map.put("endRow", rowNumberList.get(1));
		list = boardService.selectBoardList(map);

		mav.addObject("pageNumber", pageNum);
		mav.addObject("boardCount", totalCnt);
		mav.addObject("totalPageCnt", totalPageCnt);
		mav.addObject("startPage", startPage);
		mav.addObject("endPage", endPage);
		mav.addObject("list", list);

		mav.setViewName("qlist");
		return mav;
	}

	// 글 내용 보기
	@RequestMapping(value = "/question/qcontents.do", method = RequestMethod.POST)
	public ModelAndView contents(@RequestParam("qnum") int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		BoardCommand boardCommand = new BoardCommand(); 
		boardCommand = boardService.selectboardContents(map, num);
		mav.addObject("boardCommand", boardCommand);
		
		mav.setViewName("qcontents");
		return mav;
	}

	// 글쓰기 첫번째 폼
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	//커맨드 객체 생성
	@ModelAttribute
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// 글쓰기
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int num = Integer.parseInt(request.getParameter("qnum"));
		String title = request.getParameter("qtitle");
		String contents = request.getParameter("qcontents");
		String pw = request.getParameter("qpw");
		String write = request.getParameter("qwrite");
		ModelAndView mav = new ModelAndView();
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setNum(num);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWrite(write);
		boardCommand.setReg(new Timestamp(System.currentTimeMillis()));
		boardService.insertBoard(boardCommand);

		mav.setViewName("qwrite");
		return mav;
	}

	//글 수정 폼
	@RequestMapping(value = "/question/qupdate.do", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam("qnum") int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService.selectboardContents(map, num);
		mav.addObject("boardCommand", boardCommand);
		mav.setViewName("qupdate");
		return mav;
	}
	
	//글 수정 내용 변경 후 저장
	@RequestMapping(value = "/question/qupdate.do", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		BoardCommand boardCommand = new BoardCommand();
		int num = Integer.parseInt(request.getParameter("qnum"));
		String title = request.getParameter("qtitle");
		String write = request.getParameter("qwrite"); 
		String pw = request.getParameter("qpw");
		String contents = request.getParameter("qcontents");
		boardCommand.setNum(num);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWrite(write);
		boardCommand.setReg(new Timestamp(System.currentTimeMillis()));
		
		boardService.updateBoard(boardCommand);
		mav.setViewName("qupdate");
		return mav;
	}
	
	
	//글삭제
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "qnum", required = true) int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.deleteBoard(num);
		mav.setViewName("qdelete");
		return mav;
	}

	// 본인확인
		@RequestMapping("/question/qpw.do")
		public ModelAndView pw() {
			
			return mav;
		}
	
	
	
	// 파일 업로드
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("nnick") String studentNumber,
			@RequestParam("filename") MultipartFile filename) {
		upload(filename);
		return "qlist";
	}

	// 파일 업로드
	public void upload(MultipartFile report) {
		String name = report.getOriginalFilename();
		long now = System.currentTimeMillis();
		String o_name = now + name;
		File new_file = new File("e:\\upload\\" + o_name);
		try {
			report.transferTo(new_file);
			FileDB fileDB = new FileDB(name, new_file.getPath(), report.getSize());
			dao.insert(fileDB);
			// 같은 이름의 파일이 존재하면 삭제한뒤 저장
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
