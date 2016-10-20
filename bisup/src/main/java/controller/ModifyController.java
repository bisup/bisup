package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.GuCommand;
import command.MemberCommand;
import dao.JoinDAO;
import dao.MypageDAO;
import net.sf.json.JSONObject;


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

	@ModelAttribute("mem")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}

	public void guModel(Model model){
		//구 목록 가져오기
		List<GuCommand> list = joinDAO.gu();
		
		model.addAttribute("guSel", list);
	}
	

	
		public ModifyController() {
		// TODO Auto-generated constructor stub
	}
		
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.GET)
	public ModelAndView check(){
		int x=0;
		System.out.println("modifyCheck GET 방식");
		ModelAndView mav =new ModelAndView();	
		mav.setViewName("modifyCheck");
		mav.addObject("x",new Integer(x));
		return mav;//
	}
	
	@RequestMapping(value="/mypage/modifyCheck.do",method=RequestMethod.POST)
	public ModelAndView check(@ModelAttribute("member") MemberCommand membercommand, @RequestParam("buttonValue") String state,@RequestParam("inputpw") String ipw,HttpSession session){
		
		String id=(String)session.getAttribute("id");//session에 저장되어있는 id값
		
		int x=-1;
		ModelAndView mav =new ModelAndView();
		String bt="";
		String cpw = mypageDAO.Checkpw(id);
		
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

				return mav;
	}
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.GET)
	public ModelAndView formGet(Model model,HttpSession session){
		int sort = (int)session.getAttribute("sort");
		ModelAndView mav = new ModelAndView();
		if(sort==2){//창업예정자
			mav.setViewName("modifyForm2");
		}
		else{
			mav.setViewName("modifyForm");
		}
		String id=(String)session.getAttribute("id");//session에 저장되어있는 id값
		MemberCommand membercommand = mypageDAO.updateForm(id); //member테이블 불러오기
		guModel(model); //gu테이블에 gcode/gn list로 불러온값 모델에 저장
		mav.addObject("mem",membercommand);
		mav.addObject("snum",membercommand.getSnum());
		mav.addObject("gucode", membercommand.getGucode());
		mav.addObject("tel", membercommand.getTel());
		return mav;//

	}
	
	@RequestMapping(value="/mypage/checknick.do",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String checkN(@RequestParam("nick")String nick,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		JSONObject jso = new JSONObject();
		int mc=joinDAO.selectnick(nick);
			jso.put("n",mc);
			return jso.toString();
	    
		}	
	
	 @RequestMapping(value="/mypage/checksnum.do",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String checkS(@RequestParam("snum")String snum,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println(snum);
		JSONObject jso = new JSONObject();
		int isNumber=0;
		if(snum=="^\\d$"){
			isNumber=1;
		}
		int mc=joinDAO.selectsnum(Integer.parseInt(snum));
			jso.put("mc",mc);
			jso.put("isNumber", isNumber);
			return jso.toString();
		}	
	  
	
	@RequestMapping(value="/mypage/modifyForm.do",method=RequestMethod.POST)
	public String formPost(@ModelAttribute("mem") MemberCommand membercommand,HttpSession session,HttpServletRequest request){
		int y = 1;
		String snum1 = request.getParameter("snum1");
		String tel1 = request.getParameter("tel1");
		String ch=request.getParameter("ch");
		System.out.println("ch="+ch);
		System.out.println("snum+"+membercommand.getSnum());
		if(snum1!=""){
			int s=Integer.parseInt(request.getParameter("snum1"));
			System.out.println(s);
			membercommand.setSnum(s);
		}
		if(tel1!=""){
			String t=request.getParameter("tel1");
			System.out.println(t);
			membercommand.setTel(t);
		}
		
		System.out.println("조건 후 s="+membercommand.getSnum()+"t="+membercommand.getTel());
		
		int sort=membercommand.getSort();		
		
		int x=0;
		if(sort==1){
			x=mypageDAO.updatePro1(membercommand);
		}
		else{
			//창업예정자에서 창업자가 되거나 창업자 회원정보 수정
			x = mypageDAO.updatePro(membercommand,ch);
		}
		
		if(x==1){
			System.out.println("update성공");
			session.setAttribute("sort", membercommand.getSort());
			request.setAttribute("y", y);
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