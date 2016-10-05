<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<% 
	String cp = request.getContextPath(); //웹컨텐츠앞경로까지 가져오기 (프로젝트명)
	request.setCharacterEncoding("UTF-8");
%>
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
           	 <form:input path="id" class="form-control" readonly="true" value="${member.id}" />
				<%--  <form:errors path="id"/> --%>
			</div> 	            
              <div class="form-group">
              <form:label path="name">이름</form:label>
                    <form:input path="name" class="form-control" value="${member.name}"/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
                   <div class="form-group">
                   <form:label path="pw">비밀번호</form:label>
                   <form:password path="pw" showPassword="false" class="form-control" value="${member.pw}"/>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="pw">비밀번호 확인</form:label>
                   <input type="password" value="${member.pw}" class="form-control">
                  <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="nick">닉네임</form:label>
                    <form:input path="nick" class="form-control" value="${member.nick}"/>
                  <%--  <form:errors path="nick"/> --%>
                  </div>
                   <div class="form-group">
                   <form:label path="email">이메일</form:label>
                    <form:input path="email" class="form-control" value="${member.email}"/>
                    	<!-- 정규식추가 -->
                  <%--  <form:errors path="email"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="pw">연락처</form:label>
                    <form:input path="phone" class="form-control" value="${member.phone}"/>
                  <%--  <form:errors path="phone"/> --%>
                  </div>
                  
                   <c:if test="${member.sort==2}"> 
                  <div class="business" id=bisness>
                  <div class="form-group">
                  <form:label path="snum">사업자번호</form:label>
                    <form:input path="snum" class="form-control" value="${member.snum}"/>
                   <form:errors path="snum"/>
                  </div>
                  <div class="form-group">
                  <form:label path="tel">상호 전화번호</form:label>
                    <form:input path="tel" class="form-control" value="${member.tel}"/>
                     <form:errors path="tel"/>
                  </div> 
                  </div>
                   </c:if> 
                 
                 <c:if test="${member.sort==1}">
                <div class="form-group" id="readyBis">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" id="sort" name="sort" class="changeChk" value="1" onchange="change()">BISUP을 통해 창업에 성공하여 상호 정보를 추가하고 싶습니다. 
                    </label>
                  </div>
                </div>
                </c:if>  
                 <div id="changeBis" style="display:none">
                 <div class="form-group"><form:label path="snum">사업자번호</form:label><form:input path="snum" class="form-control" placeholder="사업자번호를 입력해주세요" required=""/></div>
      			<div class="form-group"><form:label path="tel">상호 전화번호</form:label><form:input path="tel" class="form-control" placeholder="가게전화번호를 입력해주세요"/></div>
                </div>
               
                <script>
               function change(){
                	if($('#sort').is(":checked")){
                		
                		document.getElementById('changeBis').style.display = '';
                		//document.getElementById("changeBis").display = false;
                		 $('#sort').val('2');
                	} 
                	else{
                		document.getElementById('changeBis').style.display = 'none';
                	}
               }
                </script>     		
               
              
                <div class="form-group">
                  <input type="submit" class="btn btn-success btn-block"  value="정보 수정">
                </div>
        
              </form:form>
            
              </div>
              </div>
</body>
</html>