<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$("document").ready(function(){
		var url="/bisup/admin/allMembers.do";
		$.ajax({
			type:"post"
			,url:url
			,data:""
			,dataType:"json"
			,success:function(args){
				for(var idx=0; idx<args.data.length; idx++){
					$("#allMember").append("<tr><td>"+args.data[idx].id+"</td><td>"+args.data[idx].name
							+"</td><td>"+args.data[idx].pw+"</td><td>"+args.data[idx].nick+"</td><td>"
							+args.data[idx].sort+"</td><td>"+args.data[idx].snum+"</td><td>"
							+args.data[idx].phone+"</td><td>"+args.data[idx].tel+"</td><td>"
							+args.data[idx].reg+"</td><td>"+args.data[idx].email+"</td><td>"
							+args.data[idx].cer+"</td><td>")         
				}
				$("#paging").append()
				return false;
			}
			,error:function(e){
				alert(e.responseText);
				return false;
			}
		});
	})
	
	function selectPageNum(){
		
	}
</script>
</head>
<body>
<div id="container">
	
	<table class="table table-condensed">
	<thead><tr>
		<td>ID</td><td>이름</td><td>비밀번호</td><td>닉네임</td><td>분류</td><td>snum</td>
		<td>전화번호</td><td>핸드폰번호</td><td>가입일</td><td>이메일</td><td>이메일확인여부</td>
	</tr></thead>
	<tbody id="allMember">
		
	</tbody>
</table>
<div id="paging"></div>
</div>
</body>
</html>