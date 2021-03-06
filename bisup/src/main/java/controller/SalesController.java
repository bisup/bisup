package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
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
//	매출 등록 ,수정 부분	
	@RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
	public String sales(HttpServletRequest request,Model model,HttpSession session){

		String id=(String)session.getAttribute("id");
		model.addAttribute("menu",salesDao.menuList(id));
		session.setAttribute("sdate", "");
		System.out.println("saleInserting get");
		return "salesInserting";
	}

	@RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
	public String insertSales(@ModelAttribute("saleCommand") SaleCommand saleCommand,String sdate,HttpServletRequest request,HttpSession session, ServletResponse response,Model model) throws Exception{
		String id=(String)session.getAttribute("id");
		saleCommand.setId(id);
		System.out.println("post"+id);
		saleCommand.setSdate(request.getParameter("sdate"));
		saleCommand.setItem(request.getParameter("item"));
		saleCommand.setEa(Integer.parseInt(request.getParameter("ea")));
		Map<String, String> map=new HashMap<String, String>();
		map.put("id",(String)session.getAttribute("id"));
		map.put("sdate",sdate);
		map.put("item", request.getParameter("item"));
		int a = salesDao.checkSales(map);
		System.out.println("A"+a);
		if(a==0)
		{
			int x = salesDao.insertSales(saleCommand);
			session.setAttribute("sdate",sdate);
			System.out.println("saleInserting post");
			return "redirect:/sales/salesInsertingPro.do";}
		else{
			session.setAttribute("sdate",sdate);
			session.setAttribute("item",request.getParameter("item"));
			return "redirect:/sales/salesInsertingCopy.do";}
		}
	
	@RequestMapping(value="/salesInsertingPro.do", method=RequestMethod.GET)
	public String salesList(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		String sdate=(String)session.getAttribute("sdate");

		Map<String, String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("sdate",sdate);		
		model.addAttribute("sale",salesDao.saleList(map));
		model.addAttribute("menu",salesDao.menuList(id));
		model.addAttribute("menu2",salesDao.menuList2(map));

		System.out.println("saleInsertingPro get");
		return "salesInserting";
	}
	
	@RequestMapping(value="/salesInsertingCopy.do", method=RequestMethod.GET)
	public String salesListCopy(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		String sdate=(String)session.getAttribute("sdate");
		String item=(String)session.getAttribute("item");

		Map<String, String> map=new HashMap<String, String>();
		map.put("id",id);
		map.put("sdate",sdate);		
		model.addAttribute(item);
		model.addAttribute("sale",salesDao.saleList(map));
		model.addAttribute("menu",salesDao.menuList(id));
		model.addAttribute("menu2",salesDao.menuList2(map));

		System.out.println("saleInsertingCopy get");
		return "salesInsertingPro";
	}
	
	
	@RequestMapping(value="/salesInsertingPro.do",method=RequestMethod.POST)
	public String updateSales(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,HttpSession session){
		String id=(String)session.getAttribute("id");
		String sdate=(String)session.getAttribute("sdate");
		saleCommand.setId(id);
		saleCommand.setSdate(sdate);
		saleCommand.setEa(Integer.parseInt(request.getParameter("ea")));
		saleCommand.setItem(request.getParameter("item"));
		System.out.println("에러");
		System.out.println(request.getParameter("item"));
		System.out.println(saleCommand.getItem());
		int x = salesDao.updateSales(saleCommand);
		System.out.println("saleInsertingPro post");
		return "redirect:/sales/salesInsertingPro.do";
	}
	
	
	//매출 등록 수정(다른 날짜 수정)
	@RequestMapping(value="/salesTablePage.do",method=RequestMethod.POST)
public String salesTablePage(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,HttpSession session){

		String id=(String)session.getAttribute("id");
		saleCommand.setId(id);
	System.out.println("post"+id);
	return "redirect:/sales/salesTable.do";

}		
	
	@RequestMapping(value="/salesTable.do",method=RequestMethod.GET)
	public String salesTable(HttpServletRequest request,Model model,HttpSession session){
		String id=(String)session.getAttribute("id");
		model.addAttribute("sale",salesDao.sdateList(id));
		session.setAttribute("sdate", "");
		System.out.println("salesTable get");
		return "salesTable";
	}

@RequestMapping(value="/salesTable.do",method=RequestMethod.POST)
public String insertDate(@ModelAttribute("saleCommand") SaleCommand saleCommand,String sdate,HttpServletRequest request,HttpSession session){
	String id=(String)session.getAttribute("id");
	saleCommand.setSdate(request.getParameter(sdate));
	System.out.println("request"+request.getParameter(sdate));
	session.setAttribute("sdate", sdate);
	System.out.println("post"+saleCommand.getSdate());
	return "redirect:/sales/salesTablePro.do";

}

@RequestMapping(value="salesTablePro.do", method=RequestMethod.GET)
public String salesList2(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,Model model,HttpSession session){
	String id=(String)session.getAttribute("id");
	String sdate=(String)session.getAttribute("sdate");
	
	Map<String, String> map=new HashMap<String, String>();
	map.put("id",id);
	map.put("sdate",sdate);	
	
	model.addAttribute("sales",salesDao.saleList(map));
	model.addAttribute("sale",salesDao.sdateList(id));
	System.out.println(sdate);
	model.addAttribute("menu2",salesDao.menuList2(map));
	System.out.println("salesTable2 get");
	return "salesTable";
}


