package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AreaInfoController {

	@RequestMapping("/areaInfo/mpInfo.do")
	public String mpGet(){
		System.out.println("mpinfo��û");
		return "mpinfo"; 
	}
	
	@RequestMapping("/areaInfo/test.do")
	public String test(){
		System.out.println("testGet��û");
		return "test"; 
	}
	
	@RequestMapping("/areaInfo/test2.do")
	public String test1(){
		System.out.println("testGet��û");
		return "layout22"; 
	}
}
