package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AreaInfoController {

	@RequestMapping("/areaInfo/testInfo.do")
	public String test(){
		System.out.println("testinfoø‰√ª");
		return "mpinfo"; 
	}
}
