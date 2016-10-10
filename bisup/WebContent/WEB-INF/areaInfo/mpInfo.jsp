<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<title>SOP JavaScript Unit TEST: Service population</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">
  	</script>
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=ed2cc2868ea14215a368"></script>
</head>
<style type="text/css">
	#divCon {
		margin: 5px 0;
		width: 660px;
		height: 160px;
		overflow-x:hidden;
		overflow-y:auto;
		border: 2px dotted #3388ff;
	}

</style>
<body>
<div id="map" style="width:650px;height:400px"></div>
<button id="addArea">경계조회</button>
<button id="addStatistic">인구통계조회</button>
<button id="clear">지도초기화</button>
<div id="divCon"></div>

<script type="text/javascript">
  var accessToken = parent.document.getElementById("accessToken").value;
  var consumer_key = parent.document.getElementById("consumer_key").value;
  var consumer_secret = parent.document.getElementById("consumer_secret").value;
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

	sop.DomUtil.get("addArea").onclick = addArea;
	sop.DomUtil.get("addStatistic").onclick = addStatistic;
	sop.DomUtil.get("clear").onclick = clear;
	divConsole = sop.DomUtil.get("divCon");

	function addArea() {
		if (sopArea) {
			sopArea.remove();
			sopArea = undefined;
			oriArea = undefined;
		}  
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
	}

	function addStatistic() {
		if (!oriArea) {
			alert("경계조회를 먼저 하세요");
			return;
		}

          var year = "2010";
          var adm_cd = "11";
          var low_search = "1";
          $.ajax({
            url : 'http://sgisapi.kostat.go.kr/OpenAPI3/stats/population.json' +
          	'?accessToken='+accessToken+'&year='+year+'&adm_cd='+adm_cd+
            '&low_search=' +low_search,
            type : 'get',
			success: function (res,status) {
				// 맵형태로 변환 한다.
				var idx, len, target, conComplite = {}, key, value, strToolTip;
				target = res.result;

				for (idx = 0, len = target.length; idx < len; idx ++) {
					conComplite[target[idx].adm_cd] = target[idx];
				}

				logger("----------- [ 가구통계 조회 성공 ] -----------");
				logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>");
				sopArea.eachLayer(function (layer) {
					key = layer.feature.properties.adm_cd;
					value = conComplite[key];

					if (!value) { return; }

					strToolTip = "<p>지역(구)명 : " + value.adm_nm + "</p>";
					strToolTip += "<p>총인구 : " + value.tot_ppltn + "</p>";
					strToolTip += "<p>평균나이(세) : " + value.avg_age + "</p>";
					strToolTip += "<p>인구밀도(명/㎢) : " + value.ppltn_dnsty + "</p>";
					strToolTip += "<p>노령화지수(%) : " + value.aged_child_idx + "</p>";
					strToolTip += "<p>노년부양비(%) : " + value.oldage_suprt_per + "</p>";
					strToolTip += "<p>유년부양비(%) : " + value.juv_suprt_per + "</p>";
                  	strToolTip += "<p>총가구 : " + value.tot_family + "</p>";
                	strToolTip += "<p>평균가구원수 : " + value.avg_fmember_cnt + "</p>";
                  	strToolTip += "<p>총주택 : " + value.tot_house + "</p>";
             		strToolTip += "<p>농가(가구) : " + value.nongga_cnt + "</p>";
                  	strToolTip += "<p>농가 인구 : " + value.nongga_ppltn + "</p>";
                  	strToolTip += "<p>임가(가구) : " + value.imga_cnt + "</p>";
                  	strToolTip += "<p>임가 인구 : " + value.imga_ppltn + "</p>";
                  	strToolTip += "<p>내수면 어가(가구) : " + value.naesuoga_cnt + "</p>";
                  	strToolTip += "<p>내수면 인구 : " + value.naesuoga_ppltn + "</p>";
                  	strToolTip += "<p>해수면 어가(가구) : " + value.haesuoga_cnt + "</p>";
                  	strToolTip += "<p>해수면 인구 : " + value.haesuoga_ppltn + "</p>";
               		strToolTip += "<p>종업원수(전체 사업체) : " + value.employee_cnt + "</p>";
                  			strToolTip += "<p>사업체수(전체 사업체) : " + value.corp_cnt + "</p>";

					layer.bindToolTip(strToolTip);
				});

			}
		});
	}

	function clear() {
		if (sopArea) {
			sopArea.remove();
		}
		sopArea = undefined;
		oriArea = undefined;
		divConsole.innerHTML = "";
		logger("------------- 지도초기화 완료 -------------");
	}

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
//			console.log(divConsole);
			divConsole.scrollTop = divConsole.scrollHeight;
//			divConsole.scrollHeight = 999999;
		};
	}

</script>
</body>
</html>

