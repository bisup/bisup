package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MenuCommand;
import command.SaleCommand;
import dao.SalesDAO;

@Controller
public class SalesController {


	@RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
	public String sales(HttpServletRequest request){
//		String id = request.getParameter("id"); request.setAttribute("id", id);
		return "salesInserting";
	}
//	@RequestMapping(value="/salesInserting.do", method=RequestMethod.GET)
//	public String form(HttpServletRequest request, Model model, MenuCommand MenuCommand) {
//		
//		HttpSession session = request.getSession();
//		String id = (String) session.getAttribute("id"); 
//		model.addAttribute("id", id); // 
//		
//		List<MenuCommand> menuList = SalesDAO.menuList(id);
//		model.addAttribute("m", menuList);
//		
//		return "salesInserting";
//	}



	@RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
	public String submit(@ModelAttribute SaleCommand salecommand){
		return "salesInsertingPro";
	}
	
	@RequestMapping(value="/salesInsertingPro.do",method=RequestMethod.GET)
	public String salesPro(HttpServletRequest request){
//		String id = request.getParameter("id"); request.setAttribute("id", id);
		return "salesInsertingPro";
	}	
}
	