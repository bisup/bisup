<%@ page  contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<title>아이디 체크</title>
<script type="text/javascript">
if(${mav.x == 1}){
	alert("아이디중복");
}else
	alert("아이디사용가능");
</script>
</head>
</body>
</html>

<%-- <script type="text/javascript">
	</script>

</head>
<body>
<form:form class="form-signin"  name="idsearch"><!--커멘드 객체로 보냄  -->
		<h1 class="form-signin-heading text-muted">아이디 /패스워드 찾기</h1>
	  	<label>아이디</label><br>
	   <form:input path="id"/>
	   <input type="submit" value="중목확인">
          </form:form>
           --%>
<%-- <c:if test="${x == 1}">
"중복아이디 입니다"
</c:if> --%>
