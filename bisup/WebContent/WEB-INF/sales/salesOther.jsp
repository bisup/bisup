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
<script>
function Check2(){
	var f=document.forms[0];
	
	if(f.year.value=="0"){ 	
		alert("년도를 선택해주세요");
		f.year.focus();
		return false;
	}
	
	if(f.mon.value=="0"){ 	
		alert("월을 선택해주세요");
		f.mon.focus();
		return false;
	}
	
	if(! f.rent.value){ 	
		alert("월세금이 없으시다면 0을 입력해주세요");
		f.rent.focus();
		return false;
	}
	
	if(f.rent.value.length > "5"){
		alert("너무 큰 값을 입력하셨습니다. 기본 값은 '만원' 입니다. \n\n 예)10,000 => 1 입력 \n\n 예)100,000 => 10 입력 ");
		f.rent.focus();
		return false;
	}
	
	if(! f.sal.value){ 	
		alert("월급금이 없으시다면 0을 입력해주세요");
		f.sal.focus();
		return false;
	}
	
	if(f.sal.value.length > "5"){
		alert("너무 큰 값을 입력하셨습니다. 기본 값은 '만원' 입니다. \n\n 예)10,000 => 1 입력 \n\n 예)100,000 => 10 입력 ");
		f.sal.focus();
		return false;
	}
	
	if(! f.mcost.value){ 	
		alert("관리비가 없으시다면 0을 입력해주세요");
		f.mcost.focus();
		return false;
	}
	
	if(f.mcost.value.length > "5"){
		alert("너무 큰 값을 입력하셨습니다. 기본 값은 '만원' 입니다. \n\n 예)10,000 => 1 입력 \n\n 예)100,000 => 10 입력 ");
		f.mcost.focus();
		return false;
	}
	
	if(! f.duty.value){ 	
		alert("세금이 없으시다면 0을 입력해주세요");
		f.duty.focus();
		return false;
	}
	
	if(f.duty.value.length > "5"){
		alert("너무 큰 값을 입력하셨습니다. 기본 값은 '만원' 입니다. \n\n 예)10,000 => 1 입력 \n\n 예)100,000 => 10 입력 ");
		f.duty.focus();
		return false;
	}
	
	if(! f.prcost.value){ 	
		alert("홍보비가 없으시다면 0을 입력해주세요");
		f.prcost.focus();
		return false;
	}	
	
	if(f.prcost.value.length > "5"){
		alert("너무 큰 값을 입력하셨습니다. 기본 값은 '만원' 입니다. \n\n 예)10,000 => 1 입력 \n\n 예)100,000 => 10 입력 ");
		f.prcost.focus();
		return false;
	}
}
</script>
</head>
<body>
<h1>부수 비용 등록</h1>
<br>
<br>
<div align="center">
<fieldset >
<form id="other" method="post" action="salesOther.do">
<input type="hidden" name="id" value="<c:out value="${id}"/>">
<table style="width:80%">
<tr><td><p align="right"><b>(금액 단위 : 만원)</b></p></td></tr>
</table>
<table class="table table-striped" style="width:80%">
  <tr>
  	<th class="success">년</th>
    <th class="success">월</th>
    <th class="success">월세</th>
    <th class="success">월급</th>
    <th class="success">관리비</th>
    <th class="success">세금</th>
    <th class="success">홍보비</th>
  </tr>
 <tr>
 	<td>
	<select id="year" name="year" class="form-control">
		<c:set var="today" value="<%=new java.util.Date()%>" />
		<fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
		<option value="0">--년도--</option>
		<c:forEach begin="0" end="15" var="idx2" step="1">
         <option value="<c:out value="${start + idx2}" />"><c:out value="${start + idx2}" /></option>
        </c:forEach>
	</select>
	</td>
	<td>
 	<select name="mon" class="form-control">
 	<option value="0">--월--</option>
	<c:forEach begin="1" end="12" var="mon" step="1">
	<c:if test="${mon < 10}"><c:set value="0${mon}" var="mon"/>﻿  
	</c:if>
	<option value="${mon}">${mon}</option>﻿
			 </c:forEach>
	</select>
	</td>	
    <td><input type="text" id="rent" name="rent" class="form-control" placeholder="입력 값 없을 시  0 입력"></td>
    <td><input type="text" id="sal" name="sal" class="form-control" placeholder="입력 값 없을 시  0 입력"></td>
    <td><input type="text" id="mcost" name="mcost" class="form-control" placeholder="입력 값 없을 시  0 입력"></td>
    <td><input type="text" id="duty" name="duty" class="form-control" placeholder="입력 값 없을 시  0 입력"></td>
    <td><input type="text" id="prcost" name="prcost" class="form-control" placeholder="입력 값 없을 시  0 입력"></td>
  </tr>
  <tr>
<td colspan="6"></td>
<td style="text-align:right;"><input type="submit" value="등록" onclick="return Check2();" class="btn btn-default"></td>
  </tr>
</table>
</form>
<form id="sales2" style=width:80%; align="right" method="post" action="salesOtherPage.do">
 <input type="hidden" name="id" readonly value="<c:out value="${id}"/>">
<button class="btn btn-primary btn-lg">이전 부수비용 등록 확인/수정 하기</button>
</form>
</fieldset>
</div>
</body>
</html>