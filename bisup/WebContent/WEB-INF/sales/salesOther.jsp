<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
margin-left: 50px;
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
<h1>부수 비용 등록</h1>
<br>
<br>
<div align="center">
<form id="sales" method="post" action="salesOther.do">
<input type="hidden" name="id" value="<c:out value="${id}"/>">
<fieldset >
<table class="table table-striped" style="width:80%">
  <tr>
    <th>월</th>
    <th>월세</th>
    <th>월급</th>
    <th>관리비</th>
    <th>세금</th>
    <th>홍보비</th>
  </tr>
  <tr>
 	  <td align="center"> 
 	  
 	<select name="mon">
	<c:forEach begin="1" end="12" var="mon" step="1">
	<c:if test="${mon < 10}"><c:set value="0${mon}" var="mon"/>﻿  
	</c:if>
	<option value="${mon}">${mon}</option>﻿
			 </c:forEach>
	</select>
</td> 
    <td><input type="text" id="rent" name="rent"></td>
    <td><input type="text" id="sal" name="sal"></td>
    <td><input type="text" id="mcost" name="mcost"></td>
    <td><input type="text" id="duty" name="duty"></td>
    <td><input type="text" id="prcost" name="prcost"></td>
  </tr>
  <tr>
<td colspan="5"></td>
<td style="text-align:right;"><input type="submit" value="등록" ></td>
  </tr>
</table>
</fieldset>
</form>
</div>
</body>
</html>