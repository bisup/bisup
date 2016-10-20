<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>  
<script type="text/javascript">
if(${x != 0}){
alert("발송된 이메일로 아이디와 비밀번호를 보냈습니다");
self.close();
}else{
	alert("이메일로 아이디와 비밀번호가 맞지 않습니다");	
	history.go(-1);
}

</script>  
</head>
<body>

</body>
</html>