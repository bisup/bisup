<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
    String list = request.getContextPath(); //첫번째 경로를 가져온다
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html >
<html>
<head>
<title>매출 트렌드 보고서</title>
<style type="text/css">
.wid{
	widht: 900px;
}
.trend{
	text-align: left;	
}
</style>
<script>
$(function(){
		//구 테이블의 리스트 가져오기
		var url="<%=list%>/bisup_trend/sales_trend.do";
		var params="dumi";
		
		$.ajax({
			type: "post",
			url:url,
			data:params,
			dataType:"json",
			success:function(args){
				for(var gross=0; fross<args.sale.length; gross++){
					$("#gu").append("<option value='"+args.sale[gross]+"'>"+args.sale[gross]+"</option>");
				}	
			}
			,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			    	alert(e.responseText);					
			}
			)};
		)};
	</script>


</head>
<body>
	<center>
	<form method="post">
		<div style="width:700px;" class="trend">
				<h4>※이 정보는 bisup 창업자 대상으로 제공된 데이터 입니다.※</h4>
			<select id="gu" class="trend">
				<option value="">::지역 선택::</option>
				<!-- <option value="11010">종로구</option>
				<option value="11020">중구</option>
				<option value="11030">용산구</option>
				<option value="11040">성동구</option>
				<option value="11050">광진구</option>
				<option value="11060">동대문구</option>
				<option value="11070">중랑구</option>
				<option value="11080">성북구</option>
				<option value="11090">강북구</option>
				<option value="11100">도봉구</option>
				<option value="11110">노원구</option>
				<option value="11120">은평구</option>
				<option value="11130">서대문구</option>
				<option value="11140">마포구</option>
				<option value="11150">양천구</option>
				<option value="11160">강서구</option>
				<option value="11170">구로구</option>
				<option value="11180">금천구</option>
				<option value="11190">영등포구</option>
				<option value="11200">동작구</option>
				<option value="11210">관악구</option>
				<option value="11220">서초구</option>
				<option value="11230">강남구</option>
				<option value="11240">송파구</option>
				<option value="11250">강동구</option> -->
			</select>&nbsp;&nbsp;
			<input type="submit" value="검색">

	</div>		
	</form>


<div>
	<div id="chart_div" style="width:900px; height: 500px;" ></div>		
</div>

</body>
</html>
