package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/notice/nlist.do")
	public String nlist(){
		System.out.println("�������� ����");
		return "nlist"; 
	}
	
	@RequestMapping("/notice/nlist.do")
	public String nlist_m(){
		System.out.println("������ �������� ����");
		return "nlist_m"; 
	}
	
	@RequestMapping("/notice/nlist.do")
	public String nwrite(){
		System.out.println("�������� �۾���(�����ڸ� ����)");
		return "nwrite";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String plist(){
		System.out.println("���ǻ��� ����");
		return "plist";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String pwrite(){
		System.out.println("���ǻ��� �۾���");
		return "pwrite";
	}
	
	@RequestMapping("/notice/nlist.do")
	public String ppw(){
		System.out.println("���ǻ��� ����Ȯ��");
		return "ppw";
	}
}
