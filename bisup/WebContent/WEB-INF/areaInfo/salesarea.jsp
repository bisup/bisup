<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>  
<html>

<head>
    <title>SOP JavaScript : Polygon sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=ed2cc2868ea14215a368"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  		
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div align="center" class="container">
<br>
<h2>상권정보검색</h2><br><br>
<div id="map" style="width:650px;height:400px"></div>
<button id="addStatistic">인구통계조회</button>
<div id="divCon"></div>

</div>
<script type="text/javascript">
  var accessToken = 'd6b85358-fde8-45f2-8d21-a78888402a6e';
  var consumer_key = 'ed2cc2868ea14215a368';
  var consumer_secret = 'b2d23f3f8e314efa8896';
	var map, mapOptions, oriArea, sopArea, logger, divConsole, polygons;
	logger = divLogger();
	mapOptions = {
		ollehTileLayer: true,
		measureControl: false,
		zoomSliderControl: false,
		panControl: false,
		attributionControl: false
	};

	map = sop.map("map", mapOptions);
	map.setView([953427, 1950827], 0);

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

	$(document).ready(function addArea() {
		   var year = "2013";
	      	var adm_cd = "11";
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
     		          	'?accessToken='+accessToken+'&year='+year+'&area_type='+0+'&theme_cd='+theme_cd+'&adm_cd='+11010,
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

</script>
</body>
</html>
