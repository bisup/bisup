package controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
public class AreaInfoController {

	@Autowired
	private SGISDAO dao;

	public void setDao(SGISDAO dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/areaInfo/mpInfo.do",method=RequestMethod.GET)
	public ModelAndView mpGet(){
		ModelAndView mav = new ModelAndView("mpinfo");
		System.out.println("mpinfo요청");
		
		List<GuCommand> list=dao.GuS();	
		
		mav.addObject("list", list);
		
		return mav; 
	}
	
	@RequestMapping(value="/areaInfo/chartview.do",method=RequestMethod.GET)
	public ModelAndView chartview(HttpServletRequest request, @RequestParam(value = "chartlist") String[] chartlist){
		//차트 가져오는 메서드
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",chartlist);
		mav.setViewName("bisChart");
		return mav; 
	}
	
	
	
	@RequestMapping(value="/areaInfo/mpInfo.do",method=RequestMethod.POST)
	public void sidoList(HttpServletResponse resp,@RequestParam("gcode") int gcode) throws Exception{
		System.out.println("파라미터로 받아온 gcode::"+gcode);
		List<GuCommand> list = dao.dongS(gcode);
		
		JSONObject jso = new JSONObject(); //JSON 객체생성
		jso.put("data", list); //json은 map구조(키,값), data라는 key로 list데이터를 주입했다.
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		
	}
	
	
	@RequestMapping("/manual.do")
	public String cal(){
		//manual_bis get방식 요청
		return "manual_bis"; 
	}
	
	
}
