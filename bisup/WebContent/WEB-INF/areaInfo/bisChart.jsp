
<%@ page contentType="text/html; charset=UTF-8"%>
<html> 
<head>
<title></title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
    
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var list1 = ${list[0]}; //10대미만
    	  var list2 = ${list[1]}; //10대
    	  var list3 = ${list[2]}; //20대
    	  var list4 = ${list[3]}; //30대
    	  var list5 = ${list[4]}; //40대
    	  var list6 = ${list[5]}; //50대
    	  var list7 = ${list[6]}; //60대
    	  var list8 = ${list[7]}; //70대이상
    	 
        var data = google.visualization.arrayToDataTable([
          ['Task', 'age per age'],
          ['10대미만',    list1],
          ['10대',      list2],
          ['20대',  list3],
          ['30대', list4],
          ['40대',    list5],
          ['50대',    list6],
          ['60대',    list7],
          ['70대',    list8]
        ]);

        var options = {
          title: '연령별 비율',
          pieHole: 0.4,
        };
 

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>

</head>
<body>
<div id="donutchart" style="width: 900px; height: 500px;"></div>

</body>
</html>