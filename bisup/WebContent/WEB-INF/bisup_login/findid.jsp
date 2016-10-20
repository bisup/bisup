<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 /비번 찾기</title>
<script type="text/javascript">
		function search(){
			
			if((searchId.name.value !=null)&&(searchId.email.value!=null)){
				return true;
			}else if(searchId.name.value == null) {
				alert("이름을 입력하세요.");
				return false;
			}else if(searchId.email.value == null) {
				alert("이메일주소를 입력하세요.");
				return false;
			}
		
		}function showMsg(m){
			
			if(m==0){
				
			}else if(m==1){
				alert("입력하신 정보가 등록하신 정보와 다릅니다.");
				window.open("searchpw.do","_self", "" );
			}
		}function login(){
			window.open("main.do","_self","");
		}
	
	</script>
	
 <link rel="stylesheet" href="/bisup/css/styles.css" />
</head>
<body onload="showMsg(${msg})">
    
<div class="tab-content">
<form:form class="form-signin" commandName="member" name="searchId"><!--커멘드 객체로 보냄  -->
		<h1 class="form-signin-heading text-muted">아이디 /패스워드 찾기</h1>
	   <span class="input-group-addon">
          </span>
          <input class="form-control" placeholder="Email" name="email" type="email" required=""/>
		 <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요"required=""/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
		<br>	
		<div style="width: 280px;  " align="center"><button class="btn btn-lg btn-primary2 btn-block" type="submit" style="width:60px; height:40px; color:white;  "  onclick="return search()">
			확인
		</button></div><br>
		<p align="center">이 페이지를 닫으려면 <a href="javascript:self.close()">닫기</a>를 클릭하세요.</p>
	</form:form>
</div>
</html>