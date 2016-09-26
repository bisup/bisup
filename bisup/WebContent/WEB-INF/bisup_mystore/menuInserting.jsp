<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<h3>메뉴등록</h3><br/><br/>
<table>
	<tr>
		<td>번호</td><td>메뉴이름</td><td>가격</td>
	</tr>
	<c:forEach items="menuList" varStatus="status">
		<tr>
			<td>${status }</td><td>${menuList.item }</td><td>${menuList.price }</td>
		</tr>
	</c:forEach>
</table>
<form:form commandName="search" method="POST">
<form:radiobuttons path="searchn"/><form:input path="searchkeyword"/>
</form:form>
</body>
</html>