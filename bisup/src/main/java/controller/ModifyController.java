package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.GuCommand;
import command.MemberCommand;
import dao.JoinDAO;
import dao.MypageDAO;


	@Controller
	public class ModifyController {

	@Autowired	
	private MypageDAO mypageDAO;
	@Autowired
	private JoinDAO joinDAO;
	
	public void setMypageDAO(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}
	public void setJoinDAO(JoinDAO joinDAO) {
		this.joinDAO = joinDAO;
	}

	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	/*@ModelAttribute("gu")
	public GuCommand guModel(){
		return new GuCommand();
	}
	*/

	
		public ModifyController() {
		// TODO Auto-generated constructor stub
	}
		
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.GET)
	public ModelAndView check(){
		int x=0;
		ModelAndView mav =new ModelAndView();
		
		System.out.println("check get방식 요청");
		
		mav.setViewName("modifyCheck");
		mav.addObject("x",new Integer(x));
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.POST)
	public ModelAndView check(@ModelAttribute("member") MemberCommand membercommand, @RequestParam("buttonValue") String state,@RequestParam("inputpw") String ipw,HttpSession session){
		
		String id=(String)session.getAttribute("id");//session에 저장되어있는 id값
		System.out.println("session에 저장되어있는 id="+id);
		membercommand.setId(id);
		int x=-1;
		ModelAndView mav =new ModelAndView();
		
		System.out.println("버튼값은 "+state + "이고, input 비밀번호값은 " + ipw);

		String bt="";
		String cpw = mypageDAO.Checkpw(id);
		
		System.out.println("controller cpw="+cpw);  
		
		if(cpw.equals(ipw)){
		
			System.out.println("비밀번호 같아요");
			
				x=1;	
			if(state.equals("update")){
				bt="1";
			}
			else if(state.equals("delete")){
				bt="2";
			}	

		}
		mav.setViewName("modifyCheck");
		mav.addObject("x",new Integer(x));
		mav.addObject("bt", bt);
		
		System.out.println("x="+x+"bt="+bt);

				return mav;
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public ModelAndView formGet(@ModelAttribute("member") MemberCommand membercommand,HttpSession session){
		
		String id=(String)session.getAttribute("id");//session에 저장되어있는 id값
		membercommand.setId(id);
		
		System.out.println(membercommand.getId());
		
		ModelAndView mav =new ModelAndView();
		membercommand = mypageDAO.updateForm(membercommand.getId());
		
		List<GuCommand> list = new ArrayList<GuCommand>(); 
		list = joinDAO.gu();
		
		System.out.println("gucode:::"+membercommand.getGucode());
	
		for(int i=0; i<list.size(); i++){
			System.out.println(list.get(i));
		}
		mav.setViewName("modifyForm");
		mav.addObject("member",membercommand);
		mav.addObject("guSel",list);
		//mav.addObject("gu",new GuCommand());
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.POST)
	public String formPost(@ModelAttribute("member") MemberCommand membercommand){
		String id=membercommand.getId();

		System.out.println("id="+id);
		
		int x = mypageDAO.updatePro(membercommand);
		if(x==1){
			System.out.println("update성공");
			return "modSuc";//
		}
		
			System.out.println("update실패");
			return "modifyForm";
		
	}
	
	@RequestMapping(value="/mypage/delMem.do")
	public String deleteM(HttpSession session){
		MemberCommand membercommand = new MemberCommand();
		String id=(String)session.getAttribute("id");//session에 저장되어있는 id값
		membercommand.setId(id);
		int x = mypageDAO.deleteMem(id);
		if(x==1){
			return "delSuc";
		}
		
		System.out.println("삭제 실패");
		
		return "modifyCheck";
	}
	
	
	
}