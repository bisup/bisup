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
			if((pwsearch.name.value!=null)&&(pwsearch.email.value!=null)){
				pwsearch.submit();
			}else if(pwsearch.name.value==null) {
				alert("이름을 입력하세요.")
			}else if(pwsearch.email.value==null) {
				alert("이메일주소를 입력하세요.")
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
	<style>
/* .login-signup {
  padding: 0 0 25px;
} */

.btn-success {
  background: #23bab5;
  border-radius:0;
  border: 2px solid #23bab5;
  webkit-transition: all 400ms cubic-bezier(.4,0,.2,1);
  transition: all 400ms cubic-bezier(.4,0,.2,1);
}

 .btn-success:hover,.btn-success:focus {
  background: rgba(26, 161, 157, 0);
  border: 2px solid #1aa19d;
  webkit-transition: all 400ms cubic-bezier(.4,0,.2,1);
  transition: all 400ms cubic-bezier(.4,0,.2,1);
  color: #23BAB5;
} 

a {
  color: #23bab5;
}

ul {
  list-style-type: none;
}

article[role="login"] {
  background: #fff;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 10px rgba(0, 0, 0, 0.24);
  webkit-transition: all 400ms cubic-bezier(0.4, 0, 0.2, 1);
  transition: all 400ms cubic-bezier(0.4, 0, 0.2, 1);
  padding: 30px 50px;
  margin-bottom: 20px;
}

article[role="login"] input[type="submit"] {
  padding: 10px 15px;
  font-size: 16px;
}

/* article[role="login"]:hover {
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
  -webkit-box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 1px 15px rgba(0, 0, 0, 0.23);
  webkit-transition: all 400ms cubic-bezier(0.4, 0, 0.2, 1);
  transition: all 400ms cubic-bezier(0.4, 0, 0.2, 1);
} */

article[role="login"] h3 {
  font-size: 26px;
  font-weight: 300;
  color: #23bab5;
  margin-bottom: 20px;
}

article[role="login"] p {
  font-size: 16px;
  padding: 5px 15px;
}

.nav-tab-holder {
  padding: 0 0 0 30px;
  float: right;
}

.nav-tab-holder .nav-tabs {
  border: 0;
  float: none;
  display: table;
  table-layout: fixed;
  width: 100%;
}

.nav-tab-holder .nav-tabs > li {
  margin-bottom: -3px;
  text-align: center;
  padding: 0;
  display: table-cell;
  float: none;
  padding: 0;
}

.nav-tab-holder .nav-tabs > li > a {
  background: #d9d9d9;
  color: #6c6c6c;
  margin: 0;
  font-size: 18px;
  font-weight: 300;
}

.nav-tab-holder .nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {
  color: #FFF;
  background-color: #23bab5;
  border: 0;
  border-radius: 0;
}

.mobile-pull {
  float: right;
}
#tab-content{
	align:middle;
}

</style>
</head>
<body onload="showMsg(${msg})">
    
<div class="tab-content">
<form:form class="form-signin" commandName="member" name="pwsearch"><!--커멘드 객체로 보냄  -->
		<h1 class="form-signin-heading text-muted">아이디 /패스워드 찾기</h1>
	   <span class="input-group-addon">
            @
          </span>
          <input class="form-control" placeholder="Email" name="email" type="email" required=""/>
		 <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요"required=""/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
		<br>	
		<button class="btn btn-lg btn-primary2 btn-block" type="submit" onclick="search()">
			아이디 비번 찾기
		</button><br>
		<p align="center">이페이지를 닫으려면 <a href="javascript:self.close()">닫기</a>를 클릭하세요.</p>
	</form:form>
</div>
</html>