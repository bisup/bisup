<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				for(var gross=0; gross<args.sale.length; gross++){
					$("#gu").append("<option value='"+args.sale[gross].gcode+"'>"+args.sale[gross].gn+"</option>");
				}	
			}
			,error:function(e) {	// 이곳의 ajax에서 에러가 나면 얼럿창으로 에러 메시지 출력
			    	alert(e.responseText);					
			}
		});
});

</script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization(){
				
				var data = google.visualization.arrayToDataTable([
					['Month', '(총매출)', '(평균 매출)'],
					['2016/06',  165,      938],
					['2016/07',  135,      1120],
					['2016/08',  157,      1167],
					['2016/09',  139,      1110],
					['2008/09',  136,      691]
				]);
			
			var options = {
					title : '2016년 지역별 매출 현황',
					vAxis: {title: '단위:만원',
					       ticks:[0,200,400,600,800,1000]
							},
					hAxis: {title: 'Month(월)'}, 
					seriesType: 'bars',
					
				};
		
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			
		}
</script>

</head>
<body>
	<center>
	<form:form method="post">
		<div style="width:700px;" class="trend">
				<h4>※이 정보는 bisup 창업자 대상으로 제공된 데이터 입니다.※</h4>
			<select id="gu" class="trend">
				<option value="">::지역 선택::</option>
				
			</select>&nbsp;&nbsp;
			<input type="submit" value="검색" onclick="drawVisualization();">

	</div>		
	</form:form>


<div>
	<div id="chart_div" style="width:900px; height: 500px;" ></div>		
</div>

</body>
</html>
