<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
    
	google.charts.load('current', {packages: ['corechart', 'line']});
	google.charts.setOnLoadCallback(drawChart);
    
    function drawChart() {
    var chartData;
	var param={id:'${id}'};
	var url='/bisup/sales/drawChart.do';
	$.ajax({
		type:"post"
		,url:url
		,data:param
		,dataType:"json"
		,success:function(args){
			// Create the data table.
	        chartData = new google.visualization.arrayToDataTable([
			['월','매출'],
			[args.data[0].mon,args.data[0].tot],
			[args.data[1].mon,args.data[1].tot],
			[args.data[2].mon,args.data[2].tot],
			]); 


	var view = new google.visualization.DataView(chartData);
      var options = {
    		  'width':500,
              'height':500,
        hAxis: {
          title: '월별',
       	  ticks: [1,2,3,4,5,6,7,8,9,10,11,12]
        },
        vAxis: {
          title: '매출 금액'
        },
        colors: ['#15A0C8'],
        series: {
            0: { pointShape: { type: 'star', sides: 5} }},
        pointSize: 20,
             	     	
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
  
     chart.draw(chartData, options);
  }
	});
    }
  </script>
</head>
<body>
  <div id="chart_div"></div>
</body>
</html>