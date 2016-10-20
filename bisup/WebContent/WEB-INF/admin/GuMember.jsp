<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    
    <script type="text/javascript">
   
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var s = ${s}; //기존의 2인사람
    	  var c = ${c}; //변경된사람
   	
    	
        var data = google.visualization.arrayToDataTable([
          ['Task', 'age per age'],
          ['기존 자영업자',    s],
          ['bisup을 통해 자영업자가 된 회원',      c]
        ]);

        var options = {
          title: 'bisup 이용정도',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>



</head>
<body>
<br>
<div align="center">
	<h3> bisup을 통해 창업자가 된 회원비율을 확인 하실 수 있습니다. </h3>
	
	<div id="donutchart" style="width: 900px; height: 500px;"></div>
</div>
</body>
</html>