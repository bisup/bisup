package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;


@Controller
@RequestMapping("/main/mystore/menuinserting.do")
public class MyStoreController {


	@RequestMapping(method=RequestMethod.GET)
	public String form(HttpServletRequest request){
		String id = request.getParameter("id"); request.setAttribute("id", id);
		return "bisup_mystore/menuInserting";//
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView modelandviewCreateView(@ModelAttribute("insert") MenuCommand command){
		ModelAndView modelandview = new ModelAndView();
		modelandview.addObject(command);
		modelandview.setViewName("bisup_admin_store/menuInsertForm");
		return modelandview;
	}
	
	@ModelAttribute
	private void Authenticator(){
		
	}
}
