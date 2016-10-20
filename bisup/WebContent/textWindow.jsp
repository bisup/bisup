<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>

<%
String mcontents = request.getParameter("mcontents");
%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
//새 쪽지창입니다. 같은 세션에서 활동하기 위해서는 다시 한번 웹소켓 객체를 열어줘야 합니다.
var webSocket = new WebSocket('ws://192.168.20.53:8088/bisup/Broadcasting');
webSocket.onerror = function(event) {
    onError(event)
  };
  webSocket.onopen = function(event) {
    onOpen(event)
  };
  webSocket.onmessage = function(event) {
    onMessage(event)
  };

//메시지 내용을 통해 메시지의 전체 데이터를 가져와 창을 구성합니다.
function onOpen(event){
	var mcontents = '<%=mcontents%>';
	var url="/bisup/mystore/Broadcasting/window.do";
	var param={mcontents:'<%=mcontents%>'};
	$.ajax({
		type:"post"
		,url:url
		,data:param
		,dataType:"json"
		,success:function(args){
			$("#mtitle").append(args.data.mtitle);
			$("#send").append(args.data.send);	
			$("#sub").append(args.data.sub);	
			$("#mcontents").append(args.data.mcontents);
		}
		,errors:function(args,request,status,error){
		 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function onError(event){
	alert("에러입니다!! ㅠㅠ")
}

//답장쓰기 버튼을 누를 시 데이터를 이용해서 replyText를 호출하게 합니다.
function send(event){
	replyText();
}

//쪽지내용, 보낸사람, 받는사람을 이용해 답장 쪽지를 DB에 저장합니다.
function replyText(){
	webSocket.send(document.getElementById("replyContents"));
	var url="/bisup/mystore/Broadcasting/send.do";
	params={contents:document.getElementById("replyContents"),send:document.getElementById("send"),sub:document.getElementById("sub")};
	alert("contents:"+document.getElementById("replyContents")+", send:"+document.getElementById("sub")+", sub:"+document.getElementById("send"));
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			alert("답장을 보냈습니다!!");
			window.refresh();
		}
		,errors:function(args,request,status,error){
		 	alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>

<title>Insert title here</title>
</head>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
#mcontents {
font-family:'Nanum Pen Script', cursive; 
font-size:150%;
text-align:center;}
</style>
<body>
<div id="container">
	<table class="table table-hover">
		<thead class="thead">
			<tr><td id="mtitle" style="font: bold italic large Palatino, serif">글 제목 : </td></tr>
		</thead>
		<tbody class="tbody">
			<tr><td style="font-size:150%; text-align:center;">보내신분 : <div id="send"></div></td>
				<td style="font-size:150%; text-align:center;">받는분 : <div id="sub"></div></td></tr>
			<tr><td id="mcontents" colspan="2" style="color:#003300"></td></tr>
		</tbody>
	</table>
</div>
<hr style="border: dashed 3px;">
<div align="center">
<br/>
<div style="font: bold large Palatino, serif"><ins>답장쓰기</ins></div>
<br/>
	<textarea id="replyContents" cols="40" rows="10">
	</textarea>
	<br/><input type="button" value="답장쓰기" onclick="send()">
	</div>
</body>
</html>