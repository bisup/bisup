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
    			['월',{label: '매출', type: 'number',p: {html:true}},{label: '부수비용', type: 'number',p: {html:true}}], 
	        	[args.data2[0].sdate,args.data[0].tot,args.data2[0].etcco],
	        	[args.data2[1].sdate,args.data[1].tot,args.data2[1].etcco],
	        	[args.data2[2].sdate,args.data[2].tot,args.data2[2].etcco],
	        	[args.data2[3].sdate,args.data[3].tot,args.data2[3].etcco]
// 	        	[args.data2[4].sdate,args.data[4].tot,args.data2[4].etcco],
// 	        	[args.data2[5].sdate,args.data[5].tot,args.data2[5].etcco],
// 	        	[args.data2[6].sdate,args.data[6].tot,args.data2[6].etcco],
// 	        	[args.data2[7].sdate,args.data[7].tot,args.data2[7].etcco],
// 	        	[args.data2[8].sdate,args.data[8].tot,args.data2[8].etcco],
// 	        	[args.data2[9].sdate,args.data[9].tot,args.data2[9].etcco],
	        	]);
		var view = new google.visualization.DataView(chartData);
	      var options = {
	     			title : '월별 매출 및 부수비용 현황',
	    	        hAxis: {
	    	          title: '월별'
	    	        },
	    	        vAxis: {
	    	          title: '매출금액/부수비용'
	    	        },
	    	        series: {
	    	          2: {curveType: 'function'}
	    	        },
	    	        tooltip: {isHtml: true}
	    	      };


	var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(chartData, options);
    		}
		});
    		}

  </script>
</head>
<body>
  <div id="chart_div" style="width: 800px; height: 500px;"></div>
</body>
</html>