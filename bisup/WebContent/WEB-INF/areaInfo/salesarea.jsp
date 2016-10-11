<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>  
<html>

<head>
    <title>SOP JavaScript : Polygon sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=bce731c194bf44debe25"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  		
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<div align="center" class="container">
<br>
<h2>상권정보검색</h2><br><br>
<table class="table" style="position: relative; width:auto; ">
  <thead>
  <tr align="center">
  <c:forEach items="${list }" var="list"  end="4">
      <td align="center"> <button value="${list.gcode}" id="gcode" >${list.gn}</button></td>
</c:forEach> </tr>   
<tr align="center">
  <c:forEach items="${list }" var="list" begin="5" end="9">
      <td> <td><button value="${list.gcode}" id="gcode" >${list.gn}</button></td>
</c:forEach> </tr>    
<tr align="center">
  <c:forEach items="${list }" var="list" begin="10" end="14">
      <td> <td><button value="${list.gcode}" id="gcode" >${list.gn}</button></td>
</c:forEach> </tr>  
<tr align="center">
  <c:forEach items="${list }" var="list" begin="15" end="19">
      <td> <td><button value="${list.gcode}" id="gcode" >${list.gn}</button></td>
</c:forEach> </tr>  
<tr align="center">
  <c:forEach items="${list }" var="list" begin="20" end="24">
      <td> <td><button value="${list.gcode}" id="gcode" >${list.gn}</button></td>
</c:forEach> </tr> 
         </tbody></table>
<div id="map" style="width:650px;height:400px"></div>
<div id="divCon"></div>

</div>
<script type="text/javascript">
$(document).ready(function(){
  var accessToken = 'ca1c22f2-c43c-43b6-8dac-de14da597d42';
  var consumer_key = 'bce731c194bf44debe25';
  var consumer_secret = 'b91c3a3960a146b5b79e';
	var map, mapOptions, oriArea, sopArea, logger, divConsole, polygons;
	logger = divLogger();
	mapOptions = {
		ollehTileLayer: true,
		measureControl: false,
		zoomSliderControl: false,
		panControl: false,
		attributionControl: false
	};

	var map = sop.map('map',mapOptions);
	map.setView([953427, 1950827], 5);

	function createServiceRequest(reqFunc, reqParam) {
		return function () {
			// 인증 API
			$.ajax({
              url : 'http://sgisapi.kostat.go.kr/OpenAPI3/auth/authentication.json' +
              		'?consumer_key='+consumer_key+'&consumer_secret='+consumer_sercret,
              type : 'get',
				success: function (res, status) {
					reqParam.accessToken = res.result.accessToken;
					reqFunc(reqParam);
				}
			});
		}         
	}
	divConsole = sop.DomUtil.get("divCon");

	$('#gcode').click(function addArea() {
		   var year = "2013";
	      	var adm_cd = $('#gcode').val ;
	      	var theme_cd="5010"
			$.ajax({
	          url : 'http://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson' +
	          		'?accessToken='+ accessToken +'&year='+year+'&adm_cd='+adm_cd,
         type : 'get',    
	  datatype : "geojson",
			success: function( res,status) {
               oriArea = res;
       
				sopArea = sop.geoJson(res).addTo(map);
				map.fitBounds(sopArea.getBounds());
				sopArea.setStyle({
					 stroke: true,
                     color: "blue",  
                     weight : 3,
                     opacity: 1,
                     fill: true,
                     fillColor:"red",
                     fillOpacity: 0.2
				});
                     $.ajax({ 
     		            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/stats/company.json' +
     		          	'?accessToken='+accessToken+'&year='+year+'&area_type='+0+'&theme_cd='+theme_cd+'&adm_cd='+1101010,
     		            type : 'get',
     		            datatype:'json',
     					success: function (res,status) {
     						var idx, len, target, conComplite = {}, key, value, strToolTip;
     						target = res.result;
     		     			for (idx = 0, len = target.length; idx < len; idx ++) {
     							conComplite[target[idx].adm_cd] = target[idx];
     							if(target[idx].corp_cnt < 1000 ){
     								sopArea.setStyle({
     									 stroke: true,
     				                     color: "red",
     				                     weight : 3,
     				                     opacity: 1,
     				                     fill: true,
     				                     fillColor:"red",
     				                     fillOpacity: 0.2
     								});	
     							} 
     						}
     						logger("----------- [ 산업체 조회 조회 성공 ] -----------");
     						logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>");
     						sopArea.eachLayer(function (layer) {
     							key = layer.feature.properties.adm_cd;
     							value = conComplite[key];
     							strToolTip = "<p>지역(구)명 : " + value.adm_nm + "</p>";
     							strToolTip += "<p>지역코드 : " + value.adm_cd + "</p>";
     							strToolTip += "<p>카폐수(개) : " + value.corp_cnt + "</p>";
     	
     							layer.bindToolTip(strToolTip);
     							
     						});
     						
     					}
                     });
			}
			});
	});
	function divLogger() {
		var lineNum = 0;
		var prefix = "";
		return function (str) {
			prefix = lineNum++ + " : ";
			str = prefix + str;
			if (divConsole.innerHTML.length < 300000) {
				divConsole.innerHTML +=  str;
			} else {
				divConsole.innerHTML =  str;
			}
			divConsole.innerHTML += "<br>";
			//console.log(divConsole);
			divConsole.scrollTop = divConsole.scrollHeight;
			//divConsole.scrollHeight = 999999;
		};
	} 
});
</script>
</body>
</html>
