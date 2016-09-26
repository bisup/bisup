package controller;



import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptorAdapter;
import org.springframework.stereotype.Controller;

import command.MemoCommand;
import service.MemoService;

@Controller
public class MemoHandler extends ChannelInterceptorAdapter {

	@Autowired
	private MemoService service; 
	
	@Autowired
	private MemoCommand command;
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public void postSend(Message<?> message, MessageChannel channel, boolean sent) {
		// TODO Auto-generated method stub
		
		StompHeaderAccessor sha = StompHeaderAccessor.wrap(message);
		if(sha.getCommand()==null){
			return;
		}
		Set<MemoCommand> con = command.getConnections();
		String sessionId = sha.getSessionId();
		String userId = sha.getUser().getName();
		
		MemoHandler controller = new MemoHandler();
		switch(sha.getCommand()){
		case CONNECT:
			con.add(command);
			con.stream().forEach(value -> logger.info(value.toString()));
			break;
		case DISCONNECT:
			con.remove(command);
			break;
		default:
			break;
		}
		super.postSend(message, channel, sent);
	}
}
