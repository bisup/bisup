package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;
import command.SaleCommand;
import command.SaleList;
import dao.SaleChartAction;
import dao.SalesDAO;
import net.sf.json.JSONObject;
  
@Controller
public class SalesController {

	//dao����
	private SalesDAO salesDao;
	
	public void setSalesDao(SalesDAO salesDao) {
		this.salesDao = salesDao;
	}
 
	private SaleChartAction saleChartAction;

	public void setSaleChartAction(SaleChartAction saleChartAction) {
		this.saleChartAction = saleChartAction;
	}
	
	
	@RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
	public String sales(MenuCommand menuCommand,HttpServletRequest request,Model model){
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		System.out.println("insertGet id"+id);
		model.addAttribute("menu",salesDao.menuList(id));
		System.out.println("insertGet id2"+id);
		return "salesInserting";
	}
	
	
//	@RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
//	public String insertSales(@ModelAttribute SaleCommand saleCommand){
////		System.out.println("insertPost"+id);
//		
////	System.out.println("insertPost"+sale);
////	map.addAttribute(salesDao.insertSales(id, saleList));
//		
//		
//	int sales= salesDao.insertSales();
//	return "salesInsertingPro";
	
	@RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
	public ModelAndView setMember(List<SaleList> saleList){ 

		   // model�� view�� ���ÿ� ���� ������ ��ü ����
		  ModelAndView mav = new ModelAndView();

		   SalesDAO sdao = new SalesDAO();
		  // �����͸� �߰��ϴ� �޼ҵ� ȣ��
		  sdao.insertSales(saleList);

		   // ����� ������ jsp ���ϸ��� ���� (helloworld.xml�� suffix�� .jsp�� �����س����Ƿ� �ٿ����� �ʾƵ� ��)
		  mav.setViewName("salesInsertingPro");

		   return mav; 
	}
  
//	---------------------���� ���� ��Ʈ----------------------------------
	
	@RequestMapping(value="/drawChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id,Locale locale) throws Exception{
		System.out.println("drawChart POST id "+id);
		response.setCharacterEncoding("UTF-8");
		ArrayList fiveSales = saleChartAction.salePerMon(id);
		JSONObject jsonObject = new JSONObject();  
		jsonObject.put("data", fiveSales);
		SaleCommand command = (SaleCommand) fiveSales.get(0);
		System.out.println("������ ��: "+fiveSales.size()+",������: "+jsonObject.toString());
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