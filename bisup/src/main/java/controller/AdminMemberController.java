package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.BoardCommand;
import command.MemberCommand;
import dao.AdminMemberDAO;
import net.sf.json.JSONObject;

@Controller
public class AdminMemberController {

	private AdminMemberDAO adminMemberDao;
	
	public void setAdminMemberDao(AdminMemberDAO adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}
	ModelAndView mav = null;
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
	
	
	//��������
	@RequestMapping(value="/storeChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void store(HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("UTF-8");
		System.out.println("store����");
		List<MemberCommand> gucode = null;
		gucode = adminMemberDao.getGucode();
		for(MemberCommand i:gucode){
			System.out.println("�ڵ�::"+i.getGucode());
		}
		List<MemberCommand> list = adminMemberDao.getStore();
		System.out.println(list.toString());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", list);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping("/store.do")
	public String storeMain(Model model){
		List<MemberCommand> gucode = null;
		gucode = adminMemberDao.getGucode();
		model.addAttribute("gucode", gucode);
		return "store";
		
		
	}
}
