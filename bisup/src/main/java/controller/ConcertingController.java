package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 

@Controller
public class ConcertingController {
	
	/*//타일즈 적용
	@RequestMapping("/bisup_concerting/info_customer.do")
	public String info_customerView(){
		System.out.println("info_customer요청");
		return "info_customer";
	}
	
	@RequestMapping("/bisup_concerting/manual.do")
	public String manualView(){
		System.out.println("manual요청");
		return "manual";
	}
	
	@RequestMapping("/bisup_concerting/relation.do")
	public String relationView(){
		System.out.println("relation요청");
		return "relation";
	}*/
	
	//개인 인덱스 적용
	@RequestMapping("info_customer.do")
	public String info_customerView(){
		System.out.println("info_customer요청");
		return "bisup_concerting/info_customer";
	}
	
	@RequestMapping("manual.do")
	public String manualView(){
		System.out.println("manual요청");
		return "bisup_concerting/manual";
	}
	
	@RequestMapping("relation.do")
	public String relationView(){
		System.out.println("relation요청");
		return "bisup_concerting/relation";
	}
	
}
