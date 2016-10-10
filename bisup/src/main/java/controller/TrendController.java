package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	 
	//타일즈 적용
	@RequestMapping(value="/bisup_trend/sales_trend.do", method=RequestMethod.POST)
	public void sales_trend(HttpServletResponse resp)throws Exception{
		List<GuCommand> gulist = trendService.listgu();
	
		for(GuCommand list: gulist){
			System.out.println(list.getGcode() + list.getGn());	
		}
		JSONObject jso = new JSONObject();	
		jso.put("sale", gulist); //jason은 map구조(키,값), data라는 key로 list데이터를 주입했다.
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString()); //out.print 내용을 ajax의 dataType이 jason에게 데이터 쏴줌
		
	}
	
	@RequestMapping("/bisup_trend/business_trend.do")
	public String business_trend(){
		System.out.println("trend요청");
		return "business_trend";
	}
	
	

	

	/*//개인 인데스 적용
	@RequestMapping("sales_trend.do")
	public String sales_trend(@RequestParam("item")String item, Model model){
		int a = 0;
		a = dao.list(item);
		model.addAttribute("am", a);
		return "bisup_trend/sales_trend";//
	}
	
	@RequestMapping("business_trend.do")
	public String business_trend(){
		System.out.println("trend요청");
		return "bisup_trend/business_trend";//

	}*/
}
