package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/notice/nlist.do")
	public String nlist(){
		//System.out.println("공지사항 내용");
		return "nlist"; 
	}
	
	@RequestMapping("/notice/nlist_m.do")
	public String nlist_m(){
		//System.out.println("관리자 공지사항 내용");
		return "nlist_m"; 
	}
	
	@RequestMapping("/notice/nwrite.do")
	public String nwrite(){
		//System.out.println("공지사항 글쓰기(관리자만 가능)");
		return "nwrite";
	}
	
	@RequestMapping("/question/qlist.do")
	public String plist(){
		//System.out.println("문의사항 내용");
		return "qlist";
	}
	
	@RequestMapping("/question/qwrite.do")
	public String pwrite(){
		//System.out.println("문의사항 글쓰기");
		return "qwrite";
	}
	
	@RequestMapping("/question/qpw.do")
	public String ppw(){
		//System.out.println("문의사항 본인확인");
		return "qpw";
	}
}
