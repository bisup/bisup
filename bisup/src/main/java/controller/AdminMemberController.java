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
		response.setCharacterEncoding("UTF-8");//한글 안깨지게 인코딩
		System.out.println("selectAllMember진입");
		ArrayList members=new ArrayList();//회원정보 저장용 ArrayList
		Map startEndNum = new HashMap();
		int count = 0;
		count=adminMemberDao.getMemberCount();//회원수 가져오기
		
		if(count<10){//페이지 수 계산
			count=1;
		}else{
			count=adminMemberDao.getMemberCount()/10+1;
		}
		
		if(pageNum=="1"){//페이지 당 회원 불러옴
			startEndNum.put("startNum", 1);
			startEndNum.put("endNum", 10);
			members=adminMemberDao.selectMembers(startEndNum);
		}else{
			startEndNum.put("startNum", (Integer.parseInt(pageNum)-1)*10+1);
			startEndNum.put("endNum", Integer.parseInt(pageNum)*10);
			members=adminMemberDao.selectMembers(startEndNum);
		}
		
		JSONObject jsonObject = new JSONObject();//view에 넘겨줄 json객체 생성
		jsonObject.put("data", members);
		jsonObject.put("count", count);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());//Printwriter로 view에 출력.
	}
	@RequestMapping(value="/main.do",produces="text/plain;charset=UTF-8")
	public String adminMain(Model model,HttpServletRequest request){
		model.addAttribute("pageNum", request.getParameter("pageNum"));
		return "adminMember";
	}//회원관리 페이지 이동 위한 메소드
	
	
	//점포관리
	@RequestMapping(value="/storeChart.do",method=RequestMethod.POST,produces="text/plain;charset=UTF-8")
	public void store(HttpServletResponse response) throws IOException{
		response.setCharacterEncoding("UTF-8");
		System.out.println("store진입");
		List<MemberCommand> gucode = null;
		gucode = adminMemberDao.getGucode();
		for(MemberCommand i:gucode){
			System.out.println("코드::"+i.getGucode());
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
	
	//지역구별 회원 수 차트 구하기
	
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
		System.out.println("sort가 2인 회원="+s2);
		int c=adminMemberDao.getC();
		System.out.println("sort가 1에서 2인 회원="+c);
		int s=s2-c;
		System.out.println("기존의 회원이 2인 사람="+s);
		mav.addObject("s",s);
		mav.addObject("c", c);
		
		
		return mav;
	}
}
