package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/notice/nlist.do")
	public String nlist(){
		System.out.println("공지사항 내용");
		return "nlist"; 
	}
	
	@RequestMapping("/notice/nlist.do")
	public String nlist_m(){
		System.out.println("관리자 공지사항 내용");
		return "nlist_m"; 
	}
	
	@RequestMapping("/notice/nlist.do")
	public String nwrite(){
		System.out.println("공지사항 글쓰기(관리자만 가능)");
		return "nwrite";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String plist(){
		System.out.println("문의사항 내용");
		return "plist";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String pwrite(){
		System.out.println("문의사항 글쓰기");
		return "pwrite";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String ppw(){
		System.out.println("문의사항 본인확인");
		return "ppw";
	}
}
