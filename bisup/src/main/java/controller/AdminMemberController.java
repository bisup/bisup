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
		response.setCharacterEncoding("UTF-8");//�ѱ� �ȱ����� ���ڵ�
		System.out.println("selectAllMember����");
		ArrayList members=new ArrayList();//ȸ������ ����� ArrayList
		members=adminMemberDao.selectMembers();//�������� �ش��ϴ� ��� ���ؿ�.
		
		JSONObject jsonObject = new JSONObject();//view�� �Ѱ��� json��ü ����
		jsonObject.put("data", members);//json��ü�� db���� �޾ƿ� command��ü�� ����.
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());//Printwriter�� view�� ���.
	}
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(){
		return "adminMember";
	}//ȸ������ ������ �̵� ���� �޼ҵ�
	
}
