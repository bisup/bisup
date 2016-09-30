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

	// �Խ��Ǹ���Ʈ
	// ���ǻ��� ��ü �� ���
	@RequestMapping("/question/qlist.do")
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<BoardCommand> list = null;
		mav = new ModelAndView();
		int pageNum = 1;
		Map<String, Object> map = new HashMap<String, Object>();

		// ��ü �Խñۼ�
		int totalCnt = pageHandler.QboardAllNumber(map);

		// ��ü ������ ����
		int totalPageCnt = pageHandler.QboardPageCount(map);

		// startPage, endPage
		int startPage = pageHandler.boardStartPage(pageNum);
		int endPage = pageHandler.NboardEndPage(pageNum, map);

		// ó��, ������ rowNumber
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

	// �� ���� ����
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

	// �۾��� ù��° ��
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	//Ŀ�ǵ� ��ü ����
	@ModelAttribute
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// �۾���
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

	//�� ���� ��
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
	
	//�� ���� ���� ���� �� ����
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
	
	
	//�ۻ���
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "qnum", required = true) int num) throws Exception {
		ModelAndView mav = new ModelAndView();
		boardService.deleteBoard(num);
		mav.setViewName("qdelete");
		return mav;
	}

	// ����Ȯ��
		@RequestMapping("/question/qpw.do")
		public ModelAndView pw() {
			
			return mav;
		}
	
	
	
	// ���� ���ε�
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.POST)
	public String submitReport1(@RequestParam("nnick") String studentNumber,
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
	}
}
