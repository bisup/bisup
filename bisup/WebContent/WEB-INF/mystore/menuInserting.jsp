<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>Insert title here</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js">
$(document).ready(function(){
	location.href="/bisup/menuMain.do";
});
</script>
<script>
function menuClick(param){
	var param=param;
	var obj = {id:'${id}',item:param};
	var url="selectOneMenu.do";
	$.ajax({
		type:"post"
		,url:url
		,data:obj
		,dataType:"json"
		,success:function(args){
			$("#oneMenuPrint").append("<table><tr><td></td><td>변경전</td><td>변경후</td></tr><tr><td>메뉴이름</td><td>"+
				args.data[0]+"</td><td>변경후</td>	</tr><tr><td>가격</td><td>"+
				args.data[1]+"</td><td>변경후</td><td><input type='button' value='변경/수정'></td></tr></table>");
		}
		,errors:function(e){
			alert(e.responseText);
		}
	});
}
function insertOrUpdate(param){
	var item=$("#item").val();
	var price=$("#price").val();
	var url="/mystore/menuMain.do";
	var params="item="+item+"&price=";
	$.ajax({
		type:"post"
		,url:url
		,data:params
		,dataType:"json"
		,success:function(args){
			$("#oneMenuPrint").append("<table><tr><td></td><td>변경전</td><td>변경후</td></tr><tr><td>메뉴이름</td><td>"+
				args.data[0]+"</td><td>변경후</td>	</tr><tr><td>가격</td><td>"+
				args.data[1]+"</td><td>변경후</td><td><input type='button' value='변경/수정'></td></tr></table>")
		}
	});
}
</script>
</head>  
<body>
<h2>메뉴등록</h2>
<table border="1">
	<tr>
		<td>No.</td><td>메뉴이름</td><td>가격</td>
	</tr>
	<c:forEach items="${menuList }" varStatus="status" var="menuList">
		<tr>
			<td>${status.count }</td>
			<td>
				<a href="#" onclick="javascript:menuClick(${menuList.item})">
				<input type="hidden" value="${menuList.item }" name="item" id="item">${menuList.item }</a>
			</td>
			<td>${menuList.price }</td>
		</tr>
	</c:forEach>
	
</table>

<form:form commandName="searchMenu" action="menuMain/selectOneMenu.do" method="post">
	<input type="radio" value="item" name="searchtype" id="item">메뉴이름
	<input type="radio" value="price" name="searchtype" id="price">가격 :
	 <input type="text" name="searchkeyword"> :
	  <input type="submit" onclick="search()" value="검색">
</form:form>

<hr style="border: dashed">
<div id="oneMenuPrint">
</div>

</body>
</html>