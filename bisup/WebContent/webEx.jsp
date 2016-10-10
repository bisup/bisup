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

    <script type="text/javascript">
    var textarea = document.getElementById("textWindows");
    var webSocket = new WebSocket('ws://192.168.20.39:8088/bisup/Broadcasting');
    var inputMessage = $('#mcontents').val()
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
    	$("#textWindows").append("<p align='right'><a href='#' onclick='window.open('/BroadCasting/open.do?mcontents="+event.data+"','쪽지',"+
    			"'resizable=no, width=600, height=600')'> 쪽지가 왔습니다! "+event.data.substring(0,4)+".......</a></p>");
    }
    function onOpen(event) {
        var url="/bisup/mystore/Broadcasting/onOpen.do";
        var param={id:'java1'};
        $.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			$("#textWindows").append("<p align='center'>비즈업 쪽지창입니다!!!</p><br/>");
    			for(var idx=0; idx<args.data.length; idx++){
    				$("#textWindows").append("<a href='#' class='form-check-input' onclick='window.open('/BroadCasting/open.do?mcontents="+args.data[idx].mcontents+"')'>"+
    						args.data[idx].send+"님으로부터 "+args.data[idx].mcontents.substring(0,4)+"</a><br/>");
    			}
    			$("#textWindows").append("<hr/>");
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
  </script>
</head>
<body>
<div id="container" style="width:300px;height:400px;overflow:auto;">
    <fieldset>
        <div id="textWindows" class="form-group"></div>
        <input type="text" placeholder="받으실분" id="sub">
        <input type="text" placeholder="내용" id="mcontents">
        <input type="button" value="send" onclick="send()">
    </fieldset>
</div>
</body>
</html>