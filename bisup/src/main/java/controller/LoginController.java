package controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import command.MemberCommand;
import dao.LoginDAO;
import controller.AuthenticationException;
import validator.LoginCommandValidator;


@Controller
@RequestMapping("/main.do")
public class LoginController{
	@Autowired
	private LoginDAO loginDAO;
	
	public LoginDAO getLoginDAO() {
		return loginDAO;
	}

	public void setLoginDAO(LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	@ModelAttribute("login")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	public LoginController() {
	// TODO Auto-generated constructor stub
}
	  
	@RequestMapping(method = RequestMethod.GET)
	public String main(){
		System.out.println("main요청");
		return "bisup_login/loginmain";//
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("login") MemberCommand memberCommand,BindingResult result, HttpSession session
			) {
		new LoginCommandValidator().validate(memberCommand, result);
		System.out.println(memberCommand.getId() + memberCommand.getPw() );
		if (result.hasErrors()) {
			return "bisup_login/loginmain";
		}
		try{
			int sort = loginDAO.selLog(memberCommand.getId(), memberCommand.getPw());
			if(sort==0){
				System.out.println("관리자 로그인");
				session.setAttribute("id",memberCommand.getId());
				session.setAttribute("sort", sort);
				return "main";
			}else if(sort == 2){
				System.out.println("자영업자 로그인");
				session.setAttribute("id",memberCommand.getId());
				session.setAttribute("sort", sort);
				return "main";
			}else if(sort == 1){
				System.out.println("창업예정자 로그인");
				session.setAttribute("id",memberCommand.getId());
				session.setAttribute("sort", sort);
				return "main";
			}else{
				System.out.println("꺼져");
				return "bisup_login/loginfail";
			}
			
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "bisup_login/loginfail";
		}
		
	}

}
