<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
</head>
<body>
<div class="container">
	<br><br>
		<div class="row">
		<div class="col-md-6 col-md-offset-3">
		<h4 style="border-bottom: 1px solid #c5c5c5;"><i class="glyphicon glyphicon-lock"></i>비밀글 본인확인.<br><br></h4>
	
		<div  id="form-olvidado"><br>
	    <h4>선택하신 글은 비밀글 입니다.</h4>
	    <form:form commandName="member" accept-charset="UTF-8" role="form" id="login-recordar" action="/bisup/bisup/question/qcontents.do">
			<fieldset>
				<span class="help-block">비밀글 조회를 위한 비밀번호 확인이 필요합니다.</span><br>
				<div class="form-group">
					<form:password path="pw" showPassword="false" class="form-control" placeholder="비밀번호를 입력해주세요"/>
				</div>
		                  <h4 style="border-bottom: 1px solid #c5c5c5;"></h4>
				<div id="buttonDiv" align="center">
		          <button type="submit" class="btn btn-primary">확인</button>
				</div>   
				<div class="col-md-9">
				<div class="alert alert-info alert-normal-info" hidden="hidden">
					<button type="button" class="close">×</button>비밀번호를 확인해주세요.<br></div>      
				</div>
					<p class="help-block">
						<a class="text-muted" href="/bisup/bisup/question/qlist.do"><small>문의사항 목록으로 돌아가기</small></a>
					</p>
			</fieldset>
		</form:form>
		</div>
		</div>
		</div>
</div>
</body>
</html>