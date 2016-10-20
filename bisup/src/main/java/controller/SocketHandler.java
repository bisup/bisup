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
import javax.servlet.http.HttpSession;
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

	//���� ���� ���� �ִ� ��� Ŭ���̾�Ʈ����(�ؽ��ڵ��� ������ ����)�� �޾ƿɴϴ�.
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	//onMessage�̺�Ʈ �߻��� �����մϴ�. ���� ������ ���ǿ� ������ ��� ����(�ڽ��� ������)���� �޽����� �����մϴ�.
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("onMessage ����, "+message+", "+session);
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
	
	//�޽����� �޾��� �� �ڽ��� ���̵�� ������ ���� �ڽ��� �������� �����մϴ�.
	@RequestMapping("/Broadcasting/onMessage.do")
	private void onMessagePro(HttpSession session,
			@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		System.out.println("onMessagePro�޼ҵ� ����, sub="+id+", mcontents"+mcontents);
		MemoCommand command = new MemoCommand();
		Map idMcontents = new HashMap();
		String sub = socketDAO.getNick(id);
		idMcontents.put("sub", sub); idMcontents.put("mcontents", mcontents);
		command=socketDAO.selectDelivered(idMcontents);
		System.out.println("onMessage ���commandȮ�� ::: "+command.getMcontents()+", "+command.getSub());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("delivered", command);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}

	//Ŭ���̾�Ʈ���� �ϳ��� ���ǿ� �ִ� onOpen�޼ҵ��Դϴ�.
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	//onOpen�� ����¡ �� ���� ������ �����ִ� �޼ҵ��Դϴ�.
	@RequestMapping("/Broadcasting/onOpen.do")
	private void onOpenPro(HttpSession session, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		System.out.println("onOpenPro�޼ҵ� ����");
		String nick = socketDAO.getNick(id);
		ArrayList textList=socketDAO.selectText(nick);
		int count=socketDAO.countText(nick);
		if(count<=10){
			count=1;
		}else if(count>10){
			count=count/10+1;
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", textList);
		jsonObject.put("count", count);
		toString(textList);
		System.out.println("count:::"+count);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
	
	//���� onOpenPro�޼ҵ忡�� �޾ƿ� ���� ������ ��� ����ϱ� ���� toString �������̵��Դϴ�.
	private void toString(ArrayList textList) {
		// TODO Auto-generated method stub
		for(int i=0; textList.size()>i; i++){
			MemoCommand command = (MemoCommand) textList.get(i);
			System.out.println(i+"��° command �� : "+command.getSend()+", "+command.getSub()+", "+command.getMtitle()+", "+command.getMcontents()+", "+command.getMreg());
		}
	}

	//�������� ���� �����ϴ� �� ������ ���� �� ���ǰ��� ������ ���� �޼ҵ��Դϴ�.
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		System.out.println("onClose ����, "+session);
		clients.remove(session);
	}
	
	//������ ���� �� DB�� ���� ������ �����մϴ�.
	@RequestMapping("/Broadcasting/send.do")
	@ResponseBody
	public void send(@RequestParam("sub")String sub,
			@RequestParam("mcontents")String mcontents,
			HttpSession session,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		String nick = socketDAO.getNick(id);
		System.out.println("send ����, sub="+sub+", mcontents="+mcontents+", send="+nick);
		MemoCommand command = new MemoCommand();
		command.setSub(sub); command.setMcontents(mcontents); command.setSend(nick);
		socketDAO.insertText(command);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", sub);
		jsonObject.toString();
	}
	
	//������ Ŭ������ �� ������ �̿��� ������ ��� �����͸� ������ �ɴϴ�.
	//�� â���� ������ ����⶧���� �ʿ��մϴ�.
	@RequestMapping("/Broadcasting/window.do")
	public void openWindow(@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception{
		System.out.println("openWindow����, mcontents="+mcontents);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command = socketDAO.selectOneText(mcontents);
		PrintWriter printWriter = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", command);
		System.out.println("openWindow�Ϸ�, mcontents="+command.getMreg());
		printWriter.print(jsonObject.toString());
	}
	
	//üũ�ڽ��� ������ ������ ����� �޼ҵ��Դϴ�.
	//������ ���õ� ��츦 �����Ͽ� �Ķ���͸� String�迭�� �����߽��ϴ�.
	@RequestMapping("/Broadcasting/deleteText.do")
	public String deleteText(String[] mcontents,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println(mcontents);
		for(String contents:mcontents){
			socketDAO.deleteText(contents);
		}
		//�ٽ� ó�� â���� ���ư��� �Ǵµ� �ȵ˴ϴ�.....
		return "textDeleteSuccess";
	}

	//������ �� ���¿��� ���徲�� ��ư�� ���� �� ������ ������ �����ϴ� function send()�� �̿��Ͽ� ������ �����ϴ�.
	//���� send�޼ҵ�� ����� �����Դϴ�.
	@RequestMapping("/Broadcasting/replyText.do")
	public void replyText(@RequestParam("contents")String mcontents,
			HttpSession session,@RequestParam("sub")String sub,
			HttpServletResponse response) throws Exception{
		System.out.println("replyText����, mcontents="+mcontents);
		String id = (String) session.getAttribute("id");
		String nick = socketDAO.getNick(id);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command.setMcontents(mcontents); command.setSend(nick); command.setSub(sub);
		socketDAO.insertText(command);
	}
	
	//������ ��ȣ�� ������ �� ������ ������ ������ ���ο� ���� ������ ����մϴ�.
	//ó�� ����â�� �� ���� 1-10������ ������ ������ �˴ϴ�.
	@RequestMapping("/Broadcasting/selectPageNum.do")
	public void selectPageNum(@RequestParam("pageNum")String pageNum,
			HttpSession session,
			HttpServletResponse response) throws Exception{
		String id = (String)session.getAttribute("id");
		String nick = socketDAO.getNick(id);
		response.setCharacterEncoding("UTF-8");
		Map startandend = new HashMap();
		ArrayList pagedList = new ArrayList();
		if(pageNum.equals("1")){
			startandend.put("startNum", 1);
			startandend.put("endNum", 10);
		}else{
			startandend.put("startNum", (Integer.parseInt(pageNum)*10)+1);
			startandend.put("endNum", (Integer.parseInt(pageNum)+1)*10);
		}
		startandend.put("sub", nick);
		
		System.out.println("selectPageNum���� sub:::"+nick+", startNum:::"+(Integer.parseInt(pageNum)*10+1)+", endNum:::"+((Integer.parseInt(pageNum)+2)*10));
		pagedList=socketDAO.getPagedText(startandend,pagedList);
		JSONObject jsonObject = new JSONObject();
		System.out.println("pageListNull?:::"+pagedList.isEmpty());
		jsonObject.put("pagedList", pagedList);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
}
