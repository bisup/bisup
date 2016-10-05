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
	
	// �Խ��Ǹ���Ʈ
	// ���ǻ��� ��ü �� ���
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
		
		int cnt = boardService.allCnt(); //��ü �� ����
		//cnt(��ü �� ������)��  0�̸� ����� �� ����
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}
		int number = cnt - (pageNum -1) * pagesize; //��
		
		if(cnt > 0) {
			list=boardService.selectBoardList(map);
		}
		//int number = cnt - (pageNum -1) * pagesize; 
		
		/****������ �� ����****/
		int pageCount = cnt/ pagesize + (cnt % pagesize == 0 ? 0 : 1);
		int startPage = (int)(pageNum/5)*5+1;
		int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
		
		mav.addObject("pageNumber", pageNum); //������ ��ȣ
		mav.addObject("totalcnt", cnt); //��ü �� ��
		mav.addObject("pageCount", pageCount); //������ ��
		mav.addObject("startPage", startPage); //���� ������
		mav.addObject("endPage", endPage); //�� ������
		mav.addObject("list", list);

		return mav;
	}


	// �۾��� ù��° ��
	@RequestMapping(value = "/question/qwrite.do", method = RequestMethod.GET)
	public String writeForm() {
		return "qwrite";
	}

	// Ŀ�ǵ� ��ü ����
	@ModelAttribute("board")
	public BoardCommand formBacking() {
		return new BoardCommand();
	}

	// �۾���
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

	// �ۻ���
	@RequestMapping("/question/qdelete.do")
	public ModelAndView delete(@RequestParam(value = "num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("qdelete");
		boardService.deleteBoard(num);
		return mav;
	}

	// �� ���� ����
		@RequestMapping("/question/qcontents.do")
		public ModelAndView contents(@RequestParam("num") int num) throws Exception {
			ModelAndView mav = new ModelAndView("qcontents");
			BoardCommand boardCommand = new BoardCommand();
			boardCommand = boardService.selectboardContents(num);
			mav.addObject("boardCommand", boardCommand);
			return mav;
		}
	
	// ����Ȯ�� GET
	@RequestMapping(value="/question/qpw.do", method=RequestMethod.GET)
	public ModelAndView pw() {
		ModelAndView mav = new ModelAndView("qpw");
		return mav;
	}
	
	// ����Ȯ�� POST
		@RequestMapping(value="/question/qpw.do", method=RequestMethod.POST)
		public ModelAndView pw(@RequestParam("num") int num, @RequestParam("pw") String pw, @RequestParam("buttonValue") String state) {
			ModelAndView mav = new ModelAndView("qpw");
			System.out.println("Contnum::"+num);
			
			String dbpw = boardService.selectPW(num); //�Խ��� ��ȣ�� �´� ��й�ȣ
			System.out.println("dbpw ::" + dbpw);
			int x = -1;
			String bt="";
			
			if(dbpw.equals(pw)){
				System.out.println("��й�ȣ ����");
				x = 1;
				if(state.equals("content")){
					bt="1";
				}
			} else{
				System.out.println("��й�ȣ Ʋ��");
			}
			
			mav.addObject("num", num);
			mav.addObject("pw", pw);
			mav.addObject("bt", bt);
			mav.addObject("x", new Integer(x));
			
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
