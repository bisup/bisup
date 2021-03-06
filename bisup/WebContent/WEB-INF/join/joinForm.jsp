<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


/* @media only screen and (max-width: 767px) {
  .mobile-pull {
    float: none;
  }

  .nav-tab-holder {
    float: none;
    overflow: hidden;
  }

  .nav-tabs > li > a {
    font-size: 13px;
    font-weight: 600;
    padding: 10px 5px;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .nav-tabs > li {
    width: 50%;
  }
} */
</style>
<title>Insert title here</title>
<script type="text/javascript">

$(function(){
	$('#id').blur(function(){
		$.ajax({
			type:"POST",
			url:"checkId.do",
			data:{
				"id":$('#id').val()
			},
			dataType:"json",
			success:function(data){
				//var b=Number(1);
				//var i=parseInt(args.x);
			/* 	args.x.typeofValue */
				if(data.x == 1){
					alert("아이디 중복입니다.");
					$('#id').val('');	
				}else if(data.x == -1){
					alert("아이디 입력하세요.");
				}else{
					alert("아이디사용가능합니다.");			
					}
			}
		});
	});

});
$(function(){
	$('#id1').blur(function(){
		$.ajax({
			type:"POST",
			url:"checkId.do",
			data:{
				"id":$('#id1').val()
			},
			dataType:"json",
			success:function(data){
				//var b=Number(1);
				//var i=parseInt(args.x);
			/* 	args.x.typeofValue */
				if(data.x == 1){
					alert("아이디 중복입니다.");
					$('#id').val('');	
				}else if(data.x == -1){
					alert("아이디 입력하세요.");
					
				}else{
					alert("아이디사용가능합니다.");			
					}
			}
		});
	});
});

</script>
<script type="text/javascript">
function passwordCheck() {
    var pw = document.getElementById("pw").value;
    var pw_c = document.getElementById("pw_c").value;
    
    // 재입력 일치 여부
    if (pw != pw_c) {
        alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
        myform.pw1.empty();
        myform.pw1.focus();
        return false;
    }
}
function pass(){
	  var pw = document.getElementById("pw").value;
    // 길이
    if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{6,15}$/.test(pw))
    { 
        alert("비밀번호는 숫자, 영문, 특수문자 조합으로 6~15자리를 사용해야 합니다."); 
        myform.pw.empty();
        myform.pw.focus();
	   	return ;
    }
}

$(function(){
	 var nick = document.getElementById("nick").value;
	 $('#nick').blur(function nickHH(){
	  $.ajax({
			type:'get',
			url:'checkn.do',
			data:{
				"nick":$('#nick').val()
			},
			dataType:"json",
			success:function(data){
				//var b=Number(1);
				//var i=parseInt(args.x);
			/* 	args.x.typeofValue */
				if(data.n > 0){
					alert("닉네임 중복입니다.");
					$('#nick').val('');	
				}else if(data.n == -1){
					alert("닉네임 입력하세요.");
					
				}else{
					alert("닉네임사용가능합니다.");			
					}
			}
		});
	 });
	 $('#nick1').blur(function nickHH(){
		  $.ajax({
				type:'get',
				url:'checkn.do',
				data:{
					"nick":$('#nick1').val()
				},
				dataType:"json",
				success:function(data){
					//var b=Number(1);
					//var i=parseInt(args.x);
				/* 	args.x.typeofValue */
					if(data.n > 0){
						alert("닉네임 중복입니다.");
						$('#nick1').val('');	
					}else if(data.n == -1){
						alert("닉네임 입력하세요.");
						
					}else{
						alert("닉네임사용가능합니다.");			
						}
				}
			});
		 });
	 $('#snum').blur(function snum(){
		  $.ajax({
				type:'get',
				url:'checksn.do',
				data:{
					"snum":$('#snum').val()
				},
				dataType:"json",
				success:function(data){
					//var b=Number(1);
					//var i=parseInt(args.x);
				/* 	args.x.typeofValue */
					if(data.mc > 0 ){
						alert("사업자번호 중복입니다.");
						$('#snum').val('');	
					}else if(data.mc == -1){
						alert("사업자번호를 입력하세요.");
						
					}else{
						alert("사업자번호 사용가능합니다.");			
						}
				}
			});
		 });
	 $('#email').blur(function emails(){
		  $.ajax({
				type:'get',
				url:'checke.do',
				data:{
					"email":$('#email').val()
				},
				dataType:"json",
				success:function(data){
					//var b=Number(1);
					//var i=parseInt(args.x);
				/* 	args.x.typeofValue */
					if(data.mc > 0 ){
						alert("이메일 중복입니다.");
						$('#email').val('');	
					}else if(data.mc ==-1){
						alert("이메일을 입력하세요.");
					}else{
						alert("사용가능합니다.");			
						}
				}
			});
		 }); 
$('#email1').blur(function emails(){
	  $.ajax({
			type:'get',
			url:'checke.do',
			data:{
				"email":$('#email1').val()
			},
			dataType:"json",
			success:function(data){
				//var b=Number(1);
				//var i=parseInt(args.x);
			/* 	args.x.typeofValue */
				if(data.mc > 0 ){
					alert("이메일 중복입니다.");
					$('#email1').val('');	
				}else if(data.mc ==-1){
					alert("이메일을 입력하세요.");
				}else{
					alert("사용가능합니다.");			
					}
			}
		});
	 });
});
</script>
<script type="text/javascript">
function pho(){
	  var phone = document.getElementById("phone").value;
// 길이
if(!/^[0-9]+$/.test(phone))
{ 
    alert("숫자로 입력하세요"); 
    myform.phone.empty();
    myform.phone.focus();
	   	return ;
 }
}

