package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	

	@RequestMapping("/notice/nlist.do")
	public String nlist(){
		//System.out.println("�������� ����");
		return "nlist"; 
	}
	
	@RequestMapping("/notice/nlist_m.do")
	public String nlist_m(){
		//System.out.println("������ �������� ����");
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
