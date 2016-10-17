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
		System.out.println("mpinfo��û");
		
		List<GuCommand> list=dao.GuS();	
		
		mav.addObject("list", list);
		
		return mav; 
	}
	
	@RequestMapping(value="/areaInfo/chartview.do",method=RequestMethod.GET)
	public ModelAndView chartview(HttpServletRequest request, @RequestParam(value = "chartlist") String[] chartlist){
		System.out.println("������Ʈ���̴�="+chartlist.length);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",chartlist);
		mav.setViewName("bisChart");
		return mav; 
	}
	
	/*@RequestMapping(value="/areaInfo/chartbar.do",method=RequestMethod.GET)
	public ModelAndView chartBar(HttpServletRequest request, @RequestParam(value = "chartlist1") String[] chartlist1){
		System.out.println("������Ʈ���̴�="+chartlist1.length);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list1",chartlist1);
		mav.setViewName("barChart");
		return mav; 
	}*/
	
	@RequestMapping(value="/areaInfo/mpInfo.do",method=RequestMethod.POST)
	public void sidoList(HttpServletResponse resp,@RequestParam("gcode") int gcode) throws Exception{
		System.out.println("�Ķ���ͷ� �޾ƿ� gcode::"+gcode);
		List<GuCommand> list = dao.dongS(gcode);
		
		JSONObject jso = new JSONObject(); //JSON ��ü����
		jso.put("data", list); //json�� map����(Ű,��), data��� key�� list�����͸� �����ߴ�.
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jso.toString());
		//out.print ������ ajax�� dataType�� json���� ������ ����
		//response�� �߰���ų���� String����
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
	
	@RequestMapping("/manual.do")
	public String cal(){
		//manual_bis get��� ��û
		return "manual_bis"; 
	}
	
	
}
