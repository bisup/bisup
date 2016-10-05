package controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import dao.QuestionDAO;
import service.QuestionServiceImple;

@Controller
public class QuestionController {
	
	//@Resource(name = "boardService")
	@Autowired
	private QuestionServiceImple boardService;
	public void setBoardService(QuestionServiceImple boardService) {
		this.boardService = boardService;
	}
	public QuestionServiceImple getBoardService() {
		return boardService;
	}
	
	@Autowired
	private QuestionDAO dao;
	public QuestionDAO getDao() {
		return dao;
	}
	public void setDao(QuestionDAO dao) {
		this.dao = dao;
	}
	
	ModelAndView mav = null;

	// 게시판리스트
	// 문의사항 전체 글 목록
	@RequestMapping("/question/qlist.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardCommand> list = getList();
		
		mav = new ModelAndView("qlist");
		int pageNum = 1;
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow=(pageNum * 10) - 9;
		int endRow =(pageNum * pagesize) ;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println("map사이즈" + map.size());
		int cnt = boardService.allCnt(); //전체 글 갯수
		/*//cnt(전체 글 갯수가)가  0이면 저장된 글 없음
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}*/
		//int number = cnt - (pageNum -1) * pagesize; 
		
		System.out.println(list.toString());
		System.out.println(list.get(0));
		
		/****페이지 수 연산****/
		int pageCount = cnt/ pagesize + (cnt % pagesize == 0 ? 0 : 1);
		int startPage = (int)(pageNum/5)*5+1;
		int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
		
		mav.addObject("pageNumber", pageNum); //페이지 번호
		mav.addObject("totalcnt", cnt); //전체 글 수
		mav.addObject("pageCount", pageCount); //페이지 수
		mav.addObject("startPage", startPage); //시작 페이지
		mav.addObject("endPage", endPage); //끝 페이지
		mav.addObject("list", list);

		return mav;
	}
	
	
	private List<BoardCommand> getList() throws Exception{
		List<BoardCommand> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		int pageNum = 1;
		int pagesize = 10;
		int startRow=(pageNum * 10) - 9;
		int endRow =(pageNum * pagesize) ;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		int cnt = boardService.allCnt(); //전체 글 갯수
		//cnt(전체 글 갯수가)가  0이면 저장된 글 없음
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}
		
		return list;
	}
	
	

	// 글 내용 보기
	@RequestMapping(value = "/question/qcontents.do", method = RequestMethod.POST)
	public ModelAndView contents(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		//Map<String, Object> map = new HashMap<String, Object>();

		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService.selectboardContents(num);

		mav.addObject("boardCommand", boardCommand);

		mav.setViewName("qcontents");
		return mav;
	}

	// 글쓰기 첫번째 폼
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	// 커맨드 객체 생성
	@ModelAttribute
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// 글쓰기
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String pw = request.getParameter("pw");
		String writer = request.getParameter("writer");
		ModelAndView mav = new ModelAndView();
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWriter(writer);
		boardCommand.setReg(new Timestamp(System.currentTimeMillis()));
		boardService.insertBoard(boardCommand);

		mav.setViewName("qwrite");
		return mav;
	}

	// 글 수정 폼
	@RequestMapping(value = "/question/qupdate.do", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		//Map<String, Object> map = new HashMap<String, Object>();
		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService.selectboardContents(num);
		mav.addObject("boardCommand", boardCommand);
		mav.setViewName("qupdate");
		return mav;
	}

	// 글 수정 내용 변경 후 저장
	@RequestMapping(value = "/question/qupdate.do", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		BoardCommand boardCommand = new BoardCommand();
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String pw = request.getParameter("pw");
		String contents = request.getParameter("contents");
		boardCommand.setNum(num);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWriter(writer);
		boardCommand.setReg(new Timestamp(System.currentTimeMillis()));

		boardService.updateBoard(boardCommand);
		mav.setViewName("qupdate");
		return mav;
	}

	// 글삭제
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "num", required = true) int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.deleteBoard(num);
		mav.setViewName("qdelete");
		return mav;
	}

	// 본인확인
	@RequestMapping("/question/qpw.do")
	public ModelAndView pw(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView();
		boardService.selectPW(num);
		mav.setViewName("qpw");
		
		return mav;
	}

	// 글 조회시 카운트 증가
	public void updateCnt(int num) {
		boardService.updateCnt(num);
	}

	/*// 파일 업로드
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("nwrite") String studentNumber,
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
	}*/
}