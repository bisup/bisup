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
<script>
function Check(){
	var f=document.forms[0];
	
	if(f.sdate.value=="0"){ 	
		alert("날짜를 선택해주세요");
		f.sdate.focus();
		return false;
	}
}

function Check2(){
	var f=document.sales2;
	
	if(f.item.value=="0"){ 	
		alert("메뉴를 선택해주세요");
		f.item.focus();
		return false;
	}
	
	if(! f.ea.value){ 	
		alert("수량을 입력해주세요");
		f.ea.focus();
		return false;
	}
}
</script>
</head>
<body>
<br>
<br>
<div align="center">
<fieldset>
<legend><h2>매출 내역 확인 및 수정</h2></legend>
<form id="sales" method="post" action="salesTable.do">
<div align="left">
<table>
  <tr>
  <td>날짜 선택</td>
    <td>
	<select name="sdate" class="form-control" required>
	 	<option value="0">-- 날 짜  --</option>
	<c:forEach var="sale" items="${sale}" varStatus="status">
	<option value="<c:out value="${sale.sdate}"/>">
	<c:if test="${result.sdate == sale.sdate}">selected="selected"</c:if><c:out value="${sale.sdate}"/>
			</option>
			 </c:forEach>
	</select>
	</td>
	<td><input type="submit" value="선택" onclick="return Check();" class="btn btn-default"></td>
	</tr>
</table>
</form>
</fieldset>
</br>
<fieldset>
<legend><h2>총 매출 내역</h2></legend>
<form id="sales" method="get" action="salesTablePro.do">
<div align="left"><label>날짜 ${sdate}</label></div>
<table class="table table-striped" style="width:80%">
  <tr>
    <th class="danger">메뉴이름</th>
    <th class="danger">판매수량</th>
    <th class="danger">총매출</th>
  </tr>
  <c:forEach var="sales" items="${sales}" varStatus="status">
  <tr>
    <td>${sales.item}</td>
    <td>${sales.ea}</td>
    <td>${sales.total}</td>
  </tr>
   </c:forEach>
 </table>
 </form>
 </fieldset>
 </br>
 <fieldset>
  <legend><h2>등록 수정하기</h2></legend>
 <form name="sales2" method="post" action="salesTablePro.do">
 <input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<div align="left"><label>날짜 ${sdate}</label></div>
<table class="table table-striped" style="width:80%">
  <tr>
    <th class="info">메뉴이름</th>
    <th class="info">판매수량</th>
    <td class="info"></td>
  </tr>
   <tr>
  <td>
	<select name="item" class="form-control">
	<option value="0">-- 메  뉴 --</option>
	<c:forEach var="menu2" items="${menu2}" varStatus="status">
	<option value="<c:out value="${menu2.item}"/>">
	<c:if test="${result.item == menu2.item}">selected="selected"</c:if><c:out value="${menu2.item}"/>
			</option>
			 </c:forEach>
	</select>
</td>
    <td><input type="text" id="ea" name="ea" class="form-control"></td>
    <td><input type="submit" value="수정하기" onclick="return Check2();" class="btn btn-default"></td>   
  </tr>
</table>
</form>
</fieldset>
 <br/>
</div>
</body>
</html>