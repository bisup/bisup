<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");  
%>
<html>
<head>
<title>Insert title here</title>
    <!--Load the AJAX API-->
<style>
.columnchart_values{
position:absolute;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
		var chartData;
    	var param={id:"${sessionScope.id}"};
    	var url='/bisup/mystore/drawDayChart.do';
    	$.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			// Create the data table.
    	        chartData = new google.visualization.arrayToDataTable([
    	        		['item',{label: '매출', type: 'number'},{ role: 'style' }],
    	        		[args.data[0].item,args.data[0].total,'#ff9933'],
    	        		[args.data[1].item,args.data[1].total,'#000000'],
    	        		[args.data[2].item,args.data[2].total,'#cc3300'],
    	        		[args.data[3].item,args.data[3].total,'#ff9900'],
    	        		[args.data[4].item,args.data[4].total,'#800000'],
    	        ]);
    	     // Set chart options
				var view = new google.visualization.DataView(chartData);
				view.setColumns([0,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       1]);
    	        var options = {
    	                       'width':700,
    	                       'height':500};
    	        
    	        // Instantiate and draw our chart, passing in some options.
    	        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
    	        chart.draw(chartData, options);
    		}
    	});
    	        
      }
</script>
</head>
<body>
<!-- <div id="container"> -->
<div id="columnchart_values"></div>
<!-- </div> -->
</body>
</html>