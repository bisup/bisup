package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	public MainController() {
	// TODO Auto-generated constructor stub
}
	@RequestMapping("/main.do")
	public String main(){
		System.out.println("main��û");
		return "bisup_login/loginmain";//
	}
	
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
