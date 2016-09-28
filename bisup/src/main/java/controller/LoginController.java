package controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MemberCommand;
import dao.LoginDAO;

@Controller
@RequestMapping("/main.do")
public class LoginController{

	public LoginController() {
	// TODO Auto-generated constructor stub
}
	
	@RequestMapping(method = RequestMethod.GET)
	public String main(){
		System.out.println("main요청");
		return "bisup_login/loginmain";//
	}
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@Valid MemberCommand memberCommand, BindingResult result){
		System.out.println("로그인");
		LoginDAO ld=new LoginDAO();
		//String pass=ld.selLog(id);
		//if(pass.equals(pw)){
			return "tiles/test/test";
		//}
		//return "bisup_login/loginmain";//
	}
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
