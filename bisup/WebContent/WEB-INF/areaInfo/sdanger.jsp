<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String cp=request.getContextPath();
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  		
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
.gcode {
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	background:#f7f7f7;
	background:-o-linear-gradient(90deg, #f7f7f7, #ffffff);
	background:-moz-linear-gradient( center top, #f7f7f7 5%, #ffffff 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f7f7f7), color-stop(1, #ffffff) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f7f7f7', endColorstr='#ffffff');
	background:-webkit-linear-gradient(#f7f7f7, #ffffff);
	background:-ms-linear-gradient(#f7f7f7, #ffffff);
	background:linear-gradient(#f7f7f7, #ffffff);
	text-indent:0px;
	line-height:20px;
	-moz-border-radius:15px;
	-webkit-border-radius:15px;
	border-radius:15px;
	text-align:center;
	vertical-align:middle;  
	display:inline-block;
	font-size:15px;
	color:#0f0f0f;
	width:80px;
	height:30px;
	padding:5px;
	text-shadow:#dfe6e8 2px 2px 0px;
	border-color:#fff7ff;
	border-width:1px;
	border-style:solid;
}

.gcode:active {
	box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	position:relative;
	top:3px
}

.gcode:hover {
	background:#ffffff;
	background:-o-linear-gradient(90deg, #ffffff, #f7f7f7);
	background:-moz-linear-gradient( center top, #ffffff 5%, #f7f7f7 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f7f7f7) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f7f7f7');
	background:-webkit-linear-gradient(#ffffff, #f7f7f7);
	background:-ms-linear-gradient(#ffffff, #f7f7f7);
	background:linear-gradient(#ffffff, #f7f7f7);
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('.dcode').click(function(){
		var dcode = $(this).val() ;
		var url="<%=cp%>/my/areaInfo/return.do";
		var params="dcode="+dcode;
		$.ajax({
			type:"get",
			url:url,
			data:params,
			dataType:"json",
			success:function(args){
				$(".tbody").find("tr").remove(); 
				for(idx=0 ; idx<args.list.length ; idx++){
					//alert(args.list[idx].dn);
					 $(".tbody").append("<tr><td><td>"+args.list[idx].gn+"</td><td><a href=# onclick=chart('"+args.list[idx].dn+"') >"+args.list[idx].dn+"</a></td><td>"+args.list[idx].newstore+"</td><td>"+args.list[idx].arg+"</td><td>"+args.list[idx].jumpol+"</td></tr>");
				}
			}
		});
	});

$('.gcode').click(function dongS() {
 	var g=$(this).val();
	var url="<%=cp%>/my/areaInfo/Info.do";
	var params ="gcode="+g;
	
	$("#dcode button").each(function(){
		//id가 city 이며 option인 요소를
		$("#dcode button:eq(0)").remove();
		//city option의 1번째를 계속 삭제(0번째만 남기고 모두 지우게 된다. )
		//eq : 지정된 index번째의 엘리먼트 선택
	});

	$.ajax({
		type:"post" // 포스트방식
		,url:url //url주소
		,data:params //요청에 전달되는 프로퍼티를 가진 객체
		,dataType:"json" //리턴된 데이터타입 : json타입으로 받겠다 
		,success:function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수
			
			for(var idx=0; idx<args.data.length; idx++){
				
				$("#dcode").append("<button value='"+args.data[idx].dcode+"' class='dong' id='dong'>"+args.data[idx].dn+"</button>");
				//alert(args.data1[idx].dn);
				//$("#city").append("<option value='"+args.data1[idx]+"'>"+args.data1[idx]+"</option>");	
				
			}
		}
	,error:function(e){
		//이곳의 ajax에서 에러가 나면 알러창으로 에러 메시지 출력
		alert(e.responseText);
		
	}
	});  
 });  
});
		</script>
<title>위험지표</title>
</head>
<body>
<table class="table" style="position: relative; width:150px; text-align:center;   ">
  <thead>
  <tr align="center">
  <c:forEach items="${list }" var="list"  end="16">
      <td align="center"> <button value="${list.gcode}" class="gcode" onchange="jasontable()" >${list.gn}</button></td>
</c:forEach> </tr>   
<tr align="center">
  <c:forEach items="${list }" var="list" begin="17" end="24">
      <td><button value="${list.gcode}" class="gcode" id="list">${list.gn}</button></td>
</c:forEach> </tr>      
         </tbody></table>
  <br>
     <div id="dcode"></div><!-- gu/dong선택 종료 -->
         <br>
         <br>
<table  class="table">
  <thead>
  <tr>
      <th>#</th>
      <th>구이름</th>
      <th>동이름</th>  
      <th>위험지표</th>
      <th>평균 폐업기간</th>
      <th>점포증감률</th>
         </tr>
       </thead>
       <tbody class="tbody">
     </tbody></table>
    
     
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <div id="chart_div" style="width: 400px; height: 120px;"></div>
</div>
</body>
</html>