package controller;

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
		System.out.println("main��û");
		return "bisup_login/loginmain";//
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submit(@ModelAttribute("login") MemberCommand memberCommand,
			BindingResult result) {
		new LoginCommandValidator().validate(memberCommand, result);
		System.out.println(memberCommand.getId() + memberCommand.getPw() );
		if (result.hasErrors()) {
			return "bisup_login/loginmain";
		}
		try{
			int selLog = loginDAO.selLog(memberCommand.getId(), memberCommand.getPw());
			if(selLog==0){
				System.out.println("������ �α���");
				return "bisup_login/main/main.do";
			}else if(selLog == 1){
				System.out.println("�ڿ����� �α���");
				return "bisup_login/main/main.do";
			}else if(selLog == 2){
				System.out.println("â�������� �α���");
				return "bisup_login/main/main.do";
			}else{
				System.out.println("����");
				return "bisup_login/loginfail";
			}
			
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "bisup_login/loginfail";
		}
		
	}

}
