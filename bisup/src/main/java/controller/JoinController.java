package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MemberCommand;
import dao.JoinDAO;
import service.MemberService;

@Controller

public class JoinController {
	private MemberService service;
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
	
	@RequestMapping("memberList.do")
    public ModelAndView dummy2(){
        ModelAndView mav = new ModelAndView();
        mav.addObject("memberList",service.selectAll());
        mav.setViewName("selectAll");
        return mav;
    }
	
	@RequestMapping("logout.do")
    public String logout(HttpSession session){
//        session.invalidate();
        session.removeAttribute("id");
        return "redirect:loginForm.do";
    }
	
	 @RequestMapping("memberUpdateForm.do")
	    public String memberUpdateForm(Model model,HttpSession session){
	        String id = (String) session.getAttribute("id");
	        if(id == null)
	            return "redirect:loginForm.do";
	        model.addAllAttributes(service.getMemberInfo(id));
	        return "memberUpdateForm"; //������Ʈ ��
	    }
	 
	 @RequestMapping("memberUpdate.do")
	    public String memberUpdate(@RequestParam HashMap<String, Object> params){
	        service.memberUpdate(params);
	        return "redirect:main.do";
	    }	
}
