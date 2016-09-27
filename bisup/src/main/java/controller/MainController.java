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
		System.out.println("main요청");
		return "bisup_login/loginmain";//
	}
	@RequestMapping("/bisup_login/login.do")
	public String login(){
		System.out.println("login요청");
		return "bisup_login/login";//
	}
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
