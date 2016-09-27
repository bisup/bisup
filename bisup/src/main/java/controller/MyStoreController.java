package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MenuCommand;
import dao.MyStoreAction;
  
@Controller
public class MyStoreController {

	private MyStoreAction myStoreAction;
	
	public void setMyStoreAction(MyStoreAction myStoreAction) {
		this.myStoreAction = myStoreAction;
	}

	@RequestMapping("/menuMain.do")
	public ModelAndView main(@RequestParam("id") String id){
		ModelAndView modelAndView = new ModelAndView();
		ArrayList menuList = myStoreAction.selectMenu(id);
		
		modelAndView.addObject("menuList", menuList);
		modelAndView.setViewName("bisup_mystore/menuInserting");
		System.out.println("컨트롤러-메뉴등록 메인 폼 이동"+", "+menuList.size());
		return modelAndView;
	}
	
	@RequestMapping("/menuMain/selectOneMenu.do")
	public ModelAndView selectOneMenu(@RequestParam("id") String id, @RequestParam("item") String item){
		System.out.println("컨트롤러-메뉴등록/수정정보 생성");
		ModelAndView modelAndView = new ModelAndView();
		Map menu = new HashMap(); menu.put("id", id); menu.put("item", item);
		
		modelAndView.addObject("oneMenu", menu);
		modelAndView.setViewName("/bisup_mystore/menuInserting");
		return modelAndView;//
	}
	
	@RequestMapping("/menuMain/menuInserting.do")
	public ModelAndView menuInserting(@ModelAttribute MenuCommand command){
		System.out.println("컨트롤러-메뉴등록");
		ModelAndView modelAndView = new ModelAndView();
		int check = 0; check = myStoreAction.insertMenu(command);
		String result = "";
		if(check==0){result="메뉴등록성공";}else{result="메뉴등록실패";}
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/bisup_mystore/menuInserting");
		return modelAndView;//
	}
	
	@RequestMapping("/menuMain/menuUpdate.do")
	public ModelAndView menuUpdate(@ModelAttribute MenuCommand command){
		System.out.println("컨트롤러-메뉴수정");
		ModelAndView modelAndView = new ModelAndView();
		int check = 0; check = myStoreAction.updateMenu(command);
		String result = "";
		if(check==0){result="메뉴수정성공";}else{result="메뉴수정실패";}
		modelAndView.addObject("result", result);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("/bisup_mystore/menuInserting");
		return modelAndView;//
	}
}
