<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8"); 
%>
<html>
<head>
<title>Insert title here</title>
    <!--Load the AJAX API-->
    
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
    	var param={id:'${id}'};
    	var url='/bisup/mystore/drawDayChart.do';
    	$.ajax({
    		type:"post"
    		,url:url
    		,data:param
    		,dataType:"json"
    		,success:function(args){
    			// Create the data table.
    	        chartData = new google.visualization.arrayToDataTable([
    	        		['total','item'],
    	        		[args.data[0].total,args.data[0].item],
    	        		[args.data[1].total,args.data[1].item],
    	        		[args.data[2].total,args.data[2].item],
    	        		[args.data[3].total,args.data[3].item],
    	        		[args.data[4].total,args.data[4].item],		
    	        ]);
    	     // Set chart options
    	     var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
    	        var options = {'title':'asdf',
    	                       'width':800,
    	                       'height':600};
    	        
    	        // Instantiate and draw our chart, passing in some options.
    	        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_values'));
    	        chart.draw(chartData, options);
    		}
    	});
    	        
      }
</script>
</head>
<body>
<div id="container">
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">메뉴등록</h2>
  	<p style="display: block;">메뉴명을 클릭하신 뒤 가격만 변경하시면 메뉴의 가격이 변경되고, 메뉴명을 바꾸시면 새로운 메뉴로 등록됩니다.</p>
	<!--Div that will hold the pie chart-->
<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</div>
</body>
</html>