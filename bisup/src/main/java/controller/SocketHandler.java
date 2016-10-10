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
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import command.MemoCommand;
import dao.SocketDAO;
import net.sf.json.JSONObject;

@Controller
@ServerEndpoint("/Broadcasting")
public class SocketHandler {

	private SocketDAO socketDAO;
	
	public void setSocketDAO(SocketDAO socketDAO) {
		this.socketDAO = socketDAO;
	}

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("onMessage 진입, "+message+", "+session);
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
	
	@RequestMapping("/onMessage.do")
	private void onMessagePro(@RequestParam("sub")String sub,
			@RequestParam("mcontents")String mcontents,
			@RequestParam("send")String send,HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onMessagePro메소드 진입, sub="+sub+", mcontents"+mcontents+", send"+send);
		int check = 0;
		MemoCommand command = new MemoCommand();
		command.setSub(sub); command.setMcontents(mcontents); command.setSend(send);
		check=socketDAO.insertText(command);
		responseAjax("insert성공");
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", "insert성공");
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());*/
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	@RequestMapping("/Broadcasting/onOpen.do")
	@ResponseBody
	private void onOpenPro(@RequestParam("id")String id,HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("onOpenPro메소드 진입");
		ArrayList textList=socketDAO.selectText(id);
		responseAjax(textList);
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", textList);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());*/
	}
	
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		System.out.println("onClose 진입, "+session);
		clients.remove(session);
	}
	
	@RequestMapping("/Broadcasting/send.do")
	@ResponseBody
	public void send(@RequestParam("sub")String sub,
			@RequestParam("mcontents")String mcontents,
			@RequestParam("send")String send,
			HttpServletResponse response) throws Exception{
		System.out.println("send 진입, sub="+sub+", mcontents="+mcontents+", send="+send);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command.setSub(sub); command.setMcontents(mcontents); command.setSend(send);
		socketDAO.insertText(command);
		responseAjax(sub);
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", sub);
		jsonObject.toString();*/
	}
	
	@RequestMapping("/Broadcasting/window.do")
	@ResponseBody
	public void openWindow(@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception{
		System.out.println("openWindow진입, mcontents="+mcontents);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command = socketDAO.selectOneText(mcontents);
		responseAjax(command);
		/*JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", command);
		jsonObject.toString();*/
	}
	
	@RequestMapping("/Broadcasting/deleteText.do")
	@ResponseBody
	public void deleteText(@RequestParam("contents")String mcontents,
			HttpServletResponse response) throws Exception{
		System.out.println("deleteText진입, mcontents="+mcontents);
		response.setCharacterEncoding("UTF-8");
		int check=0;
		check=socketDAO.deleteText(mcontents);
		responseAjax(check);
	}
	
	@ResponseBody
	public void responseAjax(Object param){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", param);
		jsonObject.toString();
	}
}
