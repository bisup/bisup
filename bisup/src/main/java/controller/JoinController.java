package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MemberCommand;
import dao.JoinDAO;
import dao.LoginDAO;

@Controller

public class JoinController {
	
	@Autowired
	private JoinDAO JoinDAO;
	
	public void setJoinDAO(JoinDAO joinDAO) {
		JoinDAO = joinDAO;
	}

	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	public JoinController() {
	// TODO Auto-generated constructor stub
}
	
	@RequestMapping(value="/join/joinAgree.do",method=RequestMethod.GET)
	public String joinAgree(){
		return "joinAgree";//
	}
	
	@RequestMapping(value="/join/form.do",method=RequestMethod.GET)
	public String joinForm(){
		
		return "joinForm";
	}
	
	@RequestMapping(value="/join/form.do",method=RequestMethod.POST)
	public String joinForm(@ModelAttribute("member") MemberCommand MemberCommand){
		JoinDAO.insertMem();
		
		return "joinForm";
	}
}
