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
import dao.QuestionDAO;
import service.QuestionServiceImple;

@Controller
public class QuestionController {
	
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
	public ModelAndView list() throws Exception {
		List<BoardCommand> list = null;

		mav = new ModelAndView("qlist");
		int pageNum = 1;
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow=(pageNum * 10) - 9;
		int endRow =(pageNum * pagesize) ;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		int cnt = boardService.allCnt(); //전체 글 갯수
		//cnt(전체 글 갯수가)가  0이면 저장된 글 없음
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}
		int number = cnt - (pageNum -1) * pagesize; //수
		
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}
		//int number = cnt - (pageNum -1) * pagesize; 
		
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


	// 글쓰기 첫번째 폼
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	// 커맨드 객체 생성
	@ModelAttribute("board")
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// 글쓰기
	@RequestMapping(value = "/question/good.do", method = RequestMethod.POST)
	public ModelAndView write(
			@RequestParam(value="title") String title, 
			@RequestParam(value="contents") String contents,
			@RequestParam(value="pw") String pw,
			@RequestParam(value="writer") String writer) throws Exception {
		
		ModelAndView mav = new ModelAndView("good");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setCnt(0);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWriter(writer);
		boardService.insertBoard(boardCommand);
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
	public ModelAndView update(
			@RequestParam(value="num") int num,
			@RequestParam(value="title") String title, 
			@RequestParam(value="contents") String contents,
			@RequestParam(value="pw") String pw,
			@RequestParam(value="writer") String writer) throws Exception {
		ModelAndView mav = new ModelAndView("qupdate");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setNum(num);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWriter(writer);
		return mav;
	}

	// 글삭제
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("qdelete");
		boardService.deleteBoard(num);
		return mav;
	}

	// 글 내용 보기
		@RequestMapping("/question/qcontents.do")
		public ModelAndView contents(@RequestParam("num") int num) throws Exception {
			ModelAndView mav = new ModelAndView("qcontents");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand = boardService.selectboardContents(num);
			mav.addObject("boardCommand", boardCommand);
			return mav;
		}
	
	// 본인확인 GET
	@RequestMapping(value="/question/qpw.do", method=RequestMethod.GET)
	public ModelAndView pw() {
		ModelAndView mav = new ModelAndView("qpw");
		return mav;
	}
	
	// 본인확인 POST
		@RequestMapping(value="/question/qpw.do", method=RequestMethod.POST)
		public ModelAndView pw(@RequestParam("num") int num, @RequestParam("pw") String pw, @RequestParam("buttonValue") String state) {
			ModelAndView mav = new ModelAndView("qpw");
			System.out.println("Contnum::"+num);
			
			String dbpw = boardService.selectPW(num); //게시판 번호에 맞는 비밀번호
			System.out.println("dbpw ::" + dbpw);
			int x = -1;
			String bt="";
			
			if(dbpw.equals(pw)){
				System.out.println("비밀번호 같음");
				x = 1;
				if(state.equals("content")){
					bt="1";
				}
			} else{
				System.out.println("비밀번호 틀림");
			}
			
			mav.addObject("num", num);
			mav.addObject("pw", pw);
			mav.addObject("bt", bt);
			mav.addObject("x", new Integer(x));
			
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
