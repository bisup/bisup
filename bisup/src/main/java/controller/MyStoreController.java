package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;
import command.SaleCommand;
import dao.MyStoreAction;
import dao.SaleProgressAction;
import net.sf.json.JSONObject;
import service.UpdatedUsersServiceImpl;
@Controller
public class MyStoreController {

	//dao����
	private MyStoreAction myStoreAction;
	
	public void setMyStoreAction(MyStoreAction myStoreAction) {
		this.myStoreAction = myStoreAction;
	}
	
	private SaleProgressAction saleProgressAction;

	public void setSaleProgressAction(SaleProgressAction saleProgressAction) {
		this.saleProgressAction = saleProgressAction;
	}
  
	//�޴���� ��Ʈ�ѷ��޼ҵ�
	@RequestMapping("/menuMain.do")
	public ModelAndView main(@RequestParam("id") String id){
		ModelAndView modelAndView = new ModelAndView();
		ArrayList menuList = myStoreAction.selectMenu(id);
		
		modelAndView.addObject("menuList", menuList);
		modelAndView.addObject("id", id);
		modelAndView.setViewName("menuInserting");
		System.out.println("��Ʈ�ѷ�-�޴���� ���� �� �̵�"+", "+menuList.size());
		return modelAndView;
	}
	
	@RequestMapping(value="/selectOneMenu.do",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public void selectOneMenu(@RequestParam("id") String id, @RequestParam("item") String item, 
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println("��Ʈ�ѷ�-�޴����/�������� ����, id�� "+id+", item�� "+item);
		Map menu = new HashMap(); menu.put("id", id); menu.put("item", item);
		JSONObject jsonObject = new JSONObject();
		MenuCommand oneMenu = myStoreAction.selectOneMenu(menu);
		System.out.println("�޴�Ŭ�� �� ��ȯ�ϴ� oneMenu�� item�� "+oneMenu.getItem()+", price�� "+oneMenu.getPrice());
		jsonObject.put("data", oneMenu);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	
	@RequestMapping(value="/menuInsertOrUpdate.do",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public void menuInsertOrUpdate(@RequestParam("id") String id,@RequestParam("item") String item,
			@RequestParam("price") String price,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		MenuCommand command = new MenuCommand();
		System.out.println("��Ʈ�ѷ�-�޴����/�޴��Է��̳�����, id�� "+id+", item�� "+item+", price�� "+price);
		int check=0;
		JSONObject jsonObject = new JSONObject();
		command.setId(id); command.setItem(item); command.setPrice(Integer.parseInt(price));
		Map info = new HashMap(); info.put("id", id); info.put("item", item);
		check=myStoreAction.isInsertOrUpdate(info);
		if(check>0){			
			System.out.println("�޴� ���� ����");
			jsonObject.put("oneMenu", myStoreAction.updateMenu(command));
			jsonObject.put("result", "�޴� ���� �Ϸ�");
		}else if(check==0){
			System.out.println("�޴� �Է� ����");
			jsonObject.put("oneMenu", myStoreAction.insertMenu(command));
			jsonObject.put("result", "�޴� �Է� �Ϸ�");
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping(value="/menuSearch.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String menuSearch(@RequestParam("id") String id,Model model,
			@RequestParam("searchtype") String searchtype,@RequestParam("searchkeyword") String searchkeyword){
		System.out.println("��Ʈ�ѷ�-�޴�ã��, id�� "+id+", searchtype�� "+searchtype+", searchkeyword�� "+Integer.parseInt(searchkeyword));
		List result = new ArrayList();
		if(searchtype.equals("item")){
			result=myStoreAction.searchMenuByItem(searchkeyword);
		}else if(searchtype.equals("price")){
			result=myStoreAction.searchMenuByPrice(Integer.parseInt(searchkeyword));
		}
		model.addAttribute("menuList", result);
		return "menuInserting";
	}
	@RequestMapping(value="/deleteMenu.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void deleteMenu(@RequestParam("id") String id,@RequestParam("item") String item,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println("��Ʈ�ѷ�-�޴����/�޴��Է��̳�����, id�� "+id+", item�� "+item);
		int check = 0;
		JSONObject jsonObject = new JSONObject();
		Map info = new HashMap(); info.put("id", id); info.put("item", item);
		check=myStoreAction.deleteMenu(info);
		if(check>0){			
			jsonObject.put("result", "�޴� ���� �Ϸ�");
		}else{
			jsonObject.put("result", "�޴� ���� ����");
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	//==================================================================
	
	//�������� ��Ʈ�ѷ��޼ҵ�
	@RequestMapping(value="/drawDayChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id,Locale locale) throws Exception{
		System.out.println("drawDayChart�޼ҵ� ����, id�� "+id);
		response.setCharacterEncoding("UTF-8");
		ArrayList fiveSales = saleProgressAction.salePerDay(id);
		JSONObject jsonObject = new JSONObject();  
		jsonObject.put("data", fiveSales);
		SaleCommand command = (SaleCommand) fiveSales.get(0);
		System.out.println("���� ������ ���� ::: "+fiveSales.size()+", ������ �׽�Ʈ :::"+jsonObject.toString());
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping("/saleProgressMain.do")
	public String saleMain(@RequestParam("id") String id, Model model){
		model.addAttribute("id",id);
		return "salesManaging";
	}
	
	//chart
	
	@Autowired
	private UpdatedUsersServiceImpl updatedUsersService;
	
	public UpdatedUsersServiceImpl getUpdatedUsersService() {
		return updatedUsersService;
	}

	public void setUpdatedUsersService(UpdatedUsersServiceImpl updatedUsersService) {
		this.updatedUsersService = updatedUsersService;
	}

	@RequestMapping("/chartMain.do")
	public String chartMain(){
		return "updatedUsers";
	}
	
	@RequestMapping("/drawChart.do")
	public void drawChart(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		Object[] objects = {updatedUsersService.getAllUsers()-updatedUsersService.getUpdatedUsers(),updatedUsersService.getUpdatedUsers()};
		forPrintWriterPrint(objects, response);
	}
	
	@ResponseBody
	public void forJSONPrint(Object[] objects) throws Exception{
		JSONObject jsonObject = new JSONObject();
		for(int i=1; i<=objects.length; i++){
			jsonObject.put("data"+i, objects[i-1]);
		}
		jsonObject.toString();
	}
	
	
	public void forPrintWriterPrint(Object[] objects, HttpServletResponse response) throws Exception{
		JSONObject jsonObject = new JSONObject();
		for(int i=1; i<=objects.length; i++){
			jsonObject.put("data"+i, objects[i-1]);
		}
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
}
