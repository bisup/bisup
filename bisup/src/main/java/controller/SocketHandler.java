package controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
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
	
	@OnMessage//onMessage이벤트 발생시 실행합니다. 현재 웹소켓 세션에 접속한 모든 유저(자신을 제외한)에게 메시지를 전송합니다.
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
	
	@RequestMapping("/Broadcasting/onMessage.do")
	private void onMessagePro(@RequestParam("id")String sub,
			@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		System.out.println("onMessagePro메소드 진입, sub="+sub+", mcontents"+mcontents);
		MemoCommand command = new MemoCommand();
		Map idMcontents = new HashMap();
		idMcontents.put("sub", sub); idMcontents.put("mcontents", mcontents);
		command=socketDAO.selectDelivered(idMcontents);
		System.out.println("onMessage 결과command확인 ::: "+command.getMcontents()+", "+command.getSub());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("delivered", command);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
		
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	@RequestMapping("/Broadcasting/onOpen.do")
	private void onOpenPro(@RequestParam("id")String id,HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		System.out.println("onOpenPro메소드 진입");
		ArrayList textList=socketDAO.selectText(id);
		int count=socketDAO.countText();
		if(count<=10){
			count=1;
		}else if(count>10){
			count=count/10+1;
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", textList);
		jsonObject.put("count", count);
		System.out.println(textList);
		toString(textList);
		System.out.println("count:::"+count);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	private void toString(ArrayList textList) {
		// TODO Auto-generated method stub
		for(int i=0; textList.size()>i; i++){
			MemoCommand command = (MemoCommand) textList.get(i);
			System.out.println(i+"번째 command 값 : "+command.getSend()+", "+command.getSub()+", "+command.getMtitle()+", "+command.getMcontents()+", "+command.getMreg());
		}
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
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", sub);
		jsonObject.toString();
	}
	
	@RequestMapping("/Broadcasting/window.do")
	public void openWindow(@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception{
		System.out.println("openWindow진입, mcontents="+mcontents);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command = socketDAO.selectOneText(mcontents);
		PrintWriter printWriter = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", command);
		System.out.println("openWindow완료, mcontents="+command.getMreg());
		printWriter.print(jsonObject.toString());
	}
	
	@RequestMapping("/Broadcasting/deleteText.do")
	public String deleteText(String[] mcontents,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println(mcontents);
		for(String contents:mcontents){
			socketDAO.deleteText(contents);
		}
		return "textDeleteSuccess";
	}

	@RequestMapping("/Broadcasting/replyText.do")
	public void replyText(@RequestParam("contents")String mcontents,
			@RequestParam("send")String send,@RequestParam("sub")String sub,
			HttpServletResponse response) throws Exception{
		System.out.println("replyText진입, mcontents="+mcontents);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command.setMcontents(mcontents); command.setSend(send); command.setSub(sub);
		socketDAO.insertText(command);
	}
	
	@RequestMapping("/Broadcasting/selectPageNum.do")
	public void selectPageNum(@RequestParam("pageNum")String pageNum,
			HttpServletResponse response) throws Exception{
		System.out.println("selectPageNum진입");
		response.setCharacterEncoding("UTF-8");
		Map startandend = new HashMap();
		ArrayList pagedList = new ArrayList();
		startandend.put("startNum", (Integer.parseInt(pageNum)*10)+1);startandend.put("endNum", (Integer.parseInt(pageNum)+2)*10);
		pagedList=socketDAO.getPagedText(startandend,pagedList);
		JSONObject jsonObject = new JSONObject();
		System.out.println("pageListNull?:::"+pagedList.isEmpty());
		jsonObject.put("pagedList", pagedList);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
}
