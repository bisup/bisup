<%@ page contentType="text/html; charset=UTF-8"%>
<% String cp = request.getContextPath(); %>
<html>
<head>
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);
@font-face{font-family:'Nanum Gothic'; src:url('/bisup/resources/bootstrap/fonts/nanumgothic.ttf')}
#error_title {
font-family:'Nanum Pen Script', cursive; 
text-align:center;
font-size: 400%;}
#error_image_ryan{
padding-left: 100px;
width:300px;
height:180px;
float: left;
}
#error_image_apache{
padding-right: 100px;
width:180px;
height:180px;
position: relative;
}
#paragraph1{
font-size: x-large;
font-family: 'Nanum Gothic';
border: thin;
border-bottom: thin;
}
#paragraph2{
font-size: x-large;
float: left;
font-family: 'Nanum Gothic';
}

	

</style>
</head>
<body>
<br/><br/><br/>
<h1 id="error_title">일시적인 에러입니다!! ㅠㅠ</h1>
<div style="padding-left: 420px; width:1000px; height:780px; border: thin;border-color: black;" >
<br/><br/>
<div id="paragraph1"><img id="error_image_ryan" src="/bisup/resources/img/errorImage1.jpg">
<p>
안녕하십니까?<br/>
고객만족을 최우선으로 하는<br/>
비즈업 관리자입니다!!<br/>
현재 고객님께서 요청하신 페이지는<br/>
<ins>일시적인 오류로 인해</ins><br/> 
요청이 차단되었습니다.
</p></div>
<br/><br/>
<div style="margin-left: 100px;">
<p id="paragraph2">
현재의 에러는 <ins>일시적이므로</ins><br/>
조속히 조치할 것이며,<br/>
비즈업을 이용해주시는 고객여러분의<br/>
<b>성원에 보답하기 위해<br/>
앞으로도 노력하도록 하겠습니다!!</b>
</p><img id="error_image_apache" src="/bisup/resources/img/errorImage2.png">
</div>
</div>
</body>
</html>