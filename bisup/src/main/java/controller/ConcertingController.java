package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.consultingDAO;
  

@Controller
public class ConcertingController {
	
 

	public void setDao2(consultingDAO dao2) {
		this.dao2 = dao2;
	}
	
	public consultingDAO getDao2() {
		return dao2;
	}

	private consultingDAO dao2;
	
	//타일즈 적용
	@RequestMapping("/bisup_concerting/info_customer.do")
	public String info_customerView(@RequestParam(value="division", defaultValue="") String division, Model model){
		System.out.println(division);
		ArrayList concerting = (ArrayList) dao2.list1(division);
		model.addAttribute("concerting", concerting);
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
	}
	
	/*//개인 인덱스 적용
	@RequestMapping("info_customer.do")
	public String info_customerView(@RequestParam(value="division", defaultValue="") String division, Model model){
		ArrayList concerting = (ArrayList) dao2.list1(division);
		model.addAttribute("concerting", concerting);
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
	}*/
	
}     

