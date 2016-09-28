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
		System.out.println("main요청");
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
			if(selLog==1){
				System.out.println("로그인");
				return "bisup_login/loginSuccess";
			}else
			{
				System.out.println("꺼져");
				return "bisup_login/loginmain";
			}
			
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "bisup_login/loginmain";
		}
		/*new LoginCommandValidator().validate(memberCommand, result);
		if (result.hasErrors()) {
			return "loginmain";
		}
		try{
			authenticator.authenticate(memberCommand.getId(), memberCommand.getPw());
			System.out.println("로그인");
			LoginDAO ld=new LoginDAO();
			String pass=ld.selLog(memberCommand);
			if(pass.equals(memberCommand.getPw())){
				return "loginSuccess";
			}else
			return "loginmain";
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "loginmain";
		}*/
	}

}
