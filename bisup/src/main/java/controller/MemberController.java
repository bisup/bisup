package controller;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import command.MemberCommand;
import dao.JoinDAO;
import mail.CreateCode;
import mail.SendEmail;
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
	
	@RequestMapping(value="/bisup_login/agree.do" ,method = RequestMethod.GET)
	public String joinagree(){
		return "join/joinAgree";
		
	}
	@RequestMapping(value= "/join.do" ,method = RequestMethod.GET)
	public String joinform(){
		return "join/joinForm";
		
	}
	
	
	@RequestMapping(value= "/join.do" ,method = RequestMethod.POST)
	public String insertmem(@ModelAttribute("member") MemberCommand memberCommand,
			BindingResult result, HttpSession session) throws MessagingException{
		new LoginCommandValidator().validate(memberCommand, result);
	    String getKey = code.randomCode();
		if (result.hasErrors()) {
			return "bisup_login/loginfail";
		}
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
			
			String key = request.getParameter("key"); /*�̸��Ͽ��� ���۵� �Ķ��Ÿ �Ķ���ͷ� Ű���� �޾ƿ�*/
			String sessionKey = (String) session.getAttribute("getKey"); /*���ǿ� ����� �ִ� Ű��*/
			System.out.println("::"+id+"::"+key+"::"+sessionKey+":::::"+"���� -> ��");
			int check = 0 ; //�����������θ� �����ϱ� ���� ����
			if (key.equals(sessionKey)){
				JoinDAO jd=new JoinDAO();
				check=jd.upcerti(id);
			/*���ǿ� ����� Ű���� �Ķ���ͷ� ���� Ű���� ���Ͽ� �������� �ٲٴ� �޼��� ����*/
			}
			System.out.println("::"+id+"::"+key+"::"+sessionKey+":::::"+check);
			HashMap hp=new HashMap();
			hp.put("check", check);
			
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
    	content= " ȸ������ ���̵��: "+find.getId()+" ��й�ȣ��: "+find.getPw();
    	sendEmail.sendId(membercommand.getEmail(),content);
    	return "bisup_login/secid";
    }
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) throws Exception{
    	session.invalidate();
    	return "bisup_login/logout";
    }
    
	public void checkDuplicateId(String id,BindingResult errors){
		List mc=joinDao.selectall();
		if(id.equals(mc)) {
			errors.rejectValue("id", "duplicate");
		}
}
	
	 
	  @RequestMapping(value="/checkId.do")
	public ModelAndView checkId(@RequestParam("id")String id){
		ModelAndView mav=new ModelAndView();
		List mc=joinDao.selectall();
		int x=0;
		if(id.equals(mc)) {
			 x=1;
		}
		mav.setViewName("checkId");
		mav.addObject(x);
		return mav;
}
}
 