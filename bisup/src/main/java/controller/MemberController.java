package controller;


import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import command.GuCommand;
import command.MemberCommand;
import dao.JoinDAO;
import mail.CreateCode;
import mail.SendEmail;
import net.sf.json.JSONObject;
import validator.LoginCommandValidator;



@Controller
public class MemberController {
    @Autowired
    private JoinDAO joinDao;
    
    @Autowired
    private SendEmail sendEmail;
    @Autowired
    private CreateCode code;
     
    

	public SendEmail getSendEmail() {
		return sendEmail;
	}

	public void setSendEmail(SendEmail sendEmail) {
		this.sendEmail = sendEmail;
	}

	public CreateCode getCode() {
		return code;
	}

	public void setCode(CreateCode code) {
		this.code = code;
	}

	public JoinDAO getJoinDao() {
		return joinDao;
	}

	public void setJoinDao(JoinDAO joinDao) {
		this.joinDao = joinDao;
	}
	@ModelAttribute("member")
	public MemberCommand formBacking(){
		return new MemberCommand();
	}
	
	public void guModel(Model model){
		List<GuCommand> list = joinDao.gu();
		for(GuCommand li:list){
			System.out.println(li.getGcode()+li.getGn());
	
		}
		model.addAttribute("guSel", list);
	}
	
	@RequestMapping(value="/bisup_login/agree.do" ,method = RequestMethod.GET)
	public String joinagree(){
		return "join/joinAgree";
		
	}
	@RequestMapping(value= "/join.do" ,method = RequestMethod.GET)
	public String joinform(Model model){
		guModel(model); //gu테이블에 gcode/gn list로 불러온값 모델에 저장
		return "join/joinForm";
		
	}
	
	
	@RequestMapping(value= "/join.do" ,method = RequestMethod.POST)
	public String insertmem(@ModelAttribute("member") MemberCommand memberCommand,
			BindingResult result, HttpSession session) throws MessagingException{
		new LoginCommandValidator().validate(memberCommand, result);
		checkDuplicateId(memberCommand.getId(), result);
	    String getKey = code.randomCode();
		try{
			int x=joinDao.insertMember(memberCommand);
			checkDuplicateId(memberCommand.getId(),result);
			if(result.hasErrors()){
				return "joinfail";
			}				
			if(x==1){
				session.setAttribute("getKey", getKey);
				session.setAttribute("cerId", memberCommand.getId());
				sendEmail.sendCode(memberCommand.getEmail(), getKey, x);
				return "join/joinok";
			}else{
				return "bisup_login/loginmain";
			}
		}catch (AuthenticationException ex) {
			result.reject("invalidIdOrPassword", new Object[] { memberCommand
   					.getId() }, null);
			return "bisup_login/loginfail";
		}
		
	}
	
	@RequestMapping("/certifyKey.do")
	public ModelAndView certifyKey (HttpServletRequest request,HttpServletResponse response)throws Throwable{
			ModelAndView mvc =new ModelAndView();
			MemberCommand mc=new MemberCommand();
			HttpSession session =request.getSession();
			String id = (String) session.getAttribute("cerId"); 
			
			String key = request.getParameter("key"); /*이메일에서 전송된 파라메타 파라메터로 키값을 받아옴*/
			String sessionKey = (String) session.getAttribute("getKey"); /*세션에 저장되 있던 키값*/
			System.out.println("::"+id+"::"+key+"::"+sessionKey+":::::"+"전에 -> 후");
			int check = 0 ; //인증성공여부를 전달하기 위한 변수
			if (key.equals(sessionKey)){
				joinDao.upcerti(id);
			/*세션에 저장된 키값과 파라메터로 받은 키값을 비교하여 인증값을 바꾸는 메서드 실행*/
			}
			System.out.println("::"+id+"::"+key+"::"+sessionKey+":::::"+check);
			HashMap hp=new HashMap();
			//hp.put("check", check);
			
			mvc.setViewName("join/certifyKey");
			mvc.addObject(hp);
			return mvc;
			}
    @RequestMapping(value="/searchpw.do", method=RequestMethod.GET)
    public String searchpw(){
    	return "bisup_login/findid";
    }
    @RequestMapping(value="/searchpw.do", method=RequestMethod.POST)
    public String searchidpw(@ModelAttribute("member") MemberCommand membercommand,
    		HttpSession session) throws Exception{
    	String content="";
    	MemberCommand find=joinDao.selectId(membercommand);    
    	content= " 회원님의 아이디는: "+find.getId()+" 비밀번호는: "+find.getPw();
    	sendEmail.sendId(membercommand.getEmail(),content);
    	return "bisup_login/secid";
    }
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) throws Exception{
    	session.invalidate();
    	return "bisup_login/logout";
    }
    
	public void checkDuplicateId(String id,BindingResult errors){

		List mc=joinDao.select();
		if(id.equals(mc)) {
			errors.rejectValue("id", "duplicate");
		}

}
	
	 

	 
	  @RequestMapping(value="/checkId.do",method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String checkId(@RequestParam("id")String id,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		int x=0;
		JSONObject jso = new JSONObject();
		int mc=joinDao.selectall(id);
		if(mc>0){
			x=1;
			jso.put("x",x);
			return jso.toString();
		}else{
			jso.put("x",x);
			return jso.toString();
		}         
		}	
	  @RequestMapping(value="/checkn.do",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String checkN(@RequestParam("nick")String nick,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println(nick);
		JSONObject jso = new JSONObject();
		int mc=joinDao.selectnick(nick);
			jso.put("n",mc);
			return jso.toString();
	    
		}	
	  @RequestMapping(value="/checksn.do",method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	  @ResponseBody
	public String checkS(@RequestParam("snum")String snum,HttpServletResponse resp) throws Exception{
		resp.setContentType("text/html; charset=UTF-8");
		System.out.println(snum);
		JSONObject jso = new JSONObject();
		int mc=joinDao.selectsnum(Integer.parseInt(snum));
			jso.put("mc",mc);
			return jso.toString();
	    
		}	
}

 