package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Sgiscontroller {
	@RequestMapping("/areaInfo/salesarea.do")
	public String test(){
		System.out.println("salesareaø‰√ª");
		return "salesarea"; 
	}
}
