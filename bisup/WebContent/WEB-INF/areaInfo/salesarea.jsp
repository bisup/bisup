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
<style type="text/css">
.gcode {
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 3px 2px;
	background:#f7f7f7;
	background:-o-linear-gradient(90deg, #f7f7f7, #ffffff);
	background:-moz-linear-gradient( center top, #f7f7f7 5%, #ffffff 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f7f7f7), color-stop(1, #ffffff) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f7f7f7', endColorstr='#ffffff');
	background:-webkit-linear-gradient(#f7f7f7, #ffffff);
	background:-ms-linear-gradient(#f7f7f7, #ffffff);
	background:linear-gradient(#f7f7f7, #ffffff);
	text-indent:0px;
	line-height:30px;
	-moz-border-radius:25px;
	-webkit-border-radius:25px;
	border-radius:25px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:20px;
	color:#0f0f0f;
	width:100px;
	height:30px;
	padding:13px;
	text-shadow:#dfe6e8 2px 2px 0px;
	border-color:#fff7ff;
	border-width:2px;
	border-style:solid;
}

.gcode:active {
	box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#fffaff 1px 0 2px;
	position:relative;
	top:3px
}

.gcode:hover {
	background:#ffffff;
	background:-o-linear-gradient(90deg, #ffffff, #f7f7f7);
	background:-moz-linear-gradient( center top, #ffffff 5%, #f7f7f7 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f7f7f7) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f7f7f7');
	background:-webkit-linear-gradient(#ffffff, #f7f7f7);
	background:-ms-linear-gradient(#ffffff, #f7f7f7);
	background:linear-gradient(#ffffff, #f7f7f7);
}
</style>
</head>
<body>
<div align="center" class="container">
<br>
<h2>상권정보검색</h2><br><br>
<table class="table" style="position: relative; width:auto; ">
  <thead>
  <tr align="center">
  <c:forEach items="${list }" var="list"  end="4">
      <td align="center"> <button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>   
<tr align="center">
  <c:forEach items="${list }" var="list" begin="5" end="9">
      <td> <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>    
<tr align="center">
  <c:forEach items="${list }" var="list" begin="10" end="14">
      <td> <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>  
<tr align="center">
  <c:forEach items="${list }" var="list" begin="15" end="19">
      <td> <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr>  
<tr align="center">
  <c:forEach items="${list }" var="list" begin="20" end="24">
      <td> <td><button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
</c:forEach> </tr> 
         </tbody></table>
<div id="map" style="width:650px;height:400px"></div>
<div id="divCon"></div>

</div>
<script type="text/javascript">
$(document).ready(function(){
  var accessToken = '8884b37d-ea29-4ae9-ad82-88df0af05f9b';
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

	$('.gcode').click(function addArea() {
		   var year = "2013";
	      	var adm_cd = $(this).val() ;
	      	var theme_cd="5010"
			$.ajax({
	          url : 'http://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson' +
	          		'?accessToken='+ accessToken +'&year='+year+'&adm_cd='+adm_cd,
         type : 'get',    
	  datatype : "geojson",
			success: function( res,status) {
				if (sopArea) {
					sopArea.remove();
					sopArea = undefined;
					oriArea = undefined;
				}
               oriArea = res;
				sopArea = sop.geoJson(res).addTo(map);
				map.fitBounds(sopArea.getBounds());
				
                     $.ajax({                     
     		            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/stats/company.json' +
     		          	'?accessToken='+accessToken+'&year='+year+'&area_type='+0+'&theme_cd='+theme_cd+'&adm_cd='+adm_cd+'&low_search='+1,
     		            type : 'get',
     		            datatype:'json',
     					success: function (res,status) {
     						 alert("내용:"+adm_cd); 
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