@RequestMapping(value="/salesTablePro.do",method=RequestMethod.POST)
public String updateSales2(@ModelAttribute("saleCommand") SaleCommand saleCommand,HttpServletRequest request,HttpSession session){
	String id=(String)session.getAttribute("id");
	String sdate=(String)session.getAttribute("sdate");
	saleCommand.setId(id);
	saleCommand.setSdate(sdate);
	saleCommand.setEa(Integer.parseInt(request.getParameter("ea")));
	saleCommand.setItem(request.getParameter("item"));
	int x = salesDao.updateSales(saleCommand);
	System.out.println("salesTable2 post");
	return "redirect:/sales/salesTablePro.do";
}
	
//부수비용 등록 수정 부분
@RequestMapping(value="/salesOtherPage.do",method=RequestMethod.POST)
public String salesOtherPage(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,HttpSession session){
	String id=(String)session.getAttribute("id");
	otherCommand.setId(id);
System.out.println("post"+id);
return "redirect:/sales/salesOtherPro.do";
}	

@RequestMapping(value="/salesOther.do",method=RequestMethod.GET)
public String salesOther(HttpServletRequest request,Model model,HttpSession session){

	String id=(String)session.getAttribute("id");
	System.out.println("salesOther get");
	return "salesOther";
}

@RequestMapping(value="/salesOther.do",method=RequestMethod.POST)
public String insertOther(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,HttpSession session){		
	String id=(String)session.getAttribute("id");
	otherCommand.setId(id);
	otherCommand.setYear(request.getParameter("year"));
	otherCommand.setMon(request.getParameter("mon"));
	otherCommand.setRent(Integer.parseInt(request.getParameter("rent")));
	otherCommand.setSal(Integer.parseInt(request.getParameter("sal")));
	otherCommand.setMcost(Integer.parseInt(request.getParameter("mcost")));
	otherCommand.setDuty(Integer.parseInt(request.getParameter("duty")));
	otherCommand.setPrcost(Integer.parseInt(request.getParameter("prcost")));
	
	Map<String, String> map=new HashMap<String, String>();
	map.put("id",(String)session.getAttribute("id"));
	map.put("year",request.getParameter("year"));
	map.put("mon", request.getParameter("mon"));
	
	int a = salesDao.checkOther(map);
	
	if(a==0)
	{
		int x = salesDao.insertOther(otherCommand);
		System.out.println("salesOther post");
		return "redirect:/sales/salesOtherPro.do";}
	else{
		session.setAttribute("year",request.getParameter("year"));
		session.setAttribute("mon",request.getParameter("mon"));
		return "redirect:/sales/salesOtherPage.do";}
	}


@RequestMapping(value="/salesOtherPage.do", method=RequestMethod.GET)
public String salesOtherPage(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,Model model,HttpSession session){
	String id=(String)session.getAttribute("id");
	String year=(String)session.getAttribute("year");
	String mon=(String)session.getAttribute("mon");
	model.addAttribute("other",salesDao.otherList(id));
	model.addAttribute("yearmon",salesDao.yearmon(id));
	model.addAttribute(year);
	model.addAttribute(mon);  
 
	System.out.println("saleInsertingCopy get");
	return "salesOtherPage";
}

@RequestMapping(value="/salesOtherPro.do", method=RequestMethod.GET)
public String otherList(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,Model model,HttpSession session){
	String id=(String)session.getAttribute("id");
	model.addAttribute("other",salesDao.otherList(id));
	model.addAttribute("yearmon",salesDao.yearmon(id));
	System.out.println(id);
	return "salesOtherPro";
}

@RequestMapping(value="/salesOtherPro.do",method=RequestMethod.POST)
public String updateOther(@ModelAttribute("otherCommand") OtherCommand otherCommand,HttpServletRequest request,HttpSession session){
	String id=(String)session.getAttribute("id");
	otherCommand.setId(id);
	otherCommand.setYear(request.getParameter("sdate"));
	otherCommand.setRent(Integer.parseInt(request.getParameter("rent")));
	otherCommand.setSal(Integer.parseInt(request.getParameter("sal")));
	otherCommand.setMcost(Integer.parseInt(request.getParameter("mcost")));
	otherCommand.setDuty(Integer.parseInt(request.getParameter("duty")));
	otherCommand.setPrcost(Integer.parseInt(request.getParameter("prcost")));
	
	int i = salesDao.updateOther(otherCommand);
	System.out.println("salesOtherPro post");
	return "redirect:/sales/salesOtherPro.do";
}
//	---------------------월별 매출 차트----------------------------------
	
	@RequestMapping(value="/drawChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void drawDayChart(@ModelAttribute("salesCommand")SaleCommand saleCommand,HttpServletResponse response,Locale locale, HttpSession session) throws Exception{	
		String id = (String)session.getAttribute("id");
		System.out.println(saleCommand.getId()+"id");
		response.setCharacterEncoding("UTF-8");
		System.out.println("인코딩");
		ArrayList fiveSales = salesDao.salePerMon(id);
		ArrayList fiveSales2 = salesDao.otherMon(id);
		JSONObject jsonObject = new JSONObject();  
		jsonObject.put("data", fiveSales);
		jsonObject.put("data2", fiveSales2);
		SaleCommand command = (SaleCommand) fiveSales.get(0);
		OtherCommand command2 = (OtherCommand) fiveSales2.get(0);
		System.out.println("데이터 수: "+fiveSales.size()+",데이터: "+jsonObject.toString());
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping("/drawMonChart.do")
	public String saleMain(Model model, HttpSession session){
		String id=(String)session.getAttribute("id");
		model.addAttribute("sale",salesDao.salePerMon(id));
		model.addAttribute("other",salesDao.otherMon(id));
		return "drawChart";
	}
}