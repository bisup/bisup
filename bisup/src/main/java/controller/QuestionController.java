package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import command.CommantCommand;

import dao.CommentDAO;
import dao.QuestionDAO;
import net.sf.json.JSONObject;
import service.QuestionServiceImple;

@Controller
public class QuestionController {

	
	@Autowired
	private CommentDAO commentDAO;
	
	public CommentDAO getCommentDAO() {
		return commentDAO;
	}

	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}

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
	public ModelAndView list(@RequestParam(value="pageNum", defaultValue="1") String page) throws Exception {
		List<BoardCommand> list = null;

		mav = new ModelAndView("qlist");
		int pageNum = Integer.parseInt(page);
		int pagesize = 10;
		Map<String, Object> map = new HashMap<String, Object>();

		int startRow = (pageNum * 10) - 9;
		int endRow = (pageNum * pagesize);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		int cnt = boardService.allCnt(); // ��ü �� ����
		// cnt(��ü �� ������)�� 0�̸� ����� �� ����
		if (cnt > 0) {
			list = boardService.selectBoardList(map);
		}
		// int number = cnt - (pageNum -1) * pagesize;

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
	
	
	
	// ���ǻ��� ��ü �� ���
		@RequestMapping("/question/qlist_m.do")
		public ModelAndView list_m() throws Exception {
			List<BoardCommand> list = null;

			mav = new ModelAndView("qlist_m");
			int pageNum = 1;
			int pagesize = 10;
			Map<String, Object> map = new HashMap<String, Object>();

			int startRow = (pageNum * 10) - 9;
			int endRow = (pageNum * pagesize);
			map.put("startRow", startRow);
			map.put("endRow", endRow);

			int cnt = boardService.allCnt(); // ��ü �� ����
			// cnt(��ü �� ������)�� 0�̸� ����� �� ����
			if (cnt > 0) {
				list = boardService.selectBoardList(map);
				System.out.println(list.toString());
			}
			// int number = cnt - (pageNum -1) * pagesize;

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
			@RequestParam(value = "title") String title,
			@RequestParam(value = "contents") String contents, 
			@RequestParam(value = "pw") String pw,
			@RequestParam(value = "writer") String writer) throws Exception {

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
	@RequestMapping(value = "/question/qupdate.do", method = RequestMethod.POST)
	public ModelAndView updateForm(@RequestParam(value = "num") int num, @RequestParam(value = "title") String title,
			@RequestParam(value = "contents") String contents, @RequestParam(value = "pw") String pw,
			@RequestParam(value = "writer") String writer, @RequestParam(value = "cnt") int cnt) throws Exception {
		ModelAndView mav = new ModelAndView("qupdate");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setCnt(cnt);
		boardCommand.setNum(num);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setTitle(title);
		boardCommand.setWriter(writer);

		mav.addObject("boardCommand", boardCommand);

		return mav;
	}

	// �� ���� ���� ���� �� ����
	@RequestMapping(value = "/question/good2.do", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam(value = "num") int num, @RequestParam(value = "title") String title,
			@RequestParam(value = "contents") String contents, @RequestParam(value = "pw") String pw,
			@RequestParam(value = "writer") String writer, @RequestParam(value = "cnt") int cnt) throws Exception {

		ModelAndView mav = new ModelAndView("good2");
		BoardCommand boardCommand = new BoardCommand();
		boardCommand.setNum(num);
		boardCommand.setTitle(title);
		boardCommand.setContents(contents);
		boardCommand.setPw(pw);
		boardCommand.setWriter(writer);
		boardCommand.setCnt(cnt);
		boardService.updateBoard(boardCommand);
		return mav;
	}

	// �ۻ���
	@RequestMapping(value = "/question/qdelete.do", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("qdelete");
		System.out.println("����:"+num);
		boardService.deleteBoard(num);
		return mav;
	}

	// �� ���� ����
	@RequestMapping(value = "/question/qcontents.do", method = RequestMethod.GET)
	public ModelAndView contents(@RequestParam("num") int num) throws Exception {
		ModelAndView mav = new ModelAndView("qcontents");
		List<CommantCommand> li= commentDAO.getList(num);
		BoardCommand boardCommand = new BoardCommand();
		boardCommand = boardService.selectboardContents(num);
		mav.addObject("boardCommand", boardCommand);
		mav.addObject("commantli", li);
		return mav;
	}

	// ����Ȯ�� GET
	@RequestMapping(value = "/question/qpw.do", method = RequestMethod.GET)
	public ModelAndView pw() {
		ModelAndView mav = new ModelAndView("qpw");
		return mav;
	}

	// ����Ȯ�� POST
	@RequestMapping(value = "/question/qpw.do", method = RequestMethod.POST)
	public ModelAndView pw(@RequestParam("num") int num, @RequestParam("pw") String pw) {
		ModelAndView mav = new ModelAndView("qpw");
		String dbpw = boardService.selectPW(num); // �Խ��� ��ȣ�� �´� ��й�ȣ
		int x = -1;

		if (dbpw.equals(pw)) {
			System.out.println("��й�ȣ ����");
			x = 1;
		} else {
			System.out.println("��й�ȣ Ʋ��");
		}

		mav.addObject("num", num);
		mav.addObject("pw", pw);
		mav.addObject("x", new Integer(x));

		return mav;
	}

	// �� ��ȸ�� ī��Ʈ ����
	public void updateCnt(int num) {
		boardService.updateCnt(num);
	}
	/*
	 * // ���� ���ε�
	 * 
	 * @RequestMapping(value = "/question/qwrite.do", method =
	 * RequestMethod.POST) public String submitReport1(@RequestParam("nwrite")
	 * String studentNumber,
	 * 
	 * @RequestParam("filename") MultipartFile filename) { upload(filename);
	 * return "qlist"; } // ���� ���ε� public void upload(MultipartFile report) {
	 * String name = report.getOriginalFilename(); long now =
	 * System.currentTimeMillis(); String o_name = now + name; File new_file =
	 * new File("e:\\upload\\" + o_name); try { report.transferTo(new_file);
	 * FileDB fileDB = new FileDB(name, new_file.getPath(), report.getSize());
	 * dao.insert(fileDB); // ���� �̸��� ������ �����ϸ� �����ѵ� ���� } catch (Exception e) {
	 * e.printStackTrace(); } }
	 */
	
	
	//���
	
	  @RequestMapping(value="/question/indel.do",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String reInsert(
			@RequestParam("num") int num,
			@RequestParam("rwriter") String rwriter, 
			@RequestParam("rcontents") String rcontents,HttpServletResponse resp){
		 System.out.println(num+rwriter+" "+rcontents);
		  resp.setContentType("text/html; charset=UTF-8");
		ModelAndView mav = new ModelAndView("good");
		CommantCommand reCommand = new CommantCommand();
		JSONObject jso = new JSONObject();
		reCommand.setQnum(num);
		reCommand.setRwriter(rwriter);
		reCommand.setRcontents(rcontents);
		int x=commentDAO.insertC(reCommand);
		jso.put("x", x);
		return jso.toString();
		
	}
	  @RequestMapping(value = "/question/rdelete.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
		public String rdelete(@RequestParam("num") int num,@RequestParam("rpw") int rpw) throws Exception {
			JSONObject jso = new JSONObject();
			 System.out.println(num+" "+rpw);
			CommantCommand rd = new CommantCommand();
			rd.setQnum(num);
			rd.setRpw(rpw);
			int x=commentDAO.deleteCmt(rd);
			
			System.out.println("����:"+x);
			jso.put("x", x);
			return jso.toString();
		}
	
}
