package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import net.sf.json.JSONObject;
import service.TrendService;

@Controller
public class TrendController {

	@Autowired
	private TrendService service;
	
	public void setService(TrendService service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/bisup_trend/sales_trend.do", method = RequestMethod.GET)
	public String sale()throws Exception{
		return "sales_trend";
	}
	 
	//Ÿ���� ����
	@RequestMapping(value="/bisup_trend/sales_trend.do", method=RequestMethod.POST)
	public void sales_trend(HttpServletResponse resp)throws Exception{
		List<String> gulist = service.listgu();
		System.out.println(gulist);
		JSONObject jso = new JSONObject();	
		jso.put("sale", gulist); //jason�� map����(Ű,��), data��� key�� list�����͸� �����ߴ�.
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString()); //out.print ������ ajax�� dataType�� jason���� ������ ����
		
	}
	
	@RequestMapping("/bisup_trend/business_trend.do")
	public String business_trend(){
		System.out.println("trend��û");
		return "business_trend";
	}
	
	

	

	/*//���� �ε��� ����
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

	}*/
}
