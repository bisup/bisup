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
<script>
	//웹소켓 객체를 만듭니다. 이 객체에 정해준 주소값에 있는 세션에서 데이터를 주고받습니다.
    var webSocket = new WebSocket('ws://localhost:8088/bisup/Broadcasting');
    //웹소켓에서 에러 발생시 실행할 function을 정의합니다.
	webSocket.onerror = function(event) {
      onError(event)
    };
    //웹소켓이 실행되는 순간 실행할 function을 정의합니다.
    webSocket.onopen = function(event) {
      onOpen(event)
    };
    //웹소켓에 메시지를 보내는 순간 실행할 function을 정의합니다.
    webSocket.onmessage = function(event) {
      onMessage(event)
    };
    
    //메시지를 받으면 맨 아래에 메시지가 왔다는 사실을 알려줍니다.
    //onMessage 이벤트는 동일한 웹소켓에 접속한 모든 user에게 동일하게 발생합니다.
    //단지 그걸 볼 수 있는 user는 한정되어있습니다.
    function onMessage(event) {
    	$("#textWindows").append("<p align='right'><a href='#' onclick='window.open(/BroadCasting/open.do?mcontents="
    			+event.data+",'쪽지',"+"'resizable=no, width=600, height=600')'> 쪽지가 왔습니다! "
    			+event.data.substring(0,4)+".......</a><input type=checkbox name='mcontents' value='"+event.data+"'/></p>");
    }
    
    //웹소켓이 실행(창이 열림)되는 순간 접속한 ID에게 온 쪽지를 보여줍니다(5일치).
    function onOpen(event) {
        var url="/bisup/mystore/Broadcasting/onOpen.do";
        var param={id:'java2'};
        $.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindows").append("<div class=row><p align='center'>비즈업 쪽지창입니다!!!</p><br/></div>");
    			for(var idx=0; idx<args.data.length; idx++){
    				var mc = args.data[idx].mcontents;
    				$("#textWindows").append("<div class=row control-group><input type=checkbox name='mcontents' value='"+args.data[idx].mcontents+"'/><a href=# class=form-check-input onclick=goWindow(\'"+mc+"\')>"+
    					args.data[idx].send+"님으로부터 "+args.data[idx].mcontents.substring(0,4)+".......</a><br/></div>");
    			}
    			$("#textWindows").append("<hr/>");
    		}
    		,errors:function(){
			 alert();
			}
    	});
    }
    
    //에러가 나면 알럿창을 보여줍니다.
    function onError(event) {
      alert(event.data);
    }
    
    //웹소켓에 메시지를 보냅니다(webSocket.send). 
    //ajax는 메시지를 DB에 저장하고 view에 출력하는 역할입니다.
    function send() {
        webSocket.send($('#mcontents').val());
        var url="/bisup/mystore/Broadcasting/send.do";
        var param={sub:$('#sub').val(),mcontents:$('#mcontents').val(),send:'java1'};
        $.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindows").append("<p class='form-check-input' align='left'>"+args.data+"님에게 전송");
    	    	alert("쪽지 발송 완료");
    		}
    		,errors:function(args,request,status,error){
				alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
    	});
        $("#mcontents").val("");
    }
    
	function deleteText(){
		alert("메시지 삭제 완료!");
		window.history.go(-1);
	}
    
    //쪽지를 클릭 시 새 창에서 보여주기 위한 function입니다.
    //mcontens를 이용해 쪽지를 DB에서 찾습니다.
    function goWindow(mcontents){
    	var url='textWindow.jsp?mcontents='+mcontents+"&webSocket="+webSocket;
    	window.open(url,'textWindow','width=500,height=500');
    }
</script>
</head>
<body>
<div id="container" align="center">
    <fieldset style="border:1">
    <div style="width:500px;">
    <form onsubmit="deleteText()" action="/bisup/mystore/Broadcasting/deleteText.do">
        <div id="textWindows" class="col-lg-8 col-lg-offset-2"></div>
        <input type="text" placeholder="받으실분" id="sub">
        <input type="text" placeholder="내용" id="mcontents">
        <input type="button" value="send" onclick="send()">
        <input type="submit" value="삭제"	>
    </form>
    </div>
    </fieldset>
</div>
</body>
</html>