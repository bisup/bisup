<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var charData;
    	  var param={gucode:'${gucode}'};
    	  var url ='/bisup/admin/storeChart.do';
    	  $.ajax({
      		type:"post"
      		,url:url
      		,data:param
      		,dataType:"json"
      		,success:function(args){
      			
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [args.data[0].gn, args.data[0].cd],
          [args.data[1].gn, args.data[1].cd],
          [args.data[2].gn, args.data[2].cd],
          [args.data[3].gn, args.data[3].cd],
          [args.data[4].gn, args.data[4].cd],
          [args.data[5].gn, args.data[5].cd],
          [args.data[6].gn, args.data[6].cd],
          [args.data[7].gn, args.data[7].cd]
        ]);
      	
        var options = {
          title: '지역구별 점포 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      		}
      });
    	  }
    </script>
</head>
<body>
<div class="container">
	<form:form method="post">
		 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">점포 관리</h2>
  	<p style="display: block;">현재 가입된 회원님들의 점포 분포도를 보여드립니다.</p>	
	</form:form>
<div>
  <div id="piechart" style="width: 900px; height: 500px;"></div>		
</div>
</div>
</body>
</html>
