package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;
import command.OtherCommand;
import command.SaleCommand;
import dao.SaleChartAction;
import dao.SalesDAO;
import net.sf.json.JSONObject;
  
@Controller
public class SalesController {

	//dao파일
	private SalesDAO salesDao;
	
	public void setSalesDao(SalesDAO salesDao) {
		this.salesDao = salesDao;
	}
 
	private SaleChartAction saleChartAction;

	public void setSaleChartAction(SaleChartAction saleChartAction) {
		this.saleChartAction = saleChartAction;
	}
	//매출 등록 ,수정 부분
	@RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
	public String sales(@RequestParam("id") String id,HttpServletRequest request,Model model,HttpSession session){
		session.setAttribute("id",id);
		model.addAttribute("menu",salesDao.menuList(id));
		System.out.println("saleInserting get");
		return "salesInserting";
	}
	
	@RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
	public String insertSales(@ModelAttribute("saleCommand") SaleCommand saleCommand,String sdate,HttpServletRequest request,HttpSession session){
		saleCommand.setId((String)session.getAttribute("id"));
		saleCommand.setSdate(request.getParameter("sdate"));
		saleCommand.setItem(request.getParameter("item"));
		saleCommand.setEa(Integer.parseInt(request.getParameter("ea")));
		int x = salesDao.insertSales(saleCommand);
		int y = salesDao.insertTotal(saleCommand);
		session.setAttribute("sdate", sdate);
		System.out.println("saleInserting post");
		return "redirect:/sales/salesInsertingPro.do";

	}
	
	@RequestMapping(value="/salesInsertingPro.do", method=RequestMethod.GET)
	public String salesList(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		String sdate=(String)session.getAttribute("sdate");
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("sdate",sdate);		
		model.addAttribute("sale",salesDao.saleList(map));
		model.addAttribute("menu",salesDao.menuList2(map));
		System.out.println("saleInsertingPro get");
		return "salesInsertingPro";
	}
	
	
	@RequestMapping(value="/salesInsertingPro.do",method=RequestMethod.POST)
	public String updateSales(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,HttpSession session){
		saleCommand.setId((String)session.getAttribute("id"));
		saleCommand.setSdate((String)session.getAttribute("sdate"));
		saleCommand.setEa(Integer.parseInt(request.getParameter("ea")));
		saleCommand.setItem(request.getParameter("item"));
		int x = salesDao.updateSales(saleCommand);
		int y = salesDao.insertTotal(saleCommand);
		System.out.println("saleInsertingPro post");
		return "redirect:/sales/salesInsertingPro.do";
	}
	
	//부수비용 등록 수정 부분
	@RequestMapping(value="/salesOther.do",method=RequestMethod.GET)
	public String salesOther(@RequestParam("id") String id,HttpServletRequest request,Model model,HttpSession session){
		session.setAttribute("id",id);
		System.out.println("salesOther get");
		return "salesOther";
	}
	
	@RequestMapping(value="/salesOther.do",method=RequestMethod.POST)
	public String insertOther(@ModelAttribute("otherCommand") OtherCommand otherCommand,String year,String mon,HttpServletRequest request,HttpSession session){		
		otherCommand.setId((String)session.getAttribute("id"));
		otherCommand.setYear(request.getParameter("year"));
		otherCommand.setMon(request.getParameter("mon"));
		otherCommand.setRent(Integer.parseInt(request.getParameter("rent")));
		otherCommand.setSal(Integer.parseInt(request.getParameter("sal")));
		otherCommand.setMcost(Integer.parseInt(request.getParameter("mcost")));
		otherCommand.setDuty(Integer.parseInt(request.getParameter("duty")));
		otherCommand.setPrcost(Integer.parseInt(request.getParameter("prcost")));
		
		int x = salesDao.insertOther(otherCommand);
		int y = salesDao.otherTotal(otherCommand);
		session.setAttribute("year", year);
		session.setAttribute("mon", mon);
		System.out.println("salesOther post");
		return "redirect:/sales/salesOtherPro.do";
	}
	
	@RequestMapping(value="/salesOtherPro.do", method=RequestMethod.GET)
	public String otherList(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		model.addAttribute("other",salesDao.otherList(id));
		System.out.println("salesOtherPro get");
		return "salesOtherPro";
	}
	
	
	@RequestMapping(value="/salesOtherPro.do",method=RequestMethod.POST)
	public String updateOther(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,HttpSession session){
		otherCommand.setId((String)session.getAttribute("id"));
		otherCommand.setYear(request.getParameter("year"));
		otherCommand.setMon(request.getParameter("mon"));
		otherCommand.setRent(Integer.parseInt(request.getParameter("rent")));
		otherCommand.setSal(Integer.parseInt(request.getParameter("sal")));
		otherCommand.setMcost(Integer.parseInt(request.getParameter("mcost")));
		otherCommand.setDuty(Integer.parseInt(request.getParameter("duty")));
		otherCommand.setPrcost(Integer.parseInt(request.getParameter("prcost")));
		
		int i = salesDao.updateOther(otherCommand);
		int j = salesDao.otherTotal(otherCommand);
		System.out.println("salesOtherPro post");
		return "redirect:/sales/salesOtherPro.do";
	}
	
//	---------------------월별 매출 차트----------------------------------
	
	@RequestMapping(value="/drawChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id,Locale locale) throws Exception{
		System.out.println("drawChart POST id "+id);
		response.setCharacterEncoding("UTF-8");
		ArrayList fiveSales = saleChartAction.salePerMon(id);
		JSONObject jsonObject = new JSONObject();  
		jsonObject.put("data", fiveSales);
		SaleCommand command = (SaleCommand) fiveSales.get(0);
		System.out.println("데이터 수: "+fiveSales.size()+",데이터: "+jsonObject.toString());
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping("/drawMonChart.do")
	public String saleMain(@RequestParam("id") String id, Model model){
		model.addAttribute("id",id);
		System.out.println("drawChart GET id "+id);
		return "drawChart";
	}
}