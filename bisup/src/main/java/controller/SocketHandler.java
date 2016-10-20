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

	//현재 세션 내에 있는 모든 클라이언트정보(해시코드인 것으로 추정)를 받아옵니다.
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	//onMessage이벤트 발생시 실행합니다. 현재 웹소켓 세션에 접속한 모든 유저(자신을 제외한)에게 메시지를 전송합니다.
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
	
	//메시지를 받았을 때 자신의 아이디와 내용을 통해 자신의 쪽지인지 유추합니다.
	@RequestMapping("/Broadcasting/onMessage.do")
	private void onMessagePro(HttpSession session,
			@RequestParam("mcontents")String mcontents,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		System.out.println("onMessagePro메소드 진입, sub="+id+", mcontents"+mcontents);
		MemoCommand command = new MemoCommand();
		Map idMcontents = new HashMap();
		String sub = socketDAO.getNick(id);
		idMcontents.put("sub", sub); idMcontents.put("mcontents", mcontents);
		command=socketDAO.selectDelivered(idMcontents);
		System.out.println("onMessage 결과command확인 ::: "+command.getMcontents()+", "+command.getSub());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("delivered", command);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}

	//클라이언트들을 하나의 세션에 넣는 onOpen메소드입니다.
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}
	
	//onOpen시 페이징 된 쪽지 내역을 보여주는 메소드입니다.
	@RequestMapping("/Broadcasting/onOpen.do")
	private void onOpenPro(HttpSession session, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		System.out.println("onOpenPro메소드 진입");
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
	
	//위의 onOpenPro메소드에서 받아온 쪽지 내용을 모두 출력하기 위한 toString 오버라이딩입니다.
	private void toString(ArrayList textList) {
		// TODO Auto-generated method stub
		for(int i=0; textList.size()>i; i++){
			MemoCommand command = (MemoCommand) textList.get(i);
			System.out.println(i+"번째 command 값 : "+command.getSend()+", "+command.getSub()+", "+command.getMtitle()+", "+command.getMcontents()+", "+command.getMreg());
		}
	}

	//페이지를 강제 종료하는 등 접속이 끊길 시 세션과의 접속을 끊는 메소드입니다.
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		System.out.println("onClose 진입, "+session);
		clients.remove(session);
	}
	
	//쪽지를 보낼 시 DB에 쪽지 내용을 저장합니다.
	@RequestMapping("/Broadcasting/send.do")
	@ResponseBody
	public void send(@RequestParam("sub")String sub,
			@RequestParam("mcontents")String mcontents,
			HttpSession session,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		String id = (String) session.getAttribute("id");
		String nick = socketDAO.getNick(id);
		System.out.println("send 진입, sub="+sub+", mcontents="+mcontents+", send="+nick);
		MemoCommand command = new MemoCommand();
		command.setSub(sub); command.setMcontents(mcontents); command.setSend(nick);
		socketDAO.insertText(command);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("data", sub);
		jsonObject.toString();
	}
	
	//쪽지를 클릭했을 때 내용을 이용해 쪽지의 모든 데이터를 가지고 옵니다.
	//새 창에서 쪽지를 열어보기때문에 필요합니다.
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
	
	//체크박스로 선택한 쪽지를 지우는 메소드입니다.
	//여러개 선택될 경우를 생각하여 파라미터를 String배열로 설정했습니다.
	@RequestMapping("/Broadcasting/deleteText.do")
	public String deleteText(String[] mcontents,
			HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("UTF-8");
		System.out.println(mcontents);
		for(String contents:mcontents){
			socketDAO.deleteText(contents);
		}
		//다시 처음 창으로 돌아가야 되는데 안됩니다.....
		return "textDeleteSuccess";
	}

	//쪽지를 연 상태에서 답장쓰기 버튼을 누를 시 웹소켓 내에서 제공하는 function send()를 이용하여 답장을 보냅니다.
	//위의 send메소드와 비슷한 로직입니다.
	@RequestMapping("/Broadcasting/replyText.do")
	public void replyText(@RequestParam("contents")String mcontents,
			HttpSession session,@RequestParam("sub")String sub,
			HttpServletResponse response) throws Exception{
		System.out.println("replyText진입, mcontents="+mcontents);
		String id = (String) session.getAttribute("id");
		String nick = socketDAO.getNick(id);
		response.setCharacterEncoding("UTF-8");
		MemoCommand command = new MemoCommand();
		command.setMcontents(mcontents); command.setSend(nick); command.setSub(sub);
		socketDAO.insertText(command);
	}
	
	//페이지 번호를 눌렀을 때 페이지 정보를 가지고 새로운 쪽지 내역을 출력합니다.
	//처음 쪽지창을 열 때엔 1-10까지의 쪽지만 나오게 됩니다.
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
		
		System.out.println("selectPageNum진입 sub:::"+nick+", startNum:::"+(Integer.parseInt(pageNum)*10+1)+", endNum:::"+((Integer.parseInt(pageNum)+2)*10));
		pagedList=socketDAO.getPagedText(startandend,pagedList);
		JSONObject jsonObject = new JSONObject();
		System.out.println("pageListNull?:::"+pagedList.isEmpty());
		jsonObject.put("pagedList", pagedList);
		PrintWriter printWriter = response.getWriter();
		printWriter.print(jsonObject.toString());
	}
}
