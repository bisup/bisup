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
$(document).ready(function(){
	 alert("${year}${mon} 은/는 이미 등록된 날짜 입니다.");
});
</script>
<script>
function Check(){
// 	var f=document.forms[0];
	var f=document.others;
	if(f.sdate.value=="0"){ 	
		alert("년월을 선택해주세요");
		f.sdate.focus();
		return false;
	}
	
	if(! f.rent.value){ 	
		alert("월세금이 없으시다면 0을 입력해주세요");
		f.rent.focus();
		return false;
	}
	if(isNaN(f.rent.value)){
		alert("숫자로 입력해주세요");
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
	if(isNaN(f.sal.value)){
		alert("숫자로 입력해주세요");
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
	if(isNaN(f.mcost.value)){
		alert("숫자로 입력해주세요");
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
	if(isNaN(f.duty.value)){
		alert("숫자로 입력해주세요");
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
	
	if(isNaN(f.prcost.value)){
		alert("숫자로 입력해주세요");
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

<div align="center">

<fieldset>

<legend><h2>총 부수비용 내역</h2></legend>

<form id="other" method="get" action="salesOtherPro.do">

<table style="width:80%">

<tr><td><p align="right"><b>(금액 단위 : 만원)</b></p></td></tr>

</table>

<table class="table table-striped" style="width:90%">

  <tr>

    <th class="info">년월</th>

    <th class="info">월세</th>

    <th class="info">월급</th>

    <th class="info">관리비</th>

    <th class="info">세금</th>

    <th class="info">홍보비</th>

    <th class="info">총부수비용</th>

  </tr>

  <c:forEach var="other" items="${other}" varStatus="status">

  	<tr>

  	<td>${other.sdate}</td> 

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

 <legend><h2>수정하기</h2></legend>

<form name="others" id="others" method="post" action="salesOtherPro.do">

<input type="hidden" name="id" value="<c:out value="${id}"/>">

<table style="width:80%">

<tr><td><p align="right"><b>(금액 단위 : 만원)</b></p></td></tr>

</table>

<table class="table table-striped" style="width:90%">

  <tr>
  
    <th class="success">년월</th>

    <th class="success">월세</th>

    <th class="success">월급</th>

    <th class="success">관리비</th>

    <th class="success">세금</th>

    <th class="success">홍보비</th>

  </tr>
  <tr>
  <td>
	<select name="sdate" class="form-control">
	<option value="0">년 월</option>
	<c:forEach var="yearmon" items="${yearmon}" varStatus="status">
	<option value="<c:out value="${yearmon.sdate}"/>">
	<c:if test="${result.sdate == yearmon.sdate}">selected="selected"</c:if><c:out value="${yearmon.sdate}"/>
			</option>
			 </c:forEach>
	</select>
</td>
    <td><input type="text" id="rent" name="rent" class="form-control" placeholder="입력 값이 없을 시  0 입력"></td>

    <td><input type="text" id="sal" name="sal" class="form-control" placeholder="입력 값이 없을 시  0 입력"></td>

    <td><input type="text" id="mcost" name="mcost" class="form-control" placeholder="입력 값이 없을 시  0 입력"></td>

    <td><input type="text" id="duty" name="duty" class="form-control" placeholder="입력 값이 없을 시  0 입력"></td>

    <td><input type="text" id="prcost" name="prcost" class="form-control" placeholder="입력 값이 없을 시  0 입력"></td>

  </tr>

  <tr>

<td colspan="6"></td>

<td style="text-align:right;"><input type="submit" value="수정" onclick="return Check();" class="btn btn-default"></td>

  </tr>

</table>

</form>

</fieldset>

</div>

</body>

</html>