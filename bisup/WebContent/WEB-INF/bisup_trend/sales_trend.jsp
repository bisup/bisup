<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title>매출 트렌드 보고서</title>

	<!-- 라이브러리 로딩 / 최신버전 불러오기-->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
		
		/* 데이터 세팅 */
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['Month',    '월매출',   '아메리카노(총판매수)'],
					['2016/06',    800,       650],
					['2016/07',    1200,        850],
					['2016/08',    1700,       1400],
					['2016/09',    1400,       1100],
					    
				]);
			var options = {
					/* title : '2016년 월 매출 차트',
					titleTextStyle: {
					      fontSize: 25
					    }, */
					vAxis: {title: '월매출 단위 : 만원',
						    ticks:[500,1000,1500,2000] },
					hAxis: {title: 'Month(월)'}, 
					seriesType: 'bars',
					
				};
			
			/* 함수 정의 */
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
</head>
<body>
<div align="center">
	<br>
	<h2>2016년 월 매출 차트</h2>
	<div id="chart_div" style="width:750px; height: 500px;"></div>
	
	${al}
	
	</div>
</body>
</html>
		