<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
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
			url:'checknick.do',
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
				}else{
					alert("닉네임사용가능합니다.");			
					}
			}
		});
	 });
	 

});
</script>
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
 <form:form commandName="mem" class="signup" name="myform">
  
  
           	 
           	  <div class="form-group">
           	  <form:label path="id">본인 ID</form:label>
           	 <form:input path="id" class="form-control" readonly="true" value="${mem.id}" />
				
			</div> 	            
              <div class="form-group">
              <form:label path="name">이름</form:label>
                    <form:input path="name" class="form-control" value="${mem.name}" required="필수입력창입니다"/>
                 
                  </div>
                   <div class="form-group">
                   <form:label path="pw">비밀번호</form:label>
                   <form:password path="pw" showPassword="false" class="form-control" value="${mem.pw}" onblur="pass()"/>
            	
                  </div>
                  <div class="form-group">
                  <form:label path="pw">비밀번호 확인</form:label>
                   <input type="password" id="pw_c" value="${mem.pw}" class="form-control" onblur="passwordCheck()">
                 
                  </div>
                  <div class="form-group">
                  <form:label path="nick">닉네임</form:label>
                    <form:input path="nick" class="form-control" value="${mem.nick}" required="필수입력창입니다"/>
                 
                  </div>
                   <div class="form-group">
                   <form:label path="email">이메일</form:label>
                    <form:input path="email" class="form-control" readonly="true" value="${mem.email}"/>
                    	
                 
                  </div>
                  <div class="form-group">
                  <form:label path="phone">연락처</form:label>
                    <form:input path="phone" class="form-control" value="${mem.phone}"/>
                 
                  </div>

              
                  <div class="business" id=bisness>

                  <div class="form-group">
                  <form:label path="snum">사업자번호</form:label>
                    <input type="text" name="snum1" id="snum" class="form-control" value="${mem.snum}"  readonly="true"/>
                  
                  </div>
                  <div class="form-group">
                  <form:label path="tel">상호 전화번호</form:label>
                    <input type="text" name="tel1" id="tel" class="form-control" value="${mem.tel}" required="필수입력창입니다"/>
                 </div>
				<input type="hidden" name="sort" value="2" class="sort" id="sort"/>
                  
                  </div>
        		
          		
                <div class="form-group">
					<form:label path="gucode"><b>카페 위치 행정구</b></form:label>
                  <form:select path="gucode">
                  <form:options items="${guSel}" itemLabel="gn" itemValue="gcode"/>
                  </form:select>
                </div> 
   		
                <div class="form-group">
                  <input type="submit" class="btn btn-success btn-block"  value="정보 수정">
                </div>
        
              </form:form>
                            </div>
              </div>
</body>
</html>