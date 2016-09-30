package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MemberCommand;
import dao.JoinDAO;
import validator.LoginCommandValidator;



@Controller
public class MemberController {
    @Autowired
    private JoinDAO joinDao;

	public JoinDAO getJoinDao() {
		return joinDao;
	}

	public void setJoinDao(JoinDAO joinDao) {
		this.joinDao = joinDao;
	}
	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}
	
	@RequestMapping(value="/bisup_login/agree.do" ,method = RequestMethod.GET)
	public String joinagree(){
		return "join/joinAgree";
		
	}
	@RequestMapping(value= "/join.do" ,method = RequestMethod.GET)
	public String joinform(){
		return "join/joinForm";
		
	}
	
	
	@RequestMapping(value= "/join.do" ,method = RequestMethod.POST)
	public String insertmem(@ModelAttribute("member") MemberCommand memberCommand,
			BindingResult result){
		new LoginCommandValidator().validate(memberCommand, result);
		if (result.hasErrors()) {
			return "bisup_login/loginfail";
		}
		try{
			int x=joinDao.insertMember(memberCommand);
			if(x==1){
				return "join/joinok";
			}else{
				return "bisup_login/loginmain";
			}
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "bisup_login/loginfail";
		}
		
	}
	
 
   
    
 
}
 