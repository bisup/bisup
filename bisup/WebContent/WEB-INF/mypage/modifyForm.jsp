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

<title>Insert title here</title>
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
	 var nick = document.getElementById("nick1").value;
	 $('#nick1').blur(function nickHH(){
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
	 
	 $('#snum1').blur(function snum(){
		  $.ajax({
				type:'get',
				url:'checksnum.do',
				data:{
					"snum":$('#snum1').val()
				},
				dataType:"json",
				success:function(data){
					//var b=Number(1);
					//var i=parseInt(args.x);
				/* 	args.x.typeofValue */
					if(data.isNumber==0){
						alert("사업자 번호는 숫자로 입력해주세요!!!");
						$('#snum').val('');
					}
					if(data.mc > 0 ){
						alert("사업자번호 중복입니다.");
						$('#snum').val('');	
					}else{
						alert("사업자번호 사용가능합니다.");			
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

  
   <form:form commandName="mem" class="signup" name="myForm">

  
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
                   <form:password path="pw" showPassword="false" class="form-control" value="${mem.pw}" required="필수입력창입니다" onblur="pass()"/>
                  </div>
                  <div class="form-group">
                  <form:label path="pw">비밀번호 확인</form:label>
                   <input type="password" id="pw_c" value="${mem.pw}" class="form-control" onblur="passwordCheck()">
                  </div>
                  
                  <div class="form-group">
                  <form:label path="nick">닉네임</form:label>
                    <form:input path="nick" class="form-control" id="nick" value="${mem.nick}" required="필수입력창입니다"/>
                  </div>
                  
                   <div class="form-group">
                   <form:label path="email">이메일</form:label>
                    <form:input path="email" class="form-control" readonly="true" value="${mem.email}"/>
                  </div>
                  
                  <div class="form-group">
                  <form:label path="phone">연락처</form:label>
                    <form:input path="phone" class="form-control" value="${mem.phone}"/>
                  </div>
   
                <div class="form-group" id="readyBis">            
                      <input type="checkbox" id="sortC" class="changeChk" onchange="change()">
					 <label>BISUP을 통해 창업에 성공하여 상호 정보를 추가하고 싶습니다.</label>                
                </div>
              
                <p class="sortSel"> <!-- 체크박스 선택시 sort변경 구간 -->
                <input type="hidden" name="sort" value="1" class="sort" id="sort"/>
                </p> 
            
                 <div id="changeBis" name="changeBis" display='none'><!-- checkbox 선택시 (창업예정자에서 창업자로 변경할 경우)보여질 구역 -->
                 
               <div class="form-group"> 
                <div class="snumm">
                <input type="hidden" name="snum1"   value="" />
              
          	  </div>
      		</div>
      		
                <div class="form-group">
                <div class="tell">
                <input type="hidden" name="tel1"   value="" /> 
              	
                </div> 
                </div>
                
                </div> 
  <script>
       function change(){


                	if($('#sortC').is(":checked")){
                		
                		 document.getElementById('changeBis').style.display = ''; 
                		
                		$('.sortSel').html('<input type="hidden" name="sort" value="2" class="sort"/>');
               			
                		 $('.guSelect').html('<form:label path="gucode"><b>카페 위치 행정구</b></form:label>');
                		 $('.snumm').html(' <label>사업자번호</label><input type="text" name="snum1" id=snum1 class="form-control" value="" placeholder="사업자번호를 입력해주세요" required="필수입력창입니다"/>');
               			 $('.tell').html('<label >상호 전화번호</label><input type="text" name="tel1"  class="form-control" value="" placeholder="전화번호를 입력해주세요" required="필수입력창입니다"/>');
                		
                		
                		
                	} 
                	else{
                		 document.getElementById('changeBis').style.display = 'none';
                		$('.sortSel').html('<input type="hidden" name="sort" value="1" class="sort" />');
                		
                		
               			 $('.guSelect').html('<form:label path="gucode"><b>관심지역</b></form:label>');
               			
          		 
                	}
               } 
                </script> 
          		
          		   <!-- 창업예정자->창업자일 경우 -->
          		
                <div class="form-group">
					<p class="guSelect"><form:label path="gucode"><b>관심지역</b></form:label></p>
                  <form:select path="gucode">
               
                  <form:options items="${guSel}" itemLabel="gn" itemValue="gcode"/>
                  </form:select>
                </div> 
   		       <input type="hidden" name="ch" value="1">
   		       
                <div class="form-group">
                  <input type="submit" class="btn btn-success btn-block"  value="정보 수정">
                </div>
         
              </form:form>
		 <!-- 창업예정자폼 -->
  
  
  
  
 
            
              </div>
              </div>
</body>
</html> 