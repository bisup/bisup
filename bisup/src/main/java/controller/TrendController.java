package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.TrendDAO;

@Controller
public class TrendController {

	
	private TrendDAO dao;
	  
	
	/*//Ÿ���� ����
=======

>>>>>>> branch 'master' of https://github.com/bisup/bisup.git
	@RequestMapping("/bisup_trend/sales_trend.do")
	public String sales_trend(){
		System.out.println("trend��û");
		return "sales_trend";//
	}
	
	@RequestMapping("/bisup_trend/business_trend.do")
	public String business_trend(){
		System.out.println("trend��û");
		return "business_trend";//
<<<<<<< HEAD
	}*/
	
	

	public TrendDAO getDao() {
		return dao;
	}

	public void setDao(TrendDAO dao) {
		this.dao = dao;
	}

	//���� �ε��� ����
	@RequestMapping("sales_trend.do")
	public String sales_trend(@RequestParam("item")String item, Model model){
		int a = 0;
		a = dao.list(item);
		model.addAttribute("am", a);
		return "bisup_trend/sales_trend";//
	}
	
	@RequestMapping("business_trend.do")
	public String business_trend(){
		System.out.println("trend��û");
		return "bisup_trend/business_trend";//

	}
}
