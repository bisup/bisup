package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.AdminMemberDAO;
import net.sf.json.JSONObject;

@Controller
public class AdminController {

	private AdminMemberDAO adminMemberDao;
	
	public void setAdminMemberDao(AdminMemberDAO adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}

	@RequestMapping(value="/allMembers.do")
	public void selectAllMember(@RequestParam(value="pageNum",defaultValue="1")String pageNum,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		ArrayList members=new ArrayList();
		int count=0;
		int page = Integer.parseInt(pageNum);
		JSONObject jsonObject = new JSONObject();
		if(page==1){
			members=adminMemberDao.selectMembers();
			count=adminMemberDao.getPageNum();
			jsonObject.put("data", members);
			jsonObject.put("pageNum", count);
		}else{
			
			members=adminMemberDao.selectPagingMembers(page);
		}
			PrintWriter writer=response.getWriter();
			writer.print(jsonObject.toString());
	}
	
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(){
		return "adminMember";
	}
}
