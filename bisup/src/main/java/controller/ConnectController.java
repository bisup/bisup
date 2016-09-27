package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test/test.do")
public class ConnectController {

	@RequestMapping(method=RequestMethod.GET)
	public String form(){
		//System.out.println("헤더 테스트");
		return "test";//
	}
}
