<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
div {
margin-left: 30px;
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
	
	if(! f.sdate.value){ 	
		alert("날짜를 선택해주세요");
		f.sdate.focus();
		return false;
	}
	
	
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

function Check2(){
// 	var f=document.forms[0];
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
<!-- <script> -->
<!-- //  $(document).ready(function(){ -->
<!-- // 	alert("00----"); -->
<!-- // } -->
<%-- // 	var item=${item}; --%>
<!-- // 	if (item != null){ -->
<!-- // 	  alert(item+"은 등록된 메뉴 입니다."); -->
<!-- // 	} -->
<!-- // } -->

<!-- </script> -->
</head>
<body>
<br>
<br>
<div align="center">
<fieldset>
<legend>매출 등록하기</legend>
<form id="sales" method="post" action="salesInserting.do">
<table align="left">
<tr>
<td width="100"><label>날짜 ${sdate}</label></td>
<td><input type="date" name="sdate" class="form-control" width="250"></td></tr>
</table>
<br>
<br>
<br>
<input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
    <th>판매수량</th>
    <td></td>
  </tr>
  <tr>
  <td>
	<select name="item" class="form-control">
	<option value="0">-- 메  뉴 --</option>
	<c:forEach var="menu" items="${menu}" varStatus="status">
	<option value="<c:out value="${menu.item}"/>">
	<c:if test="${result.item == menu.item}">selected="selected"</c:if><c:out value="${menu.item}"/>
			</option>
			 </c:forEach>
	</select>
</td>
    <td><input type="text" id="ea" name="ea" class="form-control"></td>   
	<td><input type="submit" value="등록하기" onclick="return Check();" class="btn btn-default"></td>
  </tr>
</table>
</form>
</fieldset>
<br>
<fieldset>
<legend>총 매출 내역</legend>
<form id="sales" method="get" action="salesInsertingPro.do">
<div align="left"><label>날짜 ${sdate}</label></div>
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
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
 </table>
 </form>
 </fieldset>
 <br>
 <fieldset>
  <legend>등록 수정하기</legend>
 <form name="sales2" method="post" action="salesInsertingPro.do">
 <input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<div align="left"><label>날짜 ${sdate}</label></div>
<table class="table table-striped" style="width:80%">
  <tr>
    <th>메뉴이름</th>
    <th>판매수량</th>
    <td></td>
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
<form id="sales" method="post" action="salesTablePage.do">
 <input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
 <button>이전 매출 등록 확인/수정 하기</button>
</form>
</fieldset>
</div>
 <br/>
</body>
</html>