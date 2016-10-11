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

import command.MemberCommand;
import dao.AdminMemberDAO;
import net.sf.json.JSONObject;

@Controller
public class AdminMemberController {

	private AdminMemberDAO adminMemberDao;
	
	public void setAdminMemberDao(AdminMemberDAO adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}
	
	@RequestMapping(value="/allMembers.do")
	public void selectAllMember(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");//한글 안깨지게 인코딩
		System.out.println("selectAllMember진입");
		ArrayList members=new ArrayList();//회원정보 저장용 ArrayList
		members=adminMemberDao.selectMembers();//페이지에 해당하는 멤버 구해옴.
		
		JSONObject jsonObject = new JSONObject();//view에 넘겨줄 json객체 생성
		jsonObject.put("data", members);//json객체에 db에서 받아온 command객체들 저장.
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());//Printwriter로 view에 출력.
	}
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(){
		return "adminMember";
	}//회원관리 페이지 이동 위한 메소드
	
}
