package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MemberCommand;
import dao.MypageDAO;


	@Controller
	public class ModifyController {

	@Autowired	
	private MypageDAO mypageDAO;
		
	public void setMypageDAO(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}

	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}
	
		public ModifyController() {
		// TODO Auto-generated constructor stub
	}
		
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.GET)
	public String check(){
		System.out.println("check get방식 요청");
		return "modifyCheck";//
	}
	
	@RequestMapping(value="/mypage/modifyCheck.do")
	public String check(@ModelAttribute("member") MemberCommand membercommand,@RequestParam("buttonValue") String state,@RequestParam("inputpw") String ipw){
		String id="abc"; //session에 저장되어있는 id값
		membercommand.setId(id);
		
		System.out.println("버튼값은 "+state + "input 비밀번호값은 " + ipw);
		
		String cpw = mypageDAO.Checkpw(id);
		
		System.out.println("controller cpw="+cpw);  
		
		new ModelAndView().addObject("cpw",cpw);
		int x=0;
		if(cpw.equals(ipw)){
			/*if(state.equals("upadate")){
				return "modifyForm";
			}
			else if(state.equals("delete")){
				return "delSuc";
			}*/
			x=1;
			
			new ModelAndView().addObject("x",new Integer(x));
			return "modifyCheck";
		}
		
		return "modifyCheck";
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public String formGet(@ModelAttribute("member")MemberCommand membercommand){
		System.out.println(membercommand.getId());
		membercommand = mypageDAO.updateForm(membercommand.getId());
		System.out.println(membercommand.getEmail());
		return "modifyForm";//
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.POST)
	public String formPost(@ModelAttribute("member") MemberCommand membercommand){
		
		String id=membercommand.getId();
		System.out.println("id="+id);
		
		int x = mypageDAO.updatePro(membercommand);
		
		if(x==1){
			System.out.println("update성공");
		}
		else{
			System.out.println("update실패");
		}
		return "modifySuc";//
	}
	
	@RequestMapping(value="/mypage/delMem.do")
	public String deleteM(@RequestParam("id") String id){
		int x = mypageDAO.deleteMem(id);
		if(x==1){
			return "delSuc";
		}
		System.out.println("삭제 실패");
		return "modifyCheck";
	}
	
	
	
}
