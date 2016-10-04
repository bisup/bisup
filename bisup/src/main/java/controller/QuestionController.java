package controller;

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
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import dao.QuestionDAO;
import service.PageHandler;
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
//��?
	// �Խ��Ǹ���Ʈ
	// ���ǻ��� ��ü �� ���
	@RequestMapping("/question/qlist.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardCommand> list = null;
		mav = new ModelAndView();
		int pageNum = 1;
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow=(pageNum * 10) - 9;
		int endRow =(pageNum * pagesize) ;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		int cnt = boardService.allCnt(); //��ü �� ����
		//cnt��  0�̸� ����� �� ����
		System.out.println(cnt);
		
		
		if(cnt > 0) {
			list = boardService.selectBoardList(map);
		}
		int number = cnt - (pageNum -1) * pagesize; //��
		
		/****������ �� ����****/
		int pageCount = cnt/ pagesize + (cnt % pagesize == 0 ? 0 : 1);
		int startPage = (int)(pageNum/5)*5+1;
		int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
		
		/*
		// ��ü ������ ����
		int totalPageCnt = pageHandler.QboardPageCount();  //0

		// ��ü �Խñۼ�
		int totalCnt = pageHandler.QboardAllNumber();
		
		// startPage, endPage
		int startPage = pageHandler.boardStartPage(pageNum);
		int endPage = pageHandler.QboardEndPage(pageNum);
	
		// ó��, ������ rowNumber
		List<Object> rowNumberList = new ArrayList<Object>();
		rowNumberList = pageHandler.boardSetPageNumber(pageNum);
		list = boardService.selectBoardList(map); //������ ������ŭ ������ ���� list�� ����
*/
		mav.addObject("pageNumber", pageNum); //������ ��ȣ
		mav.addObject("totalcnt", cnt); //��ü �� ��
		mav.addObject("pageCount", pageCount); //������ ��
		mav.addObject("startPage", startPage); //���� ������
		mav.addObject("endPage", endPage); //�� ������
		mav.addObject("list", list);

		mav.setViewName("qlist");
		return mav;
	}

	// �� ���� ����
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

	// �۾��� ù��° ��
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	// Ŀ�ǵ� ��ü ����
	@ModelAttribute
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// �۾���
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

	// �� ���� ��
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

	// �� ���� ���� ���� �� ����
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

	// �ۻ���
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "num", required = true) int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.deleteBoard(num);
		mav.setViewName("qdelete");
		return mav;
	}

	// ����Ȯ��
	@RequestMapping("/question/qpw.do")
	public ModelAndView pw(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView();
		boardService.selectPW(num);
		mav.setViewName("qpw");
		
		return mav;
	}

	// �� ��ȸ�� ī��Ʈ ����
	public void updateCnt(int num) {
		boardService.updateCnt(num);
	}

	/*// ���� ���ε�
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("nwrite") String studentNumber,
			@RequestParam("filename") MultipartFile filename) {
		upload(filename);
		return "qlist";
	}

	// ���� ���ε�
	public void upload(MultipartFile report) {
		String name = report.getOriginalFilename();
		long now = System.currentTimeMillis();
		String o_name = now + name;
		File new_file = new File("e:\\upload\\" + o_name);
		try {
			report.transferTo(new_file);
			FileDB fileDB = new FileDB(name, new_file.getPath(), report.getSize());
			dao.insert(fileDB);
			// ���� �̸��� ������ �����ϸ� �����ѵ� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
