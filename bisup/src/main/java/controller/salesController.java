package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import command.SaleCommand;

@Controller
public class salesController {

	@RequestMapping(value="/suna/salesInserting.do", method=RequestMethod.GET)
	public String salesform(HttpServletRequest request){
//		String id = request.getParameter("id"); request.setAttribute("id", id);
		return "salesInserting";
	}	
	
	@RequestMapping(value="/suna/salesInserting.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute SaleCommand salecommand){
		return "salesInsertingPro";
	}
	
		
	
	}
