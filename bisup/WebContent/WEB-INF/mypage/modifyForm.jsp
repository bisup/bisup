<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <meta name="viewport" content="width=device-width, initial-scale=1">
 	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
	<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>	 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<title>Insert title here</title>
</head>
 <script>
 $(document).ready(function(){
 if ("${mem.sort==2}"){
	 alert("sort2")
$('.guSelect').html('<form:label path="gucode"><b>카페 위치 행정구</b></form:label>');
} 
 });
</script> 
<script>

</script>
    <script>
       function change(){


                	if($('#sort').is(":checked")){
                		
                		document.getElementById('changeBis').style.display = '';
                		//document.getElementById("changeBis").display = false;
                		$('.sortSel').html('<input type="hidden" name="sort" value="2" class="sort" id="sort"/>');
               			
                		 $('.guSelect').html('<form:label path="gucode"><b>카페 위치 행정구</b></form:label>');
                		/*  $(".changeBis").append(
                				 '<div class="form-group"><form:label path="snum">사업자번호</form:label><form:input path="snum" class="form-control" placeholder="사업자번호를 입력해주세요" required=""/></div><div class="form-group">'
                				 +'<form:label path="tel">상호 전화번호</form:label><form:input path="tel" class="form-control" placeholder="가게전화번호를 입력해주세요"/></div>');
                		 */
                	} 
                	else{
                		document.getElementById('changeBis').style.display = 'none';
                		$('.sortSel').html('<input type="hidden" name="sort" value="1" class="sort" id="sort"/>');
               			 
                		
               			 $('.guSelect').html('<form:label path="gucode"><b>관심지역</b></form:label>');
                		 
                		 
                		 
                	}
               } 
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
  
  <form:form commandName="member" class="signup" >
  
  <!-- 수정완료창뜨고 마이페이지 맨앞으로 -->
           	  <%--  <form:errors element="div"/> --%>
           	  <div class="form-group">
           	  <form:label path="id">본인 ID</form:label>
           	 <form:input path="id" class="form-control" readonly="true" value="${mem.id}" />
				<%--  <form:errors path="id"/> --%>
			</div> 	            
              <div class="form-group">
              <form:label path="name">이름</form:label>
                    <form:input path="name" class="form-control" value="${mem.name}"/>
                  <%--  <form:errors path="name"/> --%>
                  </div>
                   <div class="form-group">
                   <form:label path="pw">비밀번호</form:label>
                   <form:password path="pw" showPassword="false" class="form-control" value="${mem.pw}"/>
            	 <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="pw">비밀번호 확인</form:label>
                   <input type="password" value="${mem.pw}" class="form-control">
                  <%--  <form:errors path="password"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="nick">닉네임</form:label>
                    <form:input path="nick" class="form-control" value="${mem.nick}"/>
                  <%--  <form:errors path="nick"/> --%>
                  </div>
                   <div class="form-group">
                   <form:label path="email">이메일</form:label>
                    <form:input path="email" class="form-control" readonly="true" value="${mem.email}"/>
                    	<!-- 정규식추가 -->
                  <%--  <form:errors path="email"/> --%>
                  </div>
                  <div class="form-group">
                  <form:label path="phone">연락처</form:label>
                    <form:input path="phone" class="form-control" value="${mem.phone}"/>
                  <%--  <form:errors path="phone"/> --%>
                  </div>

                   <c:if test="${mem.sort==2}"> 
                  <div class="business" id=bisness>

                  <div class="form-group">
                  <label>사업자번호</label>
                    <input id="snum" name="snum" type="text" class="form-control" value="${snum}"  readonly="readonly"/>
                  </div>
                  <div class="form-group">
                  <label>상호 전화번호</label>
                    <input type="text" id="tel" name ="tel"class="form-control" value="${tel}"/>
				<input type="hidden" name="sort" value="2" class="sort" id="sort"/>
                  </div>
                  </div>
        		</c:if> <!-- 자영업자 일경우 --> 

                 
                 <c:if test="${mem.sort==1}">
                 
                <div class="form-group" id="readyBis">            
                      <input type="checkbox" id="sortC" class="changeChk" value="1" onchange="change()">
                      <label>BISUP을 통해 창업에 성공하여 상호 정보를 추가하고 싶습니다.</label>                
                </div>
                <p class="sortSel">
                <input type="hidden" name="sort" value="1" class="sort" id="sort"/>
                </p>
                </c:if>  <!-- 창업예정자일 경우 -->
                 
                 <div id="changeBis" style="display:none">
                 
                <div class="form-group">
                <label >사업자번호</label>
                <input id="snum" name="snum"  type="text" class="form-control" placeholder="사업자번호를 입력해주세요"/>
                </div>
      
                <div class="form-group">
                <label>상호 전화번호</label>
                <input type="text" id="tel" name="tel" class="form-control" placeholder="가게전화번호를 입력해주세요"/>
                </div>
                 <!-- checkbox 선택시 (창업예정자에서 창업자로 변경할 경우)보여질 구역 -->
          
          		</div>
          		
                <div class="form-group">
					<p class="guSelect"><form:label path="gucode"><b>관심지역</b></form:label></p>
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