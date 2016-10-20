package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.AdmcdCommand;
import command.BoardCommand;
import command.MemberCommand;
import command.MemoCommand;
import dao.AdminMemberDAO;
import net.sf.json.JSONObject;
import service.AdminMemberServiceImpl;

@Controller
public class AdminMemberController {

	private AdminMemberDAO adminMemberDao;
	
	public void setAdminMemberDao(AdminMemberDAO adminMemberDao) {
		this.adminMemberDao = adminMemberDao;
	}
	ModelAndView mav = null;
	@RequestMapping(value="/allMembers.do")
	public void selectAllMember(@RequestParam(value="pageNum", defaultValue="1") String pageNum,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");//�ѱ� �ȱ����� ���ڵ�
		System.out.println("selectAllMember����");
		ArrayList members=new ArrayList();//ȸ������ ����� ArrayList
		Map startEndNum = new HashMap();
		int count = 0;
		count=adminMemberDao.getMemberCount();//ȸ���� ��������
		
		if(count<10){//������ �� ���
			count=1;
		}else{
			count=adminMemberDao.getMemberCount()/10+1;
		}
		
		if(pageNum=="1"){//������ �� ȸ�� �ҷ���
			startEndNum.put("startNum", 1);
			startEndNum.put("endNum", 10);
			members=adminMemberDao.selectMembers(startEndNum);
		}else{
			startEndNum.put("startNum", (Integer.parseInt(pageNum)-1)*10+1);
			startEndNum.put("endNum", Integer.parseInt(pageNum)*10);
			members=adminMemberDao.selectMembers(startEndNum);
		}
		
		JSONObject jsonObject = new JSONObject();//view�� �Ѱ��� json��ü ����
		jsonObject.put("data", members);
		jsonObject.put("count", count);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());//Printwriter�� view�� ���.
	}
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(Model model,HttpServletRequest request){
		model.addAttribute("pageNum", request.getParameter("pageNum"));
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
	
	//�������� ȸ�� �� ��Ʈ ���ϱ�
	
	@Autowired
	private AdminMemberServiceImpl adminMemberService;
	
	public AdminMemberServiceImpl getAdminMemberService() {
		return adminMemberService;
	}
	public void setAdminMemberService(AdminMemberServiceImpl adminMemberService) {
		this.adminMemberService = adminMemberService;
	}
	
	
	
	@RequestMapping("/guMemMain.do")
	public ModelAndView getGuMem(HttpServletResponse response) throws Exception{
		
		response.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("GuMember");
		ArrayList gu = new ArrayList();
		ArrayList guMem = new ArrayList();
		gu = adminMemberService.getGu(gu);
		guMem = adminMemberService.getGuMem(guMem, gu);
		mav.addObject("guMem", guMem);
		mav.addObject("gu", gu);
		return mav;
	}
	
	@RequestMapping("/chang.do")
	public ModelAndView getChang() throws Exception{
		ModelAndView mav = new ModelAndView("GuMember");
		int s2=adminMemberDao.getB();
		System.out.println("sort�� 2�� ȸ��="+s2);
		int c=adminMemberDao.getC();
		System.out.println("sort�� 1���� 2�� ȸ��="+c);
		int s=s2-c;
		System.out.println("������ ȸ���� 2�� ���="+s);
		mav.addObject("s",s);
		mav.addObject("c", c);
		
		
		return mav;
	}
}
