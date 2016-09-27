package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/join/joinAgree.do")
public class JoinController {

	@RequestMapping(method=RequestMethod.GET)
	public String form(){
		return "joinAgree";//
	}
}
