<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
	<meta charset="UTF-8">
    <title>Testing websockets</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div id="container">
    <fieldset>
        <!-- <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text"/>
        <input type="submit" value="send" onclick="send()" /> -->
        <iframe id="textWindow" width="300" height="300" draggable="true" >
        
        </iframe>
        <input type="text" placeholder="수신자" id="sub">
        <input type="text" placeholder="내용" id="mcontents">
        <input type="button" value="send" onclick="send()">
    </fieldset>
</div>
</body>
    <script type="text/javascript">
        var textarea = document.getElementById("messageWindow");
        var webSocket = new WebSocket('ws://localhost:8099/bisup/Broadcasting');
        var inputMessage = document.getElementById('inputMessage');
    webSocket.onerror = function(event) {
      onError(event)
    };
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    function onMessage(event) {
        //textarea.value += "나나 : " + event.data + "\n";//다른사람에게 출력될 출력문
        var url="/bisup/Broadcasting/onMessage.do";
        var param=event.data;
    	$.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindow").append("<p align='right'><a href='#'>"+
    					args.data.nick+"("+args.data.id+")님으로부터 "+args.data.mreg+"/수신"+
    					"</a></p>")
    		}
    		,errors:function(args,request,status,error){
			 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
    }
    function onOpen(event) {
        //textarea.value += "접속하셨습니다!\n";//접속시 바로 나오는 메시지
        $("#textWindow").append("<p align='center'>비즈업 쪽지창입니다!!!</p>");
        var url="/bisup/Broadcasting/onOpen.do";
        $.ajax({
    		type:"post"
    		,url:url
    		,data:"java1"
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindow").append("<c:forEach items='${textList}' var='textList'>"+
    					+args.textList.id+"님으로부터"+args.textList.mreg+"<br/></c:forEach>")
    		}
    		,errors:function(args,request,status,error){
			 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
    }
    function onError(event) {
      alert(event.data);
    }
    function send() {
        //textarea.value += "나 : " + inputMessage.value + "\n";//send누르면 내 화면에 출력
        //webSocket.send(inputMessage.value);//웹소켓에 메시지값 보냄
        //inputMessage.value = "";//메시지값 초기화
        var url="/bisup/Broadcasting/send.do";
        var mcontents=document.getElementById('mcontents');
        $("#textWindow").append("<p align='left'>"+mcontents+"님에게 전송");
        webSocket.send(mcontents);
        var param={sub:document.getElementById('sub'),mcontents:mcontents,send:"${id}"};
        $.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindow").append("<p align='left'>"+args.data.mcontents+"님에게 전송");
    		}
    		,errors:function(args,request,status,error){
			 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
        $("#mcontents").val("");
    }
  </script>
</html>