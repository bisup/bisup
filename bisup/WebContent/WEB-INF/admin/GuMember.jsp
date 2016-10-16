<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSeriesChart);
var url="/bisup/admin/getGuMem.do"
function drawSeriesChart() {
	$.ajax({
	type:"post"
	,url:url
	,data:""
	,dataType:"json"
	,success:function(args){
		var data = google.visualization.arrayToDataTable([
			['지역구', '지역구코드', '회원수'],
			for(var idx=0; idx<args.data1.length; idx++){
				[args.data1[idx].gn, args.data1[idx].gcode,
				for(var idx=0; idx<args.data2.length; idx++){
					if(idx==args.data2.length-1){
						args.data2[idx]]
						continue;
					}
					args.data2[idx]],
				}
			}
			]);

		var options = {
			title: '',
			hAxis: {title: '회원수'},
			vAxis: {title: '지역구'},
			bubble: {textStyle: {fontSize: 11}}
		};

		var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
		chart.draw(data, options);
			}
		}); 
    }
</script>
</head>
<body>
	<div id="series_chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>