<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<style>
.table_condensed{
width:500px;
}
#table{
width: 600px;
padding-top: 100px;
position: relative;
}
#menuList{
width: 600px;
padding-top: 50px;
padding-bottom: 50px;
position: relative;
}
</style>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
function menuClick(param){
	deleteTarget();
	var obj = {id:'${id}',item:param};
	var url="/bisup/mystore/selectOneMenu.do";
	$.ajax({
		type:"post"
		,url:url
		,data:obj
		,dataType:"json"
		,success:function(args){
			$("#oneMenuPrint").append("<table id='table' class='table'><tr><td></td><td>변경전</td><td>변경후</td></tr><tr><td>메뉴이름</td><td>"+
				"<input id='printedItem' disabled='disabled' value='"+args.data.item+"'>"+
				"</div></td><td><input type='text' id='selecteditem'></td></tr><tr><td>가격</td><td>"+
				"<input disabled='disabled' value='"+args.data.price+"'></td><td><input type='text' id='selectedprice'></td></tr></table>");
			$("#table").append("<div align=center><input type='button' id='button1' onclick='insertOrUpdate()' value='입력/수정'>"+
			"&nbsp;&nbsp;&nbsp;<input type='button' id='button2' onclick='deleteMenu()' value='삭제'></div>");
		}
		,errors:function(e){
			alert(e.responseText);
		}
	});
}
function insertOrUpdate(){
	var url="/bisup/mystore/menuInsertOrUpdate.do";
	var params={id:'${id}',item:$("#selecteditem").val(),price:$("#selectedprice").val()};
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			alert(args.result);
			location.href="/bisup/mystore/menuMain.do?id=java";
		}
		,errors:function(args,request,status,error){
			 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function deleteMenu(){
	var url="/bisup/mystore/deleteMenu.do";
	var params={id:'${id}',item:$("#printedItem").val()};
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			alert(args.result);
			location.href="/bisup/mystore/menuMain.do?id=java";
		}
		,errors:function(args,request,status,error){
			 alert(args.result+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
function deleteTarget(){
	var target = $("#target").val();
	if(target!=null){
		$("#table").remove();
		$("#button").remove();
	}
}
</script>
</head>  
<body>
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">메뉴등록</h2>
  	<p style="display: block;">메뉴명을 클릭하신 뒤 가격만 변경하시면 메뉴의 가격이 변경되고, 메뉴명을 바꾸시면 새로운 메뉴로 등록됩니다.</p>
<div align="center"><h3>메뉴목록</h3><hr width="400px"/></div>
<div id="container" align="center">
<div id="menuList" align="center">
<table class="table table-condensed">
	<thead><tr>
		<td>No.</td><td>메뉴이름</td><td>가격</td>
	</tr></thead>
	<tbody>
	<c:forEach items="${menuList }" varStatus="status" var="menuList">
		<tr>
			<td>${status.count }</td>
			<td>
				<a href="javascript:void(0);" onclick="javascript:menuClick('${menuList.item}')">
				<input type="hidden" value="${menuList.item }" name="item" id="item">${menuList.item }</a>
			</td>
			<td>${menuList.price }</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<hr style="border: dashed">
<div id="target" align='center'><div id="oneMenuPrint" align="center"/><h3>선택하신 메뉴</h3><hr width="400px"/></div>
</div>
</body>
</html>