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
	public ModelAndView check(){
		int x=0;
		ModelAndView mav =new ModelAndView();
		System.out.println("check get��� ��û");
		mav.setViewName("modifyCheck");
		mav.addObject("x",new Integer(x));
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.POST)
	public ModelAndView check(@ModelAttribute("member") MemberCommand membercommand, @RequestParam("buttonValue") String state,@RequestParam("inputpw") String ipw){
		String id="abc"; //session�� ����Ǿ��ִ� id��
		int x=-1;
		membercommand.setId(id);
		ModelAndView mav =new ModelAndView();
		System.out.println("��ư���� "+state + "�̰�, input ��й�ȣ���� " + ipw);
		String bt="";
		String cpw = mypageDAO.Checkpw(id);
		System.out.println("controller cpw="+cpw);  
		
		if(cpw.equals(ipw)){
			System.out.println("��й�ȣ ���ƿ�");
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
		//mav.addObject("x",new Integer(x));
				return mav;
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public ModelAndView formGet(@ModelAttribute("member")MemberCommand membercommand){
		String id="abc"; //session�� ����Ǿ��ִ� id��
		membercommand.setId(id);
		System.out.println(membercommand.getId());
		ModelAndView mav =new ModelAndView();
		membercommand = mypageDAO.updateForm(membercommand.getId());
		System.out.println("email="+membercommand.getEmail());
		mav.setViewName("modifyForm");
		mav.addObject("member",membercommand);
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.POST)
	public String formPost(@ModelAttribute("member") MemberCommand membercommand){
		
		String id=membercommand.getId();
		System.out.println("id="+id);
		
		int x = mypageDAO.updatePro(membercommand);
		
		if(x==1){
			System.out.println("update����");
		}
		else{
			System.out.println("update����");
		}
		return "modSuc";//
	}
	
	@RequestMapping(value="/mypage/delMem.do")
	public String deleteM(){
		MemberCommand membercommand = new MemberCommand();
		String id="abc"; //session�� ����Ǿ��ִ� id��
		membercommand.setId(id);
		int x = mypageDAO.deleteMem(id);
		if(x==1){
			return "delSuc";
		}
		System.out.println("���� ����");
		return "modifyCheck";
	}
	
	
	
}
