package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main/main.do")
	public String nlist(){
		System.out.println("���� ������");
		return "main"; 
	}
	
	@RequestMapping("/main/siteMap.do")
	public String siteMap(){
		System.out.println("����Ʈ�� ������");
		return "siteMap"; 
	}
	
	
}
