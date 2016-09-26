package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.SimpleInstantiationStrategy;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.MemoCommand;
import service.MemoService;

import java.security.Principal;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/main/main.do")
public class MemoController{
		
	private MemoService template;
	
	public void setTemplate(MemoService template) {
		this.template = template;
	}

	private MemoCommand command;
	
	public void setCommand(MemoCommand command) {
		this.command = command;
	}

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(method=RequestMethod.GET)
	@MessageMapping("${hdl.comm.echo.stomp.url}")
	public void sendEcho(MemoCommand hello, Principal principal, SimpMessageHeaderAccessor headerAccessor) throws Exception{
		Set<MemoCommand> con = command.getConnections();
		hello.setSend(principal.getName());
		
		Map<String, Object> ss = headerAccessor.getMessageHeaders();
		logger.info(ss.toString());
		if(isNotEmpty(hello.getMtitle())){
			template.convertAndSendToUser(hello.getMtitle(), "/topic/echo", hello);
			logger.info(hello.toString());
		}else{
			con.stream().forEach(ses -> {
				if(!ses.getMtitle().equals(hello.getMtitle())){
					hello.setMtitle(ses.getMtitle());//받는사람
					logger.info(hello.toString());
					template.convertAndSendToUser(ses.getMtitle(), "/topic/echo", hello);//전체쪽지
				}
			});
		}
	}

	private boolean isNotEmpty(String mtitle) {
		// TODO Auto-generated method stub
		if(mtitle!=null){
			return true;
		}else{
			return false;
		}
	}
}
