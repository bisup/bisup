package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.AdminMemberDAO;
import net.sf.json.JSONObject;

@Controller
public class AdminMemberController {

	private AdminMemberDAO adminMemberDao;
	
	public void setAdminMemberDao(AdminMemberDAO adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}
	
	@RequestMapping(value="/allMembers.do")
	@ResponseBody
	public void selectAllMember(@RequestParam(value="pageNum",defaultValue="1")String pageNum,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println("selectAllMember진입 pageNum="+pageNum);
		int page = Integer.parseInt(pageNum);
		ArrayList members=new ArrayList();//회원정보 저장
		int count=0; Map map = new HashMap(); 
		
		map.put("startNum", (page-1)*10+1); map.put("endNum", (page)*10);//10개씩 출력할것이므로 10을 곱함.
		count=adminMemberDao.getMemberCount();//회원 수 받아옴. 페이징 넘버 구성
		members=adminMemberDao.getMember(map);//페이지에 해당하는 멤버 구해옴.
		Object[] param = {members,count/10+1};
		System.out.println("count="+count+", members="+members+", map.startnum"+map.get("startNum")+","+map.get("endNum"));
		responseAjax(param).toString();
	}
	
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(){
		return "adminMember";
	}
		
	public JSONObject responseAjax(Object[] param){
		JSONObject jsonObject = new JSONObject();
		for(int i=1; i<=param.length; i++){
			jsonObject.put("data"+i, param[i-1]);//data1은 회원정보, data2는 페이징 넘버
		}
		return jsonObject;
	}
}
