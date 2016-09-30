package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MemberCommand;

	@Controller
	public class ModifyController {

	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	public ModifyController() {
	// TODO Auto-generated constructor stub
}
	
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.GET)
	public String check(){
		return "modifyCheck";//
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public String form(){
		return "modifyForm";//
	}
	
	
	
}
