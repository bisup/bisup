package controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.TrendDAO;
  
@Controller
public class TrendController {
	
	/*//타일즈 적용
	@RequestMapping("/bisup_trend/sales_trend.do")
	public String sales_trend(){
		System.out.println("trend요청");
		return "sales_trend";//
	}
	
	@RequestMapping("/bisup_trend/business_trend.do")
	public String business_trend(){
		System.out.println("trend요청");
		return "business_trend";//
	}*/
	
	//개인 인데스 적용
	@RequestMapping("sales_trend.do")
	public String sales_trend(@RequestParam("item")String item, Model model){
		TrendDAO td = new TrendDAO();
		int a = 0;
		a = td.list(item);
		/*ArrayList al = new ArrayList();
		td.list(item);
		al = (ArrayList) td.list(item);*/
		model.addAttribute("am", a);
		return "bisup_trend/sales_trend";//
	}
	
	@RequestMapping("business_trend.do")
	public String business_trend(){
		System.out.println("trend요청");
		return "bisup_trend/business_trend";//
	}
}
