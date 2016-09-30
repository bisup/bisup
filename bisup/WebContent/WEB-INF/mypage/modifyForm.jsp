<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="col-sm-6 mobile-pull">
<h4 style="border-bottom: 1px solid #c5c5c5;">
    <i class="glyphicon glyphicon-user">
    </i>
  회원정보수정
  <br>
  </h4>
  <br>
  <form:form commandName="member" class="signup">
  <!-- 수정완료창뜨고 마이페이지 맨앞으로 -->
           	  <%--  <form:errors element="div"/> --%>
           	  <div class="form-group">
           	  <form:label path="id">본인 ID</form:label>
           	 <form:input path="id" class="form-control" readonly="true" />
				<%--  <form:errors path="id"/> --%>
			</div> 	            
              <div class="form-group">
                    <form:input path="name" class="form-control" placeholder="이름을 입력해주세요"/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
                   <div class="form-group">
                   <form:password path="pw" showPassword="false" class="form-control" placeholder="비밀번호를 입력해주세요"/>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                    <form:password path="pw" showPassword="false" class="form-control" placeholder="비밀번호를 다시 한번 입력해주세요"/>
                  <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                    <form:input path="nick" class="form-control" placeholder="닉네임을 입력해주세요"/>
                  <%--  <form:errors path="nick"/> --%>
                  </div>
                   <div class="form-group">
                    <form:input path="email" class="form-control" placeholder="이메일을 입력해주세요"/>
                    	<!-- 정규식추가 -->
                  <%--  <form:errors path="email"/> --%>
                  </div>
                  <div class="form-group">
                    <form:input path="phone" class="form-control" placeholder="연락처를 입력해주세요"/>
                  <%--  <form:errors path="phone"/> --%>
                  </div>
                   <!--  <c:if 자영업자라면> -->
                  <div class="business">
                  <div class="form-group">
                    <form:input path="snum" class="form-control" placeholder="사업자번호를 입력해주세요"/>
                  <%--  <form:errors path="snum"/> --%>
                  </div>
                  <div class="form-group">
                    <form:input path="tel" class="form-control" placeholder="카페 연락처를 입력해주세요"/>
                    <%--  <form:errors path="tel"/> --%>
                  </div>
                  </div>
                 <!--  </c:if> -->
                <div class="form-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <input type="submit" class="btn btn-success btn-block"  value="정보 수정">
                </div>
              </form:form>
              </div>
              </div>
</body>
</html>