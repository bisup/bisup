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

<legend><h1>순수익 내역 </h1></legend>

<form id="total" method="get">

<input type="hidden" name="id" readonly value="<c:out value="${id}"/>">

<table class="table table-striped" style="width:80%">

  <tr>

    <th>년월</th>

    <th>총매출</th>

    <th>부수비용</th>

    <th>순수익</th>

  </tr>

  <c:forEach items="${sale}" varStatus="s">

  <c:set var="sale" value="${requestScope.sale[s.count - 1]}"/>

  <c:set var="other" value="${requestScope.other[s.count - 1]}"/>

  <c:set var="sum" value="${sale.tot-other.etcco}"/>

  <tr>

    <td>${other.sdate}</td>

    <td>${sale.tot}</td>

    <td>${other.etcco}</td>

    <td>${sum}</td>

  </tr>

   </c:forEach>

 </table>

 </form>

 </fieldset>

</div>

</body>

</html>