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
					$("#gu").append("<option value="+args.sale[gross].gcode+">"+args.sale[gross].gn+"</option>");
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
					['2016/06',  1650,      938],
					<c:forEach var="a" items="${sale1}">
					['2016/07',  ${a.tot},      ${a.avg}], //345,  765
					</c:forEach>
					['2016/08',  1570,      1100],
					['2016/09',  1390,      1110]
				]);
				
				var options = {
						title : '2016년 지역별 총매출 현황',
						vAxis: {title: '단위:만원',
						       ticks:[0,3000,6000,9000,12000,15000]
								},
						hAxis: {title: 'Month(월)'}, 
						seriesType: 'bars',
						
					};
				
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
			
			}
</script>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['2016/06',     35350],
          ['2016/07',      25303],
          ['2016/08',  	   40010],
          ['2016/09', 	   34052]
        ]);

        var options = {
          title: '2016년 지역별 평균매출 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>


</head>
<body>
	<center>
	<form method="post" action="/bisup/bisup_trend/sales_trend1.do">
		<div style="width:700px;" class="trend">
				<h4>※이 정보는 bisup 창업자 대상으로 제공된 데이터 입니다.※</h4><br>
			<select id="gu" name="gn" class="trend">
				<option value="" selected>::지역 선택::</option>
				
			</select>&nbsp;&nbsp;
			<input type="submit" value="검색" >
			
	<div id="chart_div" style="width:900px; height: 500px;" ></div>
	<div id="piechart" style="width: 900px; height: 500px;"></div>
	</div>
	</form>	
</body>
</html>
