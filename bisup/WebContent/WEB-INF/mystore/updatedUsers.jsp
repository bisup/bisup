<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart);
	var url="/bisup/mystore/drawChart.do";
	function drawChart() {
		
		$.ajax({
		type:"post"
			,url:url
			,data:""
			,dataType:"json"
			,success:function(args){
				var data = google.visualization.arrayToDataTable([
						['Task','Hours per Day'],
						['창업자',args.data1],
						['전체회원수',args.data2]
					]);
				var options = {
						title: 'My Daily Activities',
						pieHole: 0.4,
				};

				var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
				chart.draw(data, options);  
			}
		});
		
   	}
        

</script>
</head>
<body>
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
</body>
</html>