package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.GuCommand;
import dao.SGISDAO;
import net.sf.json.JSONObject;

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
	
	@RequestMapping(value="/areaInfo/return.do" , method = RequestMethod.GET)
	public void getdan(@RequestParam("gcode")int gcode,HttpServletResponse resp) throws Exception{
			System.out.println("¿È");
			List<GuCommand> list =sgisdao.getdan(gcode);
			JSONObject jso = new JSONObject();
			jso.put("list", list);
			for(GuCommand li:list){
				System.out.println(li.getDn());
			}
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print(jso.toString());
		}
	
	@RequestMapping("/areaInfo/sdanger.do")
	public ModelAndView form(){
		ModelAndView mav=new ModelAndView("sdanger");
		List<GuCommand> list=sgisdao.guselect();
		for(GuCommand gd:list){
		System.out.println(gd.getGn()+"::"+gd.getGcode());
		}		mav.addObject("list", list);
		return mav; 
	}
}

