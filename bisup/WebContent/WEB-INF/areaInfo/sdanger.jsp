<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%
String cp=request.getContextPath();
request.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/bisup/css/jang.css" />
<script type="text/javascript">
$(document).ready(function(){
	$('.gcode').click(function(){
		var gcode = $(this).val() ;
		var url="<%=cp%>/my/areaInfo/return.do";
		var params="gcode="+gcode;
		$.ajax({
			type:"get",
			url:url,
			data:params,
			dataType:"json",
			success:function(args){
				$(".tbody").find("tr").remove(); 
				 
				for(idx=0 ; idx<args.list.length ; idx++){
					//alert(args.list[idx].dn);
					var i=idx+1;
					if(args.list[idx].newstore =="의심"){
					 $(".tbody").append("<tr><td><input type='checkbox'  name='dcode'  value='"+args.list[idx].dcode+"'></td><td>"+args.list[idx].gn+"</td><td><a href='javascript:dn("+args.list[idx].dn+","+args.list[idx].dang_num+")' class='dn'>"+args.list[idx].dn+"</a></td><td><img src='/bisup/resources/img/g.jpg' style='width: 10px'>&nbsp"+args.list[idx].newstore+"</td><td>"+args.list[idx].arg+"</td><td>"+args.list[idx].jumpol+"</td></tr>");
					  
					}else if(args.list[idx].newstore =="주의"){
					 $(".tbody").append("<tr><td><input type='checkbox'  name='dcode'  value='"+args.list[idx].dcode+"'></td><td>"+args.list[idx].gn+"</td><td><a href='javascript:dn("+args.list[idx].dn+","+args.list[idx].dang_num+")'  class='dn'>"+args.list[idx].dn+"</a></td><td><img src='/bisup/resources/img/y.jpg' style='width: 10px'>&nbsp"+args.list[idx].newstore+"</td><td>"+args.list[idx].arg+"</td><td>"+args.list[idx].jumpol+"</td></tr>");
					}
					else if(args.list[idx].newstore =="위험"){
						 $(".tbody").append("<tr><td><input type='checkbox'  name='dcode'  value='"+args.list[idx].dcode+"'></td><td>"+args.list[idx].gn+"</td><td><a href='javascript:dn("+args.list[idx].dn+","+args.list[idx].dang_num+")'  class='dn'>"+args.list[idx].dn+"</a></td><td><img src='/bisup/resources/img/o.jpg' style='width: 10px'>&nbsp"+args.list[idx].newstore+"</td><td>"+args.list[idx].arg+"</td><td>"+args.list[idx].jumpol+"</td></tr>");
						}else{
							$(".tbody").append("<tr><td><input type='checkbox'  name='dcode'  value='"+args.list[idx].dcode+"'></td><td>"+args.list[idx].gn+"</td><td><a href='javascript:dn("+args.list[idx].dn+","+args.list[idx].dang_num+")'  class='dn'>"+args.list[idx].dn+"</a></td><td><img src='/bisup/resources/img/r.jpg' style='width: 10px'>&nbsp"+args.list[idx].newstore+"</td><td>"+args.list[idx].arg+"</td><td>"+args.list[idx].jumpol+"</td></tr>");
						}
				}
				 
			}
		});
	});
	<%-- $('.dn').click(function(){
		var dn = $(this).val() ;
		var url="<%=cp%>/my/areaInfo/data.do";
		var params="dn="+dn;
	}); --%>
	
});

</script>
<script type="text/javascript">
$(document).ready(function(){
	$('.btn').click(function seldcode(){
		var para=new Array();
		$("input[name='dcode']:checked").each(function(i){para.push($(this).val()); });
		var data ={"dcodeA":para};
		var url="<%=cp%>/my/areaInfo/sel.do";
		$.ajax({
			url:url,
			type:'post',
			data: data,
			traditional:true,
			error:function(){
				alert("데이터가 없습니다");
			},success:function(args){
				for(idx=0; idx<= args.list.length; idx++){
				alert(args.list.dcode);
				drawSeriesChart(d);
				}
			}
		});
		
	});	
	});

</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">


google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawSeriesChart);

function drawSeriesChart() {

var data = google.visualization.arrayToDataTable([
  ['ID', 'Life Expectancy', 'Fertility Rate', 'Region',     'Population'],
  ['CAN',    80.66,              1.67,      'North America',  33739900],
  ['DEU',    79.84,              1.36,      'Europe',         81902307],
  ['DNK',    78.6,               1.84,      'Europe',         5523095],
  ['EGY',    72.73,              2.78,      'Middle East',    79716203],
  ['GBR',    80.05,              2,         'Europe',         61801570],
  ['IRN',    72.49,              1.7,       'Middle East',    73137148],
  ['IRQ',    68.09,              4.77,      'Middle East',    31090763],
  ['ISR',    81.55,              2.96,      'Middle East',    7485600],
  ['RUS',    68.6,               1.54,      'Europe',         141850000],
  ['USA',    78.09,              2.05,      'North America',  307007000]
]);

var options = {
  title: 'Correlation between life expectancy, fertility rate ' +
         'and population of some world countries (2010)',
  hAxis: {title: 'Life Expectancy'},
  vAxis: {title: 'Fertility Rate'},
  bubble: {textStyle: {fontSize: 11}}
};

var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
chart.draw(data, options);
}

		</script>
<title>위험지표</title>
</head>
<body>
<table class="table" style="position: relative; width:150px; text-align:center;   ">
  <thead>
  <tr align="center">
  <c:forEach items="${list }" var="list"  end="8">
      <td align="center"> <button value="${list.gcode}" class="gcode" onchange="jasontable()" >${list.gn}</button></td>
</c:forEach> </tr>   
<tr align="center">
  <c:forEach items="${list }" var="list" begin="9" end="16">
      <td><button value="${list.gcode}" class="gcode" id="list">${list.gn}</button></td>
</c:forEach> </tr>    
<tr align="center">
  <c:forEach items="${list }" var="list" begin="17" end="24">
     <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>   
         </tbody></table>
<table  class="table">
  <thead>
  <tr>
      <th>#</th>
      <th>구이름</th>
      <th>동이름</th>  
      <th>위험지표</th>
      <th>평균 폐업기간</th>
      <th>점포증감률</th>
         </tr>
       </thead>
       <tbody class="tbody">
     </tbody></table>
     <br>
     <br>
    
     <div align="center" class="bt"><button class='btn'>비교하기</button></div>
     <div id='series_chart_div' style='width: 900px; height: 500px;'></div>      
    
</body>
</html>