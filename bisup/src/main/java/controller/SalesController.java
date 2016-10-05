/*package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import command.MenuCommand;
import command.SaleCommand;
import dao.SaleChartAction;
import dao.SalesDAO;
import net.sf.json.JSONObject;

@Controller
public class salesController {

   private SalesDAO salesdao;

      
   public void setSalesdao(SalesDAO salesdao) {
      this.salesdao = salesdao;
   }


   private SaleChartAction salechartaction;
   
   public void setSalechartaction(SaleChartAction salechartaction) {
      this.salechartaction = salechartaction;
   }

   

//   @RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
//   public String sales(HttpServletRequest request){
////      String id = request.getParameter("id"); request.setAttribute("id", id);
//      return "salesInserting";
//   }


//@RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
//   public String listview(Model model,HttpServletRequest request){
//
//      HttpSession session = request.getSession();
//      String id = (String) session.getAttribute("id");
//      System.out.println(id);
//      List<SaleCommand> salesList = saledao.menuList(id);
//      model.addAttribute("menuList", salesList);
//      System.out.println(salesList);
//         return "salesInserting";
//      }
   


   @RequestMapping(value="/salesInserting.do",method=RequestMethod.GET)
   public String listview(Model model,HttpServletRequest request, MenuCommand menucommand){

//      HttpSession session = request.getSession();
//      String id = (String) session.getAttribute("id");
//      System.out.println("id"+id);
      String id= "java";
      System.out.println("id"+id);
      List<MenuCommand> menuList = salesdao.menuList(id);
      System.out.println("menu"+menuList);
      model.addAttribute("menuList", menuList);
      System.out.println("menu2"+menuList);
         return "salesInserting";
      }

   @RequestMapping(value="/salesInserting.do",method=RequestMethod.POST)
   public String submit(@ModelAttribute SaleCommand salecommand){
      return "salesInsertingPro";
   }
   
   @RequestMapping(value="/salesInsertingPro.do",method=RequestMethod.GET)
   public String salesPro(HttpServletRequest request){
//      String id = request.getParameter("id"); request.setAttribute("id", id);
      return "salesInsertingPro";
   }
      
      
   
   @RequestMapping("/drawChart.do")
   public String drawChart(@RequestParam("id") String id, Model model){
      model.addAttribute("id",id);
      return "drawMonChart";
   }
      

      @RequestMapping(value="/drawMonChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
      @ResponseBody
      public void drawMonChart(HttpServletResponse response, 
            @RequestParam("id") String id) throws Exception{
         System.out.println("drawMonChart메소드 도착, id는 "+id);
         ArrayList fiveSales = salechartaction.salePerMon(id);
         JSONObject jsonObject = new JSONObject();
         jsonObject.put("data", fiveSales);
         SaleCommand command = (SaleCommand) fiveSales.get(0);
         System.out.println("매출 데이터 갯수 ::: "+fiveSales.size()+", 데이터 테스트 :::"+jsonObject.toString());
         PrintWriter printWriter = response.getWriter();
         printWriter.print(jsonObject.toString());
      }
      

   }




   */