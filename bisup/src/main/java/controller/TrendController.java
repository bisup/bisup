package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import command.GuCommand;
import dao.TrendDAO;
import net.sf.json.JSONObject;
import service.TrendServiceImpl;

@Controller
public class TrendController {
	@Autowired
	private TrendServiceImpl trendService;
	public TrendServiceImpl getTrendService() {
		return trendService;
	}

	public void setTrendService(TrendServiceImpl trendService) {
		this.trendService = trendService;
	}

	@Autowired
	private TrendDAO trendDAO;
	

	
	public TrendDAO getTrendDAO() {
		return trendDAO;
	}

	public void setTrendDAO(TrendDAO trendDAO) {
		this.trendDAO = trendDAO;
	}

	@RequestMapping(value = "/bisup_trend/sales_trend.do", method = RequestMethod.GET)
	public String sale()throws Exception{
		return "sales_trend";
	}
	 
	//Ÿ���� ����
	@RequestMapping(value="/bisup_trend/sales_trend.do", method=RequestMethod.POST)
	public void sales_trend(HttpServletResponse resp)throws Exception{
		List<GuCommand> gulist = trendService.listgu();
		JSONObject jso = new JSONObject();	
		jso.put("sale", gulist); //jason�� map����(Ű,��), data��� key�� list�����͸� �����ߴ�.
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString()); //out.print ������ ajax�� dataType�� jason���� ������ ����
	}
	
	@RequestMapping(value="/bisup_trend/sales_trend1.do", method=RequestMethod.POST)
	public String sales_trend1(@RequestParam("gn") String gucode, Model model)throws Exception{
		ArrayList gn = (ArrayList) trendService.listtotal(gucode);
		model.addAttribute("sale1", gn);
		return "sales_trend";
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
