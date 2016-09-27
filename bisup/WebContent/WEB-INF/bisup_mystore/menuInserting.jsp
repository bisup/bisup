<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<title>Insert title here</title>
<script>
$(function(){
	location.href="/mystore/menuMain.do";
});
function menuClick(){
	document
}
function search(){
	
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
				<a href="/mystore/menuMain/selectOneMenu.do">
				<input type="hidden" value="${menuList.item }" name="${menuList.item }">${menuList.item }</a>
			</td>
			<td>${menuList.price }</td>
		</tr>
	</c:forEach>
	
</table>

<form:form commandName="searchMenu" action="menuMain/selectOneMenu.do" method="post">
	<input type="radio" value="searchtype">메뉴이름<input type="radio" value="searchtype">가격 :
	 <input type="text" name="searchkeyword"> :
	  <input type="submit" onclick="search" value="검색">
</form:form>

<hr style="border: dashed">

<table id="selectedMenu" border="1">
	<tr>
		<td></td><td>변경전</td><td>변경후</td>
	</tr>
	<tr>
		<td>메뉴이름</td><td>변경전</td><td>변경후</td>
	</tr>
	<tr>
		<td>가격</td><td>변경전</td><td>변경후</td><td><input type="button" value="변경/수정"></td>
	</tr>
</table>
</body>
</html>