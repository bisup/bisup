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
<h1>매출 등록</h1>
<br>
<br>
<div align="center">
<form id="sales" method="post" action="salesInserting.do">
<div align="left"><label>날짜입력</label> <input type="date" name="sdate"></div>
<input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<fieldset >
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
    <th>판매수량</th>
  </tr>
  <tr>
  <td>
	<select name="item" class="form-control" required>
	<c:forEach var="menu" items="${menu}" varStatus="status">
	<option value="<c:out value="${menu.item}"/>">
	<c:if test="${result.item == menu.item}">selected="selected"</c:if><c:out value="${menu.item}"/>
			</option>
			 </c:forEach>
	</select>
</td>
    <td><input type="text" id="ea" name="ea" class="form-control" required></td>   
  </tr>

  <tr>
<td></td>
<td style="text-align:right;"><input type="submit" value="등록" class="btn btn-default"></td>
  </tr>

</table>
</fieldset>
</form>
</div>
</body>
</html>