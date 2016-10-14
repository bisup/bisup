<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div align="center">
<fieldset>
<legend>총 부수비용 내역</legend>
<form id="other" method="get" action="salesOtherPro.do">
<table class="table table-striped" style="width:80%">
  <tr>
    <th>월</th>
    <th>월세</th>
    <th>월급</th>
    <th>관리비</th>
    <th>세금</th>
    <th>홍보비</th>
    <th>총부수비용</th>
  </tr>
  <c:forEach var="other" items="${other}" varStatus="status">
  	<tr>
  	<td>${other.mon}월</td> 
    <td>${other.rent}</td>
    <td>${other.sal}</td>
    <td>${other.mcost}</td>
    <td>${other.duty}</td>
    <td>${other.prcost}</td>
    <td>${other.etcco}</td>
  </tr>
  </c:forEach>
 </table>
 </form>
 </fieldset>
 <br/>
 <br/>
 <br/>
 <fieldset>
 <legend>수정하기</legend>
 <form id="other" method="post" action="salesOtherPro.do">
 <input type="hidden" name="id" value="<c:out value="${id}"/>">
 <table class="table table-striped" style="width:80%">
  <tr>
    <th>년</th>
    <th>월</th>
    <th>월세</th>
    <th>월급</th>
    <th>관리비</th>
    <th>세금</th>
    <th>홍보비</th>
  </tr>
  <tr>
 	<td>
	<select id="year" name="year" class="form-control" required>
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
		<c:forEach begin="0" end="15" var="idx2" step="1">
         <option value="<c:out value="${start + idx2}" />"><c:out value="${start + idx2}" /></option>
        </c:forEach>
	</select>
	</td>
	<td>
 	<select name="mon" class="form-control" required>
	<c:forEach begin="1" end="12" var="mon" step="1">
	<c:if test="${mon < 10}"><c:set value="0${mon}" var="mon"/>﻿  
	</c:if>
	<option value="${mon}">${mon}</option>﻿
			 </c:forEach>
	</select>
	</td>	
    <td><input type="text" id="rent" name="rent" class="form-control"></td>
    <td><input type="text" id="sal" name="sal" class="form-control"></td>
    <td><input type="text" id="mcost" name="mcost" class="form-control"></td>
    <td><input type="text" id="duty" name="duty" class="form-control"></td>
    <td><input type="text" id="prcost" name="prcost" class="form-control"></td>
  </tr>
    <tr>
  <td colspan="6"></td>
<td style="text-align:right;"><input type="submit" value="수정하기" class="btn btn-default"></td>
</tr>
 </table>
</form>
</fieldset>
</div>
</body>
</html>