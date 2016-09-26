package dao;

import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.SimpMessagingTemplate;

public class MemoAction extends SimpMessagingTemplate {
	
	public MemoAction(MessageChannel messageChannel) {
		super(messageChannel);
		// TODO Auto-generated constructor stub
	}

}
