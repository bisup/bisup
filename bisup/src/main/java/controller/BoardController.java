package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
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
		//System.out.println("�������� �۾���(�����ڸ� ����)");
		return "nwrite";
	}
	
	@RequestMapping("/question/qlist.do")
	public String plist(){
		//System.out.println("���ǻ��� ����");
		return "qlist";
	}
	
	@RequestMapping("/question/qwrite.do")
	public String pwrite(){
		//System.out.println("���ǻ��� �۾���");
		return "qwrite";
	}
	
	@RequestMapping("/question/qpw.do")
	public String ppw(){
		//System.out.println("���ǻ��� ����Ȯ��");
		return "qpw";
	}
}
