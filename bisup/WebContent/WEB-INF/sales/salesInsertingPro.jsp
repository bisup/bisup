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
<br>
<br>
<div align="center">
<fieldset>

<legend>총 매출 내역</legend>
<form id="sales" method="get" action="salesInserting.do">
<input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<div align="left"><label>날짜 ${sdate}</label></div>
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
<!--     <th>가격</th> -->
    <th>판매수량</th>
    <th>총매출</th>
  </tr>
  <c:forEach var="sale" items="${sale}" varStatus="status">
  <tr>
    <td>${sale.item}</td>
    <td>${sale.ea}</td>
    <td>${sale.total}</td>
  </tr>
   </c:forEach>
    <tr>
<td colspan="2"></td>
<td style="text-align:right;"><input type="submit" value="추가등록"></td>
 </table>
 </form>
 </fieldset>
 <br/>
 <br/>
 <br/>
 <fieldset>
  <legend>수정하기</legend>
 <form id="sales" method="post" action="salesInsertingPro.do">
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
    <th>판매수량</th>
    <th></th>
  </tr>
  <tr>
  <td align="center"> 
	<select name="item">
	<c:forEach var="menu" items="${menu}" varStatus="status">
	<option value="<c:out value="${menu.item}"/>">
	<c:if test="${result.item == menu.item}">selected="selected"</c:if><c:out value="${menu.item}"/>
			</option>
			 </c:forEach>
	</select>
</td>
    <td><input type="text" id="ea" name="ea"></td>
    <td><input type="submit" value="수정하기" ></td>   
  </tr>
</table>


</form>
</fieldset>
</div>
</body>
</html>