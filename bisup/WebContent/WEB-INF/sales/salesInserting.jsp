<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
div {
margin-left: 50px;
margin-top: 20px;
margin-bottom: 50px;
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
<form method="post">
<div align="left"><label>날짜입력</label> <input type="date" name="sdate"></div>
<img alt="line" src="/bisup/resource/line.png">
<fieldset >
<table style="width:80%">  
  <tr>
    <th>메뉴이름</th>
    <th>가격</th>
    <th>판매수량</th>
    <th>합계</th>
  </tr>
  
  <tr>
<td colspan="3" style="border-bottom:1px solid black"><br></td>
  </tr>
  <c:forEach begin="0" end="9" step="1">
  <tr>
    <td><input type="text" name="item" readonly value="${s.item}"></td>
    <td><input type="text" name="price" readonly value="${s.price}"></td>
    <td><input type="text" name="ea"></td>
    <td><input type="text" name="total"></td>
  </tr>
  </c:forEach>
  <tr>
<td colspan="3" style="border-bottom:1px solid black"></td>
  </tr>
  <tr>
    <td><b>총매출</b><td>
    <td><b>원</b></td>
  </tr>
  <tr>
<td colspan="2"></td>
<td style="text-align:right;"><input type="submit" value="등록" ></td>
  </tr>
</table>
</fieldset>
</form>
</div>
</body>
</html>