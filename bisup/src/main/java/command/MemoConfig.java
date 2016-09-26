package command;


import javax.validation.Valid;

import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

import controller.MemoHandler;

@Configuration
@EnableWebSocketMessageBroker
public class MemoConfig extends AbstractWebSocketMessageBrokerConfigurer {

	@Valid
	private String echoUrl;
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// TODO Auto-generated method stub
		registry.addEndpoint(echoUrl);//서버 쪽 연결
	}
	
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		// TODO Auto-generated method stub
		registry.enableSimpleBroker("/topic");//클라이언트메시지
		registry.setApplicationDestinationPrefixes("/app");//서버전송메시지
	}
	
	public MemoCommand command(){
		return new MemoCommand();
	}

	public MemoHandler controller(){
		return new MemoHandler();
	}
	
	public TaskExecutor taskExecutor(){
		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
		executor.setCorePoolSize(10);
		executor.setMaxPoolSize(20);
		executor.setQueueCapacity(50);
		return executor;
	}
	
	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub
		registration.setInterceptors(controller());
	}
	
	@Override
	public void configureClientOutboundChannel(ChannelRegistration registration) {
		// TODO Auto-generated method stub
		registration.taskExecutor().corePoolSize(8);
		registration.setInterceptors(controller());
	}
}
