package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MemberCommand;

@Controller

public class JoinController {
	
	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	public JoinController() {
	// TODO Auto-generated constructor stub
}
	
	@RequestMapping(value="/join/joinAgree.do",method=RequestMethod.GET)
	public String form(){
		return "joinAgree";//
	}
	
	@RequestMapping(value="/join/form.do",method=RequestMethod.GET)
	public String test(){
		System.out.println("form");
		return "joinForm";
	}
}
