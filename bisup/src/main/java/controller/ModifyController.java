package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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

	public void guModel(Model model){
		List<GuCommand> list = joinDAO.gu();
		for(GuCommand li:list){
			System.out.println(li.getGcode()+li.getGn());
	
		}
		model.addAttribute("guSel", list);
	}
	

	
		public ModifyController() {
		// TODO Auto-generated constructor stub
	}
		
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.GET)
	public ModelAndView check(){
		int x=0;
		ModelAndView mav =new ModelAndView();	
		mav.setViewName("modifyCheck");
		mav.addObject("x",new Integer(x));
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.POST)
	public ModelAndView check(@ModelAttribute("member") MemberCommand membercommand, @RequestParam("buttonValue") String state,@RequestParam("inputpw") String ipw,HttpSession session){
		
		String id=(String)session.getAttribute("id");//session�� ����Ǿ��ִ� id��
		System.out.println("session�� ����Ǿ��ִ� id="+id);
		
		int x=-1;
		ModelAndView mav =new ModelAndView();
		String bt="";
		String cpw = mypageDAO.Checkpw(id);
		
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

				return mav;
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public ModelAndView formGet(Model model,HttpSession session){
		ModelAndView mav =new ModelAndView("modifyForm");
		String id=(String)session.getAttribute("id");//session�� ����Ǿ��ִ� id��
		MemberCommand membercommand = mypageDAO.updateForm(id);
		System.out.println(membercommand.getTel());
		guModel(model); //gu���̺� gcode/gn list�� �ҷ��°� �𵨿� ����
	/*	model.addAttribute("mem", membercommand);
		model.addAttribute("gucode", membercommand.getGucode());
		model.addAttribute("snum",membercommand.getSnum());
		System.out.println("gucode:::"+membercommand.getGucode());*/
		//System.out.println(membercommand.getSnum());
		mav.addObject("mem",membercommand);
		mav.addObject("snum",membercommand.getSnum());
		mav.addObject("gucode", membercommand.getGucode());
		mav.addObject("tel", membercommand.getTel());
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.POST)
	public String formPost(@RequestParam("name")String name,@RequestParam("pw")String pw,@RequestParam("nick")String nick,@RequestParam("phone")String phone,@RequestParam("tel")String tel ,@RequestParam("sort")int sort,@RequestParam("snum")int snum,@RequestParam("gucode")int gucode, HttpSession session) throws Exception{
		System.out.println("����");
	/*	int gucode=membercommand.getGucode();
		String id=membercommand.getId();*/
		String id=session.getId();
		MemberCommand membercommand =new MemberCommand();
		membercommand.setId(id);
		membercommand.setName(name);
		membercommand.setPw(pw);
		membercommand.setNick(nick);
		membercommand.setPhone(phone);
		membercommand.setSort(sort);
		membercommand.setGucode(gucode);
		membercommand.setTel(tel);
		System.out.println("id="+id);
		//membercommand.setGucode(gucode);
		/*System.out.println("�Ķ���ͷ� �޾ƿ� gu::"+ membercommand.getGucode());
		System.out.println("�Ķ����sort::"+membercommand.getSort());*/
		int x = mypageDAO.updatePro(membercommand);
		if(x==1){
			System.out.println("update����");
			System.out.println("������Ʈ �� gu::"+ membercommand.getGucode());
			System.out.println("������Ʈ �� sort::"+membercommand.getSort());
			return "modSuc";//
		}
		
			System.out.println("update����");
			return "modifyForm";
		
	}
	
	@RequestMapping(value="/mypage/delMem.do")
	public String deleteM(HttpSession session){
		MemberCommand membercommand = new MemberCommand();
		String id=(String)session.getAttribute("id");//session�� ����Ǿ��ִ� id��
		membercommand.setId(id);
		int x = mypageDAO.deleteMem(id);
		if(x==1){
			return "delSuc";
		}
		
		System.out.println("���� ����");
		
		return "modifyCheck";
	}
	
	
	
}