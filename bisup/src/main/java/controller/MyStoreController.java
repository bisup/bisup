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

	//dao파일
	private MyStoreAction myStoreAction;
	
	public void setMyStoreAction(MyStoreAction myStoreAction) {
		this.myStoreAction = myStoreAction;
	}
	
	private SaleProgressAction saleProgressAction;

	public void setSaleProgressAction(SaleProgressAction saleProgressAction) {
		this.saleProgressAction = saleProgressAction;
	}
  
	//메뉴등록 컨트롤러메소드
	@RequestMapping("/menuMain.do")
	public ModelAndView main(@RequestParam("id") String id){
		ModelAndView modelAndView = new ModelAndView();
		ArrayList menuList = myStoreAction.selectMenu(id);
		  
		modelAndView.addObject("menuList", menuList);
		modelAndView.addObject("id", id);
		modelAndView.setViewName("menuInserting");
		System.out.println("컨트롤러-메뉴등록 메인 폼 이동"+", "+menuList.size());
		return modelAndView;
	}
	
	@RequestMapping(value="/selectOneMenu.do",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public void selectOneMenu(@RequestParam("id") String id, @RequestParam("item") String item, 
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println("컨트롤러-메뉴등록/수정정보 생성, id는 "+id+", item은 "+item);
		Map menu = new HashMap(); menu.put("id", id); menu.put("item", item);
		JSONObject jsonObject = new JSONObject();
		MenuCommand oneMenu = myStoreAction.selectOneMenu(menu);
		System.out.println("메뉴클릭 후 반환하는 oneMenu의 item은 "+oneMenu.getItem()+", price는 "+oneMenu.getPrice());
		jsonObject.put("data", oneMenu);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	
	@RequestMapping(value="/menuInsertOrUpdate.do",method=RequestMethod.POST,produces = "text/plain;charset=UTF-8")
	public void menuInsertOrUpdate(@RequestParam("id") String id,@RequestParam("item") String item,
			@RequestParam("price") String price,HttpServletResponse response) throws Exception{
		MenuCommand command = new MenuCommand();
		//ajax의 값들을 command객체로 받는 방법을 몰라서 우선 각자 받아와서 따로 생성해줌. 선생님께 질문할 예정
		System.out.println("컨트롤러-메뉴등록/메뉴입력이나수정, id는 "+id+", item은 "+item+", price는 "+price);
		command.setId(id); command.setItem(item); command.setPrice(Integer.parseInt(price));
		Map info = new HashMap(); info.put("id", id); info.put("item", command.getItem());
		JSONObject jsonObject = new JSONObject();
		try{
			command = myStoreAction.isInsertOrUpdate(info);
			jsonObject.put("oneMenu", myStoreAction.updateMenu(command));
			jsonObject.put("result", "메뉴 수정 완료");
		}catch(Exception npe){
			jsonObject.put("oneMenu", myStoreAction.insertMenu(command));
			jsonObject.put("result", "메뉴 입력 완료");
		}finally{
		/*MenuCommand result = myStoreAction.isInsertOrUpdate(info);*/
		/*if((result.getItem()).equals(null)){
			jsonObject.put("oneMenu", myStoreAction.insertMenu(command));
			jsonObject.put("result", "메뉴 입력 완료");
		}else{
			jsonObject.put("oneMenu", myStoreAction.updateMenu(command));
			jsonObject.put("result", "메뉴 수정 완료");
		}*/
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
		}
	}
	
	@RequestMapping(value="/menuSearch.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public String menuSearch(@RequestParam("id") String id,Model model,
			@RequestParam("searchtype") String searchtype,@RequestParam("searchkeyword") String searchkeyword){
		System.out.println("컨트롤러-메뉴찾기, id는 "+id+", searchtype은 "+searchtype+", searchkeyword는 "+Integer.parseInt(searchkeyword));
		List result = new ArrayList();
		if(searchtype.equals("item")){
			result=myStoreAction.searchMenuByItem(searchkeyword);
		}else if(searchtype.equals("price")){
			result=myStoreAction.searchMenuByPrice(Integer.parseInt(searchkeyword));
		}
		model.addAttribute("menuList", result);
		return "menuInserting";
	}
	
	//매출추이 컨트롤러메소드
	@RequestMapping("/saleProgressChart.do")
	@ResponseBody
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id) throws Exception{
		System.out.println("drawDayChart메소드 도착, id는 "+id);
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
