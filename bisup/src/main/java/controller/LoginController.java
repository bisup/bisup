package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/logincheck.do")
public class LoginController {

	@RequestMapping(method=RequestMethod.GET)
	public String loginCheckForm(){
		
		return "logincheck";
	}
}
