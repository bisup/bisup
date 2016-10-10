<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$("document").ready(function(){
	var url="/bisup/mystore/Broadcasting/window.do";
	var param="${mcontents}";
	$.ajax({
		type:"post"
		,url:url
		,data:param
		,dataType:"json"
		,success:function(args){
			$("#mtitle").append(args.data.mtitle);
			$("#mcontens").append("<div id='contentsForDel'>"+args.data.mcontents+"</div>");			
		}
		,errors:function(args,request,status,error){
		 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});
function deleteText(){
	var contents=document.getElementById("contentsForDel");
	var url="/bisup/mystore/Broadcasting/deleteText.do";
	$.ajax({
		type:"post"
		,url:url
		,data:contents
		,dataType:"json"
		,success:function(args){
			alert("쪽지 삭제 완료!!");
		}
		,errors:function(args,request,status,error){
		 	alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
};
function replyText(){
	
}
</script>
<title>Insert title here</title>
</head>
<body>
<div id="container">
	<table id=>
		<thead>
			<tr><td id="mtitle" style="font: bold italic large Palatino, serif"></td></tr>
		</thead>
		<tbody>
			<tr><td id="mcontents"></td></tr>
			<tr><td><input type="button" value="쪽지삭제" onclick="deleteText()">
			<input type="button" value="답장쓰기" onclick="replyText()"></td></tr>
		</tbody>
	</table>
</div>
</body>
</html>