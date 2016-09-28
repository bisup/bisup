<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert title here</title>
    <!--Load the AJAX API-->
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
    	var id='java';
    	var url='mystore/drawDayChart.do';
    	$.ajax({
    		type:"post"
    		,url:url
    		,data:id
    		,dataType:"json"
    		,success:function(args){
    			// Create the data table.
    	        chartData = new google.visualization.DataTable([
    	        		['total','ea','date'],
    	        		[args.data[0].total,args.data[0].ea,args.data[0].date],
    	        		[args.data[1].total,args.data[1].ea,args.data[1].date],
    	        		[args.data[2].total,args.data[2].ea,args.data[2].date],
    	        		[args.data[3].total,args.data[3].ea,args.data[3].date],
    	        		[args.data[4].total,args.data[4].ea,args.data[4].date],		
    	        ]);
    		}
    	});
    	        // Set chart options
    	        var options = {'title':'asdf',
    	                       'width':800,
    	                       'height':600};
    	        
    	        // Instantiate and draw our chart, passing in some options.
    	        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    	        chart.draw(chartData, options);
      }
</script>
</head>
<body>
	<!--Div that will hold the pie chart-->
    <div id="chart_div"></div>
</body>
</html>