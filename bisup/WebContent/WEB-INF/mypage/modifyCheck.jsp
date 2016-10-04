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
<style>

</style>
<title>Insert title here</title>
</head>
<script>
  if('${x}'!=null){
	  
	 if('${x}'==1){
		 document.location.href="/bisup/my/mypage/modifyForm.do";
	 }
	 else{
		 alert("x는 '${x}'이고 비밀번호가 일치하지 않습니다.");
	 }
  } 

</script>
<script>

/* 비밀번호 일치여부 확인 함수 수정 필요*/
  
  function submit(action){
	//submit버튼 2개 
	var input = document.getElementById("buttonValue");
	if(action==1){
		//회원정보수정
		input.value="update";
	}
	esle if(action ==2){
		//탈퇴
		if(confirm("정말 삭제하시겠습니까?")==true{
			document.location.href="/bisup/my/mypage/delMem.do";
		}else{
		//modifycheck
		}
		input.value="delete";
	}
	document.login-recordar.submit();
} 
 
 
 /* $(document).ready(function() {
	   $('#modButton').click(function(e) {
	    e.preventDefault();
	    if(document.getElementById("pw")=='${SessionScope.pw}'){
	    	document.location.href="/bisup/bisupjoin/join/form.do";
	    }
	    else{
	    	var x = document.getElementById("col-md-9");
	    	alert(x.innerHTML)
	    	$('.alert-normal-info').show();
	    }
	  }); */
	  /*  $('#acceso').click(function(e) {
	    e.preventDefault();
	   //  $('div#form-olvidado').toggle('500'); 
	   
	  });  
	}); */
	
 /* $(document).ready(function () {
		

		$('#normal-btn-info').click(function() {
			if($("#agreeRadio").is(':checked') == false ){
			$('.alert-normal-info').show();
			}
			else{
				document.location.href="/bisup/bisupjoin/join/form.do";
			}
			});
		
		$(document).on('click', '.close', function () {
			$(this).parent().hide();
 	});	
		

}); */
</script>
<body>

<div class="container">
	<div class="row">
	
        <div class="col-md-6 col-md-offset-3">
  <h4 style="border-bottom: 1px solid #c5c5c5;">
    <i class="glyphicon glyphicon-user">
    </i>
  본인 확인
  <br>
  </h4>
  
 <!--  style="display: none;" -->
  <div  id="form-olvidado">
    <h4 class="">
      회원 정보 수정을 하시겠습니까?
    </h4>
    <form accept-charset="UTF-8" role="form" name="login-recordar" id="login-recordar" method="post">
      <fieldset>
         <span class="help-block">
         회원 정보 수정을 위한 비밀번호 확인이 필요합니다.
        </span> 
       <br>
          <div class="form-group">
          <input type="password" name="inputpw" id="inputpw" class="form-control" placeholder="비밀번호를 입력해주세요" > 
                  <%--  <form:password path="pw" showPassword="false" class="form-control" placeholder="비밀번호를 입력해주세요"/> --%>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <h4 style="border-bottom: 1px solid #c5c5c5;">
  </h4>
       <input type="hidden" name="buttonValue" id="buttonValue" />
       <div id="buttonDiv" align="center">
       		
    		<button type="button" id="modButton" class="btn btn-primary" onclick="submit(1)">회원 정보 수정</button>
    		<!-- onclick 비밀번호 확인하고 정보수정폼으로  -->
    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		<button type="button" id="delButton" class="btn btn-primary" onclick="submit(2)">탈퇴하기</button>
    	   <!-- onclick 비밀번호 확인하고 탈퇴되었습니다 알러창띄우고 맨 앞 메인으로 -->
	</div>	
	<div class="col-md-9">
		<div class="alert alert-info alert-normal-info" hidden="hidden">
  				    <button type="button" class="close">×</button>
  					비밀번호를 확인해주세요.
			<br>
		</div>   	
	</div>
        <p class="help-block">
          <a class="text-muted" href="#" id="acceso"><small>#MAIN</small></a>
        <!--   로그인 후 메인화면으로 -->
        </p>
      </fieldset>
    </form>
  </div>
</div>
	</div>
</div>

</body>
</html>