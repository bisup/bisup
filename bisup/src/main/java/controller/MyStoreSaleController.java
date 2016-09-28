package controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.SaleProgressAction;
import net.sf.json.JSONObject;
@Controller
public class MyStoreSaleController {

	private SaleProgressAction saleProgressAction;

	public void setSaleProgressAction(SaleProgressAction saleProgressAction) {
		this.saleProgressAction = saleProgressAction;
	}

	@RequestMapping(value="/drawDayChart.do", method=RequestMethod.POST)
	@ResponseBody
	public void drawDayChart(HttpServletResponse response, 
			@RequestParam("id") String id) throws Exception{
		System.out.println("drawDayChart메소드 도착, id는 "+id);
		ArrayList fiveSales = saleProgressAction.salePerDay(id);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("fiveSales", fiveSales);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
		
	}
	
}
