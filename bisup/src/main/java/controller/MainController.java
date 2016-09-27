package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	public MainController() {
	// TODO Auto-generated constructor stub
}
	@RequestMapping("/main.do")
	public String loginmain(){
		System.out.println("mainø‰√ª");
		return "loginmain";//
	}
	
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
