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
  var accessToken = '21df932c-7e7e-4b95-bcc1-0811ca0842c9';
  var consumer_key = 'ed2cc2868ea14215a368';
  var consumer_secret = 'b2d23f3f8e314efa8896';
	var map, mapOptions, oriArea, sopArea, logger, divConsole;
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
		   var year = "2010";
	      	var adm_cd = "11";
			$.ajax({
	          url : 'http://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson' +
	          		'?accessToken='+ accessToken +'&year='+year+'&adm_cd='+adm_cd,
         type : 'get',    
	  datatype : "geojson",
			success: function( res,status) {
               oriArea = res;
				sopArea = sop.geoJson(res).addTo(map);
				map.fitBounds(sopArea.getBounds());
				logger("경계조회 결과");
				logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>");
			}
		});
			 $.ajax({  
		            url : 'http://sgisapi.kostat.go.kr/OpenAPI3/stats/company.json' +
		          	'?accessToken='+accessToken+'&year='+year,
		            type : 'get',
					success: function (res,status) {
						// 맵형태로 변환 한다.
						var idx, len, target, conComplite = {}, key, value, strToolTip;
						target = res.result;

						for (idx = 0, len = target.length; idx < len; idx ++) {
							conComplite[target[idx].adm_cd] = target[idx];
						}
						sopArea.eachLayer(function (layer) {
							key = layer.feature.properties.adm_cd;
							value = conComplite[key];
							if (!value) { return; }
							strToolTip = "<p>지역(구)명 : " + value.adm_nm + "</p>";
							strToolTip += "<p>지역(구)코드 : " + value.adm_cd + "</p>";
							strToolTip += "<p>사업체 수 : " + value.corp_cnt + "</p>";
							strToolTip += "<p>종사자수  : " + value.tot_worker + "</p>";
							layer.bindToolTip(strToolTip);
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
