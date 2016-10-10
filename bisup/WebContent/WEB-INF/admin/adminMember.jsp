<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
		var pageNum=1;
		$.ajax({
			type:"post"
			,url:url
			,data:pageNum
			,dataType:"json"
			,success:function(args){
				for(var idx=0; idx<args.data.length; idx++){
					$("#allMember").append("<tr><td><a href='/bisup/admin/selectOneMember' onsubmit><input type='text' name='id'>"+args.data1[idx].id+"</td><td>"
							+args.data1[idx].nam+"</td><td>"+args.data1[idx].pw+"</td><td>"
							+args.data1[idx].nick+"</td><td>"+args.data1[idx].sort+"</td><td>"
							+args.data1[idx].snum+"</td><td>"+args.data1[idx].phone+"</td><td>"
							+args.data1[idx].tel+"</td><td>"+args.data1[idx].reg+"</td><td>"
							+args.data1[idx].email+"</td><td>"+args.data1[idx].cer+"</td><td>")         
				}
				for(var idx=1; args.data2>=idx; idx++){
					if(args.data2>idx){
						$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>&#124;");
					}else{
						$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>");
					}
				}
				return false;
			}
			,error:function(e){
				alert(e.responseText);
				return false;
			}
		});
	})
	
	function selectPageNum(page){
		var pageNum = page;
		var url="/bisup/admin/allMembers.do";
		$.ajax({
			type:"post"
			,url:url
			,data:pageNum
			,dataType:"json"
			,success:function(args){
				for(var idx=0; idx<args.data.length; idx++){
					$("#allMember").append("<tr><td><input type='text' name='id'>"+args.data1[idx].id+"</td><td>"
							+args.data1[idx].nam+"</td><td>"+args.data1[idx].pw+"</td><td>"
							+args.data1[idx].nick+"</td><td>"+args.data1[idx].sort+"</td><td>"
							+args.data1[idx].snum+"</td><td>"+args.data1[idx].phone+"</td><td>"
							+args.data1[idx].tel+"</td><td>"+args.data1[idx].reg+"</td><td>"
							+args.data1[idx].email+"</td><td>"+args.data1[idx].cer+"</td><td>")         
				}
				for(var idx=1; args.data2>=idx; idx++){
					if(args.data2>idx){
						$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>&#124;");
					}else{
						$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>");
					}
				}
				return false;
			}
			,error:function(e){
				alert(e.responseText);
				return false;
			}
		});
	}
</script>
</head>
<body>
<form:form commandName="command" action="/bisup/admin/selectOneMember.do">
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
</form:form>
</body>
</html>