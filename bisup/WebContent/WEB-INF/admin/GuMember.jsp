<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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



</head>
<body>

<div align="center">
	<!-- <div id="series_chart_div" style="width: 1500px; height: 800px;"></div> -->
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>
</body>
</html>