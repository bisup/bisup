<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html >
<html>
<head> 
<title>카페 트렌드 보고서</title>
<style>
#content {
    clear: both;
    width: 1200px;
    min-height: 400px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
}

#th{
    padding: 12px;
    height: 24px;
    border: 0;
    border-left:  solid #cbcbcb;
    border-bottom: 1px solid #cbcbcb;
    text-align: center;
}

.tb_date{
   
    table-layout: fixed;
    border: 0;
    border-spacing: 0;
    border-top: 3px solid #444;
    background: #fff;
    overflow: hidden;
    
}
a .btn{
    height: 28px;
}
.btn{
    display: inline-block;
    height: 30px;
    padding: 0 16px;
    border: 1px solid #d7d7d7;
    font-weight: bold;
    color: #555 !important;
    font-size: 13px;
    line-height: 28px;
    vertical-align: middle;
    text-decoration: none !important;
    background: #f5f5f5 !important;
    overflow: hidden;
}

</style>

</head>
<body>
	<div id="content">
	<h3 align="left">★카페 창업에 대한 트렌드 소식을 만나십시오★</h3>
	<br><br>
	<form action="bisup/bisup/bisup_trend/business_write.do" method="post">
	<br>
	<c:if test="${sessionScope.sort==0 }">
    <input type="button" class="btn" value="글쓰기" style="float: right;" onclick=document.location="/bisup/bisup_trend/writer.do">
	</c:if>
	<br><br><br>
	<div>
		<table border="1" width="1200" class="tb_date">
			<thead>
			<tr>
				<th id="th" style="border-left: 0" width="75">번호</th>
				<th id="th" width="350">제목</th>
				<th id="th" width="100">작성자</th>
				<th id="th" width="100">작성일</th>
				<th id="th" width="75">바로가기</th>
				
			</tr>
			</thead>
			<tbody>
				<c:forEach var="bis" items="${report}">
					<tr>
						<td id="th" style="border-left: 0">${bis.num}</td>
						<td id="th">${bis.title }</td>
						<td id="th">${bis.nickname }</td>
						<td id="th">${bis.reg}</td>
						<td id="th"><a href="${bis.address }" target="_blank" class="btn">이동</a></td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</form>
	</div>
</body>
</html>