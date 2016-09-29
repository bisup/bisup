package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;
import dao.MyStoreAction;
import dao.SaleProgressAction;
import net.sf.json.JSONObject;
  
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
		MenuCommand command = new MenuCommand();
		//ajax�� ������ command��ü�� �޴� ����� ���� �켱 ���� �޾ƿͼ� ���� ��������. �����Բ� ������ ����
		System.out.println("��Ʈ�ѷ�-�޴����/�޴��Է��̳�����, id�� "+id+", item�� "+item+", price�� "+price);
		command.setId(id); command.setItem(item); command.setPrice(Integer.parseInt(price));
		Map info = new HashMap(); info.put("id", id); info.put("item", command.getItem());
		JSONObject jsonObject = new JSONObject();
		try{
			command = myStoreAction.isInsertOrUpdate(info);
			jsonObject.put("oneMenu", myStoreAction.updateMenu(command));
			jsonObject.put("result", "�޴� ���� �Ϸ�");
		}catch(Exception npe){
			jsonObject.put("oneMenu", myStoreAction.insertMenu(command));
			jsonObject.put("result", "�޴� �Է� �Ϸ�");
		}finally{
		/*MenuCommand result = myStoreAction.isInsertOrUpdate(info);*/
		/*if((result.getItem()).equals(null)){
			jsonObject.put("oneMenu", myStoreAction.insertMenu(command));
			jsonObject.put("result", "�޴� �Է� �Ϸ�");
		}else{
			jsonObject.put("oneMenu", myStoreAction.updateMenu(command));
			jsonObject.put("result", "�޴� ���� �Ϸ�");
		}*/
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
		}
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
	
	//�������� ��Ʈ�ѷ��޼ҵ�
	@RequestMapping("/saleProgressChart.do")
	@ResponseBody
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id) throws Exception{
		System.out.println("drawDayChart�޼ҵ� ����, id�� "+id);
		ArrayList fiveSales = saleProgressAction.salePerDay(id);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("fiveSales", fiveSales);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
		
	}
	
	@RequestMapping("/saleProgressMain.do")
	public String saleMain(@RequestParam("id") String id, Model model){
		model.addAttribute("id",id);
		return "salesManaging";
	}
}
