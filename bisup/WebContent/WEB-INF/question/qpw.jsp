<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<script>
/* 비밀번호 일치여부 확인 */
$(document).ready(function() {
	if(${x != 0}){
	  //post방식으로 돌아왔을때 
		if(${x == 1}){// 비밀번호 일치
			if(${bt==1}){
		 		 document.location.href="/bisup/bisup/question/qcontents.do?num="+${num};
			}
		}else if(${x == -1}){//비밀번호 불일치
			alert("비밀번호가 일치하지 않습니다.");
				}
			}
});
</script>
<script>
function sub(action){
	//submit버튼 2개 
	if(action===1){
		//회원정보수정
		 $('#buttonValue').val('content');
		 $("#login-recordar").submit();
	}
</script>
</head>
<body>
	<div class="container">
		<br>
		<br>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<h4 style="border-bottom: 1px solid #c5c5c5;">
					<i class="glyphicon glyphicon-lock"></i>비밀글 본인확인.<br>
					<br>
				</h4>

				<div id="form-olvidado">
					<br>
					<h4>선택하신 글은 비밀글 입니다.</h4>
					<form:form commandName="board" accept-charset="UTF-8" role="form" id="login-recordar" >
						<fieldset>
							<span class="help-block">비밀글 조회를 위한 비밀번호 확인이 필요합니다.</span><br>
							<div class="form-group">
								<form:password path="pw" showPassword="false"
									class="form-control" placeholder="비밀번호를 입력해주세요" />
							</div>
							<h4 style="border-bottom: 1px solid #c5c5c5;"></h4>

							<div id="buttonV" style="display: none">
								<input type="text" name="buttonValue" id="buttonValue" />
							</div>
							<div id="buttonDiv" align="center">
								<button type="button" class="btn btn-primary" onclick="sub(1)">확인</button>
							</div>
							<p class="help-block">
								<a class="text-muted" href="/bisup/bisup/question/qlist.do"><small>문의사항
										목록으로 돌아가기</small></a>
							</p>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>