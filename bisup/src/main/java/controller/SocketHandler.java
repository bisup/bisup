package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import command.MemoCommand;
import dao.SocketDAO;
import net.sf.json.JSONObject;

@ServerEndpoint("/Broadcasting")
public class SocketHandler {

	private SocketDAO socketDAO;
	
	public void setSocketDAO(SocketDAO socketDAO) {
		this.socketDAO = socketDAO;
	}

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	
	@OnMessage
	public void onMessage(String message, Session session,
			@ModelAttribute("param") MemoCommand command,
			HttpServletResponse response) throws IOException {
		System.out.println(message);
		response.setCharacterEncoding("UTF-8");
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@RequestMapping("/onOpen.do")
	@OnOpen
	public void onOpen(Session session,
			@PathParam("id") String id) throws Exception {
		// Add session to the connected sessions set
		System.out.println(session+", id:::"+id);
		clients.add(session);
		ArrayList<MemoCommand> textList=socketDAO.selectText(id);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("textList", textList);
		jsonObject.toString();
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
	@RequestMapping("/send.do")
	public void send(@ModelAttribute("param") MemoCommand command,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		int check = 0;
		check=socketDAO.insertText(command);
		if(check>0){
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("data", command);
			PrintWriter printWriter = response.getWriter();
			printWriter.print(jsonObject.toString());
		
	}
	}
}
