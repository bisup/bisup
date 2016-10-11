package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import command.GuCommand;
import dao.SGISDAO;

@Controller
public class Sgiscontroller {
	@Autowired
	private SGISDAO sgisdao;
	
	public void setSgisdao(SGISDAO sgisdao) {
		this.sgisdao = sgisdao;
	}

	@RequestMapping("/areaInfo/salesarea.do")
	public ModelAndView test(){
		ModelAndView mav=new ModelAndView("salesarea");
		List<GuCommand> list=sgisdao.guselect();
		for(GuCommand gd:list){
		System.out.println(gd.getGn()+"::"+gd.getGcode());
		}		mav.addObject("list", list);
		return mav; 
	}
}
