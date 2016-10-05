<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html >
<html> 
<head>
<title>매출 트렌드 보고서</title>
<style>
.tb_date{
    table-layout: fixed;
    border: 0;
    border-spacing: 0;
    border-top: 3px solid #444;
    background: #fff;
    overflow: hidden;
}

#th{
    
    height: 5px;
    border: 0;
    border-left:  solid #cbcbcb;
    border-bottom: 1px solid #cbcbcb;
    text-align: center;
}

#content {
    clear: both;
    width: 750px;
    min-height: 400px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
}
</style>

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
					['2016/07',    ${am},      850],
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
<center>
<div id="content">
	<br>
	<h2 width="750" align="left">2016년 월 매출 차트</h2>
	<div id="chart_div" style="width:750px; height: 500px;"></div>

			<h2 align="left">2016년 월 매출 현황</h2>
	<table border="1" width="750" class="tb_date">
	<tr>
		<th id="th" style="border-left: 0" width="10">순위</th>
		<th id="th" width="30">업체명</th>
		<th id="th" width="30">item</th>
		<th id="th" width="10">수량</th></tr>
	
	<tr height="5">
		<td id="th" style="border-left: 0">1</td>
		<td id="th">${q}</td>
		<td id="th">${w}</td>
		<td id="th">${e}</td></tr>
	
	<tr height="5">
		<td id="th" style="border-left: 0">2</td>
		<td id="th">${q}</td>
		<td id="th">${w}</td>
		<td id="th">${e}</td></tr>
	
	<tr height="5">
		<td id="th" style="border-left: 0">3</td>
		<td id="th">${q}</td>
		<td id="th">${w}</td>
		<td id="th">${e}</td></tr>
	
	<tr height="5">
		<td id="th" style="border-left: 0">4</td>
		<td id="th">${q}</td>
		<td id="th">${w}</td>
	<td id="th">${e}</td></tr>
	
	<tr height="5">
		<td id="th" style="border-left: 0">5</td>
		<td id="th">${q}</td>
		<td id="th">${w}</td>
		<td id="th">${e}</td>
	</tr>
	</table>
</div>
</body>
</html>
		