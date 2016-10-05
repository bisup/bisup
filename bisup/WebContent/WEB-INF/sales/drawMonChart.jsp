<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");  
%>

<html>
<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
	var param={id:'${id}'};
	var url='/bisup/sales/drawChart.do';
	$.ajax({
		type:"post"
		,url:url
		,data:param
		,dataType:"json"
		,success:function(args){
    	var data = new google.visualization.arrayToDataTable([
// 	['mon','tot'],
// 	[args.data[0].mon,args.data[0].tot],
// 	[args.data[1].mon,args.data[1].tot],
// 	[args.data[2].mon,args.data[2].tot],
// 	[args.data[3].mon,args.data[3].tot],
// 	[args.data[4].mon,args.data[4].tot],		
// 	]);
 
    	['tot','mon'],
    	[args.data[0].tot,args.data[0].mon],
    	[args.data[1].tot,args.data[1].mon],
    	[args.data[2].tot,args.data[2].mon],
    	[args.data[3].tot,args.data[3].mon],
    	[args.data[4].tot,args.data[4].mon],		
    	]);
     
var options = {
        chart: {title: '월별 매출'},
        width: 900,
        height: 500,
        axes: {
          x: {
            0: {side: 'top'}
          }
        }
      };

	var view = new google.visualization.DataView(data);

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, options);
    }
	});
}

  </script>
</head>
<body>
  <div id="line_top_x"></div>
</body>
</html>