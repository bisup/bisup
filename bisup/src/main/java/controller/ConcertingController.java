package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 

@Controller
public class ConcertingController {
	
	/*//Ÿ���� ����
	@RequestMapping("/bisup_concerting/info_customer.do")
	public String info_customerView(){
		System.out.println("info_customer��û");
		return "info_customer";
	}
	
	@RequestMapping("/bisup_concerting/manual.do")
	public String manualView(){
		System.out.println("manual��û");
		return "manual";
	}
	
	@RequestMapping("/bisup_concerting/relation.do")
	public String relationView(){
		System.out.println("relation��û");
		return "relation";
	}*/
	
	//���� �ε��� ����
	@RequestMapping("info_customer.do")
	public String info_customerView(){
		System.out.println("info_customer��û");
		return "bisup_concerting/info_customer";
	}
	
	@RequestMapping("manual.do")
	public String manualView(){
		System.out.println("manual��û");
		return "bisup_concerting/manual";
	}
	
	@RequestMapping("relation.do")
	public String relationView(){
		System.out.println("relation��û");
		return "bisup_concerting/relation";
	}
	
}
