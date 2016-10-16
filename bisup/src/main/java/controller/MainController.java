package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/main/main.do")
	public String nlist(){
		System.out.println("메인 페이지");
		return "main"; 
	}
	
	@RequestMapping("/main/siteMap.do")
	public String siteMap(){
		System.out.println("사이트맵 페이지");
		return "siteMap"; 
	}
	
	
}
