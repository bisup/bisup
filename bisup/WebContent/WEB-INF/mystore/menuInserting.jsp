<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
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
			$("#oneMenuPrint").append("<table id='table'><tr><td></td><td>변경전</td><td>변경후</td></tr><tr><td>메뉴이름</td><td>"+
				args.data.item+"</td><td><input type='text' name='item'></td></tr><tr><td>가격</td><td>"+
				args.data.price+"</td><td><input type='text' name='price'></td></tr></table>");
			$("#table").append("<input type='button' id='button' onclick='insertOrUpdate()' value='수정/삭제'>");
		}
		,errors:function(e){
			alert(e.responseText);
		}
	});
}
function insertOrUpdate(){
	var item=$("#item").val();
	var price=$("#price").val();
	var url="/bisup/mystore/menuInsertOrUpdate.do";
	var params={id:'${id}',item:'${item}',price:'${price}'};
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			alert(args.data);
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
<div id="container">
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">메뉴등록</h2>
  	<p style="display: block;">메뉴명을 클릭하신 뒤 가격만 변경하시면 메뉴의 가격이 변경되고, 메뉴명을 바꾸시면 새로운 메뉴로 등록됩니다.</p>
<h2>메뉴등록</h2>
<table class="table table-list-search">
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

<form:form commandName="searchMenu" action="menuMain/selectOneMenu.do" method="post">
	<input type="radio" value="item" name="searchtype" id="item">메뉴이름
	<input type="radio" value="price" name="searchtype" id="price">가격 :
	 <input type="text" name="searchkeyword"> :
	  <input type="submit" onclick="search()" value="검색">
</form:form>

<hr style="border: dashed">
<div id="target"><div id="oneMenuPrint"/>선택하신 메뉴</div>
</div>
</body>
</html>