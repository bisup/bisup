package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TrendController {

	@RequestMapping("/bisup_trend/sales_trend.do")
	public String sales_trend(){
		System.out.println("trend��û");
		return "sales_trend";//
	}
	
	@RequestMapping("/bisup_trend/business_trend.do")
	public String business_trend(){
		System.out.println("trend��û");
		return "business_trend";//
	}
}
