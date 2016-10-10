<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
margin-left: 50px;
/* margin-top: 20px; */
/* margin-bottom: 50px; */
}

table {
    border-spacing: 15px;
    cells-pacing: 15px;
}

td, th{
text-align: center;
}

h1{margin-left:50px;}

tr{padding:15px;}

</style>

</head>
<body>
<h1>매출 등록</h1>
<br>
<br>
<div align="center">
<form:form id="saleList" method="post"  modelAttribute="saleCommand">
<%-- <form:form id="saleList" method="post"> --%>
<div align="left"><label>날짜입력</label> <input type="date" name="sdate"></div>

<fieldset >
<!-- <table style="width:80%">   -->
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
    <th>가격</th>
    <th>판매수량</th>
  </tr>

  <c:forEach var="menu" items="${menu}" varStatus="status">

  <tr>
    <td><input type="text" name="item" readonly value="${menu.item}"></td>
    <td><input type="text" name="price" readonly value="${menu.price}"></td>
    <td><input type="text" name="ea"></td>   
  </tr></c:forEach>

<%--위에서 지정하는 Attribute를 출력하기 --%>
  <tr>
<td colspan="2"></td>
<td style="text-align:right;"><input type="submit" value="등록" ></td>
  </tr>
</table>
</fieldset>
</form:form>
</div>
</body>
</html>