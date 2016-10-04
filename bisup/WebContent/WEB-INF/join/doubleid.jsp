<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>아이디 중복</title>
<script type="text/javascript">
		function search(){
			if((idform.id.value!=null)){
				idform.submit();
			}else if(idform.id.value==null) {
				alert("아이디를 입력하세요.")
			}
		
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
<body">
    
<div class="tab-content">
<form:form class="form-signin" commandName="member" name="idform"><!--커멘드 객체로 보냄  -->
		<h1 class="form-signin-heading text-muted">아이디중복 찾기</h1>
          <form:input class="form-control" path="아이디를 입력해주세요" placeholder="id" name="id"  required=""/>
		<br>	
		<button class="btn btn-lg btn-primary2 btn-block" type="submit" onclick="search()">
			중복체크
		</button><br>
		<p align="center">이페이지를 닫으려면 <a href="javascript:self.close()">닫기</a>를 클릭하세요.</p>
	</form:form>
</div>
 </div>
 </div>
 </div>
</html>