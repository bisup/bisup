package controller;

import java.io.PrintWriter;
import java.util.HashMap;
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
         mav.addObject("list", list);
      return mav; 
   }
   
   @RequestMapping(value="/areaInfo/return.do" , method = RequestMethod.GET)
   public void getdan(@RequestParam("gcode")int gcode,HttpServletResponse resp) throws Exception{
         System.out.println("¿È");
         List<GuCommand> list =sgisdao.getdan(gcode);
         JSONObject jso = new JSONObject();
         jso.put("list", list);
         resp.setContentType("text/html;charset=utf-8");
         PrintWriter out = resp.getWriter();
         out.print(jso.toString());
      }
   @RequestMapping(value="/areaInfo/sel.do", method = RequestMethod.POST)
   public ModelAndView dongList( @RequestParam(value="dcode")String[] dcode,HttpServletResponse resp) throws Exception {
	   ModelAndView mav =new ModelAndView("sdanger");
		  int dc=Integer.parseInt(dcode[0]);
		  if(!dcode[1].isEmpty()){
		  int dc1=Integer.parseInt(dcode[1]);
		  List<GuCommand> list1 =sgisdao.getd(dc1);
		  mav.addObject("li1", list1);
		  }else{
			  List<GuCommand> list1 =sgisdao.getd(dc);
			  mav.addObject("li1", list1); 
		  }
		  if(!dcode[2].isEmpty()){
		  int dc2=Integer.parseInt(dcode[2]);
		  List<GuCommand> list2 =sgisdao.getd(dc2);
		  mav.addObject("li2", list2);
		  }else{
			  List<GuCommand> list2 =sgisdao.getd(dc);
			  mav.addObject("li2", list2); 
		  }
	   List<GuCommand> list=sgisdao.guselect();
	   List<GuCommand> list0 =sgisdao.getd(dc);
	   mav.addObject("list", list);
	   mav.addObject("li", list0);
	 
	
	   return mav;   
   }
   
   @RequestMapping("/areaInfo/sdanger.do")
   public ModelAndView form(){
      ModelAndView mav=new ModelAndView("sdanger");
      List<GuCommand> list=sgisdao.guselect();
           
      mav.addObject("list", list);
      return mav; 
   }
}
