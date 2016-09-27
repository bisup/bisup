package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main.do")
public class MainController {

	public MainController() {
	// TODO Auto-generated constructor stub
}
	
	@RequestMapping(method = RequestMethod.GET)
	public String main(){
		System.out.println("main요청");
		return "bisup_login/loginmain";//
	}
	@RequestMapping(method = RequestMethod.POST)
	public String submit(){
		System.out.println("로그인");
		return "tiles/test/test";//
	}
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
