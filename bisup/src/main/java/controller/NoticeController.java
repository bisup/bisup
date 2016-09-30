package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	

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
		/*
		 * 
		 * 
		 * */
		return "nwrite";
	}
	
	
}
