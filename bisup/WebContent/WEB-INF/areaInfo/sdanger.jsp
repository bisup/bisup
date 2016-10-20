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
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
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
				$(".img").remove();
				$(".tbody").find("tr").remove(); 
				$(".th").find("th").remove();
				$(".bto").find("button").remove();
				$(".th").append( "<th>#</th><th>구이름</th><th>동이름</th><th>위험지표</th><th>평균 폐업기간</th><th>점포증감률</th>"); 
				$(".bto").append("<button type='submit' onclick='' class='btn'>비교하기</button>");
				
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
/* $(document).ready(function(){
	$('.btn').click(function seldcode(){
		var para=new Array();
		$("input[name='dcode']:checked").each(function(i){para.push($(this).val()); });
		var data ={"dcodeA":para};
		document.myform.submit();
	});	
	}); */

</script> 
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawSeriesChart);

  function drawSeriesChart() {
	  <c:forEach var="li" items="${li}"  >  
	  var dname='${li.dn}'; 
	  </c:forEach>
	  <c:forEach var="li" items="${li1}"  >  
	  var dname1='${li.dn}'; 
	  </c:forEach>
	  <c:forEach var="li" items="${li2}"  >  
	  var dname2='${li.dn}'; 
	  </c:forEach>
    var data = google.visualization.arrayToDataTable([
          ['ID', '신규_창업_위험_지수_값', '점포증감률'],
      	<c:forEach var="li" items="${li}"  >      	
          [dname,   ${li.jumpol},  ${li.arg}],
      </c:forEach>
      	<c:forEach var="li1" items="${li1}"  >      	
        [dname1,   ${li1.jumpol},  ${li1.arg}],
    </c:forEach>
    	<c:forEach var="li2" items="${li2}" >      	
        [dname2,   ${li2.jumpol},  ${li2.arg}]
    </c:forEach>
        ]);

    var options = {
            title: dname+','+dname1+','+dname2+' '+'별 위험지수 비교 ',
            hAxis: {title: '신규_창업_위험_지수_값'},
            vAxis: {title: '점포증감률'},
            bubble: {textStyle: {fontSize: 11}}
          };

    var chart = new google.visualization.BubbleChart(document.getElementById('series_chart_div'));
    chart.draw(data, options);
  }
  
  function dimg(){
	  $(".img").remove();
  }
    </script>
<title>위험지표</title>
<style>
#table_a{
width:50%;
margin-bottom:20px;
border-color: grey;
    white-space: normal;
    line-height: normal;
    font-weight: normal;
    font-size: medium;
    font-style: normal;
    color: -internal-quirk-inherit;
    text-align: start;
    font-variant: normal normal;
        border-spacing: 0;
    border-collapse: collapse;

}
.tbody_a{
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

</style>
</head>
<body>
<h1 align="center">지역별 위험지표</h1><br><br>
<div align="center"><table class="table" style="position: relative; width:150px; text-align:center;">
  <thead>
  <tr align="center">
  <c:forEach items="${list }" var="list"  end="10">
      <td align="center"> <button value="${list.gcode}" class="gcode" onchange="jasontable()" >${list.gn}</button></td>
</c:forEach> </tr>   
<tr align="center">
  <c:forEach items="${list }" var="list" begin="11" end="21">
      <td><button value="${list.gcode}" class="gcode" id="list">${list.gn}</button></td>
</c:forEach> </tr>    
<tr align="center">
  <c:forEach items="${list }" var="list" begin="22" end="24">
     <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>   
         </tbody></table>
         <form:form method="post" action="/bisup/my/areaInfo/sel.do" name="myform">
<div id="table_a">
<table  class="table"><!-- id="table_a" -->
  <thead>
  <tr class="th">
     
     
         </tr>
       </thead>
       <tbody class="tbody"/>
       
     </table>
     </div>
     <br>
     <br>   
     <div align="center" class="bto"></div></form:form>
   <div id="series_chart_div" style="width: 900px; height: 500px;"></div></div>
</body>
</html>