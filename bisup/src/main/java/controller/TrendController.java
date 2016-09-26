package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/main.do")
public class TrendController {


	@RequestMapping(method=RequestMethod.GET)
	public String stringCreateView(){
		System.out.println("mainø‰√ª");
		return "main";//
	}
	
	/*public ModelAndView modelandviewCreateView(){
		ModelAndView modelandview = 
	}*/
}
