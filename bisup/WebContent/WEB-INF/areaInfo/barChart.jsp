<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() 
      {
    		chartlist.push(value.total_ppl);
		 		chartlist.push(value.f_ppl);
		 		chartlist.push(value.m_ppl);
		 		chartlist.push(value.adm_nm);
		 		
		 		 var list1 = ${list[0]}; //총인구수
		    	  var list2 = ${list[1]}; //남자인구수
		    	  var list3 = ${list[2]}; //여자인구수
		    	  var list4 = ${list[3]}; //동이름
		 		
        var data = google.visualization.arrayToDataTable([
          ['동이름', '총인구수', '남자인구수', '여자인구수'],
          [list4, list1, list2, list3]
        ]);

        var options = {
          chart: {
            title: list1,
            subtitle: 'Sales, Expenses, and Profit: 2014-2017',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, options);
      }
    </script>
<body>
<div id="columnchart_material" style="width: 900px; height: 500px;"></div>
</body>
</html>