function telt(){
	  var tel = document.getElementById("tel").value;	  
//길이
if(!/^[0-9]+$/.test(tel))
{ 
  alert("숫자로 입력하세요"); 
  myform.tel.empty();
  myform.tel.focus();
	   	return ;
}
}

function pho1(){
	  var phone = document.getElementById("phone1").value;
//길이
if(!/^[0-9]+$/.test(phone))
{ 
  alert("숫자로 입력하세요"); 
  myform.phone.empty();
  myform.phone.focus();
	   	return ;
}
}
</script>
</head>
<body>
<div align="center">
   <a href="/bisup/bisup_login/main.do"><img alt="로고" src="/bisup/resources/img/logo.png" width="250px"></a>
<!-- <h1 align="center">회원가입</h1> --><br><br>
	<div class="container">
	<div class="mStep1">
					<img src="/bisup/resources/img/step2.PNG">
						</div>
						<br>
    <div class="login-signup">
      <div class="row" style="width: 455px;">
        <div class="col-sm-6 nav-tab-holder" style="width: 455px;">
        <ul class="nav nav-tabs row" role="tablist">
          <li role="presentation" class="active col-sm-6"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">창업 예정자</a></li>
          <li role="presentation" class="col-sm-6"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">자영업자</a></li>
        </ul>
      </div>
      </div>


      <div class="tab-content" style="width: 515px;">
      
        <div role="tabpanel" class="tab-pane active" id="home" style="width: 515px;">
          <div class="row" style="width: 515px;">

            <div class="col-sm-6 mobile-pull" style="width: 515px;">
              <article role="login">
                <h3 class="text-center"><i class="fa fa-lock"></i>창업 예정자 회원가입</h3>
                
                <form:form commandName="member" class="signup" name="myform">
           	  <%--  <form:errors element="div"/> --%>
           	  <div class="form-group">

           	 <input type="text" name="id" id="id" class="form-control" value="" placeholder="아이디를 입력해주세요" required/>

				<%--  <form:errors path="id"/> --%>
			</div> 	            
              <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요" required="필수입력창입니다"/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
                   <div class="form-group">
                   <input type="password" name="pw" id="pw" showPassword="false" class="form-control" placeholder="비밀번호를 입력해주세요"required="필수입력창입니다" onblur="pass()"/>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                    <input type="password" id="pw_c" name="pw_c"  class="form-control" placeholder="비밀번호를 다시 한번 입력해주세요"required="필수입력창입니다" onblur="passwordCheck()"/>
                  <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                    <input type="text" name="nick" id="nick" class="form-control" placeholder="닉네임을 입력해주세요"required="필수입력창입니다" />
                  <%--  <form:errors path="nick"/> --%>
                  </div>
                    <div class="form-group input-group">
          <span class="input-group-addon">
            @
          </span>
          <input class="form-control" placeholder="Email" class="email" id="email" name="email" type="email" required="필수입력창입니다"/>
        </div>
                
                  <div class="form-group">
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="연락처를 입력해주세요" onblur="pho()"/>
                  <%--  <form:errors path="phone"/> --%>
                  </div>
                
                 <div class="form-group" align="left">

					<p class="guSelect"><form:label path="gucode"><b>관심지역</b></form:label>
                  <form:select path="gucode" style="height:30px;">
               
                  <form:options items="${guSel}" itemLabel="gn" itemValue="gcode"/>
                  </form:select></p>
                </div> 
                
                  <div class="form-group">
                  </div>
                  <div class="form-group">
                  <input type="hidden" name="sort" value="1"/>
                   <input type="hidden" name="tel" value="0"/>
                    <input type="submit" class="btn btn-success btn-block"  value="회원 등록" >
                  </div>
              </form:form>

                <footer role="signup" class="text-center">
                  <ul>
                    <li>
                      <a href="/bisup/bisup_login/main.do">메인으로</a>
                    </li>
                  
                  </ul>
                </footer>

              </article>
            </div>

          
          </div>
          <!-- end of row -->
        </div>
        <!-- end of home -->


      <div role="tabpanel" class="tab-pane" id="profile" style="width: 515px;">
        <div class="row">

          <div class="col-sm-6 mobile-pull" style="width: 515px;">
            <article role="login">
              <h3 class="text-center"><i class="fa fa-lock"></i> 자영업자 회원가입</h3>
           <!-- class="signup" class="form-control"-->
             
              <form:form commandName="member" class="signup">
           	  <%--  <form:errors element="div"/> --%>
           	  <div class="form-group">
            <input type="text" name="id"  id="id1" class="form-control" placeholder="아이디를 입력해주세요" required=""/>
				<%--  <form:errors path="id"/> --%>
			</div> 	            
              <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="이름을 입력해주세요"required=""/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
                    <div class="form-group">
                   <input type="password" name="pw" id="pw" showPassword="false" class="form-control" placeholder="비밀번호를 입력해주세요"required="필수입력창입니다" onblur="pass()"/>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                    <input type="password" id="pw_c" name="pw_c"  class="form-control" placeholder="비밀번호를 다시 한번 입력해주세요"required="필수입력창입니다" onblur="passwordCheck()"/>
                  <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                   <input type="text" name="nick" id="nick1" class="form-control" placeholder="닉네임을 입력해주세요" required=""/>
                  <%--  <form:errors path="nick"/> --%>
                  </div>
                    <div class="form-group input-group">
          <span class="input-group-addon">
            @
          </span>
          <input class="form-control" placeholder="Email" name="email" class="email" type="email" id="email1" required=""/>
        </div>
                  <div class="form-group">
                    <input type="text" id="phone1" name="phone" class="form-control" placeholder="연락처를 입력해주세요" onblur="pho1()"/>
                  <%--  <form:errors path="phone"/> --%>
                  </div>
                  <div class="form-group">
                    <input type="text" name="snum" id="snum" class="form-control" placeholder="사업자번호를 입력해주세요" required=""/>
                  <%--  <form:errors path="snum"/> --%>
                  </div>
                  <div class="form-group">
                    <input type="text" id="tel" name="tel" class="form-control" placeholder="카페 연락처를 입력해주세요" onblur="telt()"/>
                    <%--  <form:errors path="tel"/> --%>
                  </div>
                  <div class="form-group" align="left">

					<p class="guSelect"><form:label path="gucode" ><b>관심지역</b></form:label>
                  <form:select path="gucode" style="height:30px;">
               <form:options items="${guSel}" itemLabel="gn" itemValue="gcode"/>
                  </form:select></p>
                </div> 
                <div class="form-group">
                  <!-- <div class="checkbox">
                    <label>
                      <input type="checkbox"> Please accept the terms and conditions to proceed with your request.
                    </label>
                  </div> -->
                </div>
                <div class="form-group">
                  <input type="hidden" name="sort" value="2"/>
                  <input type="submit" class="btn btn-success btn-block"  value="회원등록">
                </div>
              </form:form>
              
              <footer role="signup" class="text-center">
                  <ul>
                    <li>
                      <a href="/bisup/bisup_login/main.do">메인으로</a>
                    </li>
              </footer>

            </article>
          </div>

          </div>
        </div>
      </div>
  </div>
  </div>
</div>
</body>
</html>