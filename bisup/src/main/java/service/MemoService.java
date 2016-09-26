package service;

import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessagingTemplate;

public class MemoService extends SimpMessagingTemplate {
	
	
	public MemoService(MessageChannel messageChannel) {
		super(messageChannel);
		// TODO Auto-generated constructor stub
	}

}
