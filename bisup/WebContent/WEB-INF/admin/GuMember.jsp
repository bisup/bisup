<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<!-- <script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load("current", {packages:['corechart']});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
    	["Element", "Density"],
    	['${gu[0].gn}',${guMem[0]}],
		['${gu[1].gn}',${guMem[1]}],
		['${gu[2].gn}',${guMem[2]}],
		['${gu[3].gn}',${guMem[3]}],
		['${gu[4].gn}',${guMem[4]}],
		['${gu[5].gn}',${guMem[5]}],
		['${gu[6].gn}',${guMem[6]}],
		['${gu[7].gn}',${guMem[7]}],
		['${gu[8].gn}',${guMem[8]}],
		['${gu[9].gn}',${guMem[9]}],
		['${gu[10].gn}',${guMem[10]}],
		['${gu[11].gn}',${guMem[11]}],
		['${gu[12].gn}',${guMem[12]}],
		['${gu[13].gn}',${guMem[13]}],
		['${gu[14].gn}',${guMem[14]}],
		['${gu[15].gn}',${guMem[15]}],
		['${gu[16].gn}',${guMem[16]}],
		['${gu[17].gn}',${guMem[17]}],
		['${gu[18].gn}',${guMem[18]}],
		['${gu[19].gn}',${guMem[19]}],
		['${gu[20].gn}',${guMem[20]}],
		['${gu[21].gn}',${guMem[21]}],
		['${gu[22].gn}',${guMem[22]}],
		['${gu[23].gn}',${guMem[23]}],
		['${gu[24].gn}',${guMem[24]}]
    ]);

    var view = new google.visualization.DataView(data);
    view.setColumns([0, 1,
                     { calc: "stringify",
                       sourceColumn: 1,
                       type: "string",
                       role: "annotation" },
                     2]);

    var options = {
      title: "지역구 별 회원 현황",
      width: 1000,
      height: 800,
      bar: {groupWidth: "95%"},
      legend: { position: "none" }
    };
    var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
    chart.draw(view, options);

</script>


<%-- 
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSeriesChart);
function drawSeriesChart() {
	var data = google.visualization.arrayToDataTable([
			['지역구', '지역구코드', '회원수'],
			['${gu[0].gn}',${gu[0].gcode},${guMem[0]}],
			['${gu[1].gn}',${gu[1].gcode},${guMem[1]}],
			['${gu[2].gn}',${gu[2].gcode},${guMem[2]}],
			['${gu[3].gn}',${gu[3].gcode},${guMem[3]}],
			['${gu[4].gn}',${gu[4].gcode},${guMem[4]}],
			['${gu[5].gn}',${gu[5].gcode},${guMem[5]}],
			['${gu[6].gn}',${gu[6].gcode},${guMem[6]}],
			['${gu[7].gn}',${gu[7].gcode},${guMem[7]}],
			['${gu[8].gn}',${gu[8].gcode},${guMem[8]}],
			['${gu[9].gn}',${gu[9].gcode},${guMem[9]}],
			['${gu[10].gn}',${gu[10].gcode},${guMem[10]}],
			['${gu[11].gn}',${gu[11].gcode},${guMem[11]}],
			['${gu[12].gn}',${gu[12].gcode},${guMem[12]}],
			['${gu[13].gn}',${gu[13].gcode},${guMem[13]}],
			['${gu[14].gn}',${gu[14].gcode},${guMem[14]}],
			['${gu[15].gn}',${gu[15].gcode},${guMem[15]}],
			['${gu[16].gn}',${gu[16].gcode},${guMem[16]}],
			['${gu[17].gn}',${gu[17].gcode},${guMem[17]}],
			['${gu[18].gn}',${gu[18].gcode},${guMem[18]}],
			['${gu[19].gn}',${gu[19].gcode},${guMem[19]}],
			['${gu[20].gn}',${gu[20].gcode},${guMem[20]}],
			['${gu[21].gn}',${gu[21].gcode},${guMem[21]}],
			['${gu[22].gn}',${gu[22].gcode},${guMem[22]}],
			['${gu[23].gn}',${gu[23].gcode},${guMem[23]}],
			['${gu[24].gn}',${gu[24].gcode},${guMem[24]}]
		]);
		var options = {
			title: '지역구 별 회원 현황',
			hAxis: {title: '지역구'},
			vAxis: {title: '회원수',axisTitlesPosition: 'in'},
			bubble: {textStyle: {fontSize: 11}},
			backgroundColor: {stroke:'#666',strokeWidth:2},
			chartArea: {left:20},
			explorer: {actions:['dragToPan', 'rightClickToReset']},
			sizeAxis: {minValue: 10000,  maxValue: 12000, maxSize:50, minSize:5},
			tooltip: {textStyle: {color: '#0000ff'}, showColorCode: true},
			width: 1500,
			height: 1000,
			sortBubblesBySize: false,
			theme: 'maximized'
		};
		var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
		chart.draw(data, options);
};
 --%>

</head>
<body>
<div align="center">
	<!-- <div id="series_chart_div" style="width: 1500px; height: 800px;"></div> -->
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>
</body>
</html>