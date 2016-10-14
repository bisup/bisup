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
	public void getdan(@RequestParam("dcode")int dcode,HttpServletResponse resp) throws Exception{
			System.out.println("옴");
			List<GuCommand> list =sgisdao.getdan(dcode);
			JSONObject jso = new JSONObject();
			jso.put("list", list);
			for(GuCommand li:list){
				System.out.println(li.getDn());
			}
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.print(jso.toString());
		}
	
	@RequestMapping(value="/areaInfo/Info.do",method=RequestMethod.POST)
	public void sidoList(HttpServletResponse resp,@RequestParam("gcode") int gcode) throws Exception{
		System.out.println("파라미터로 받아온 gcode::"+gcode);
		List<GuCommand> list = sgisdao.dongS(gcode);
		System.out.println("list의 갯수::"+list.size());
		JSONObject jso = new JSONObject(); //JSON 객체생성
		jso.put("data", list); //json은 map구조(키,값), data라는 key로 list데이터를 주입했다.		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		//out.print 내용을 ajax의 dataType이 json에게 데이터 쏴줌
		//response에 추가시킬때는 String으로
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

