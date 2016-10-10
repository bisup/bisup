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
  var accessToken = 'c9426431-06cb-4f7b-9f46-9d99bf16dab3';
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
		   var year = "2012";
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
				adm_cd = "11010";
                     $.ajax({ 
     		            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/startupbiz/sggtobcorpcount.json' +
     		          	'?accessToken='+accessToken+'&theme_cd='+theme_cd,
     		            type : 'get',
     		            datatype:'json',
     					success: function (res,status) {
     						var idx, len, target, conComplite = {}, key, value, strToolTip;
     						target = res.result;
     		     			for (idx = 0, len = target.length; idx < len; idx ++) {
     							conComplite[target[idx].sido_cd] = target[idx];
     						}
     						logger("----------- [ 산업체 조회 조회 성공 ] -----------");
     						logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>");
     						sopArea.eachLayer(function (layer) {
     							key = layer.feature.properties.sido_cd;
     							value = conComplite[key];

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
