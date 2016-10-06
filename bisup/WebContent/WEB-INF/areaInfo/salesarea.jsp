<%@ page contentType="text/html; charset=UTF-8"%>
<%-- 
<!DOCTYPE html>
<html>

<head>
    <title>SOP JavaScript : Polygon sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=ed2cc2868ea14215a368"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
</head>

<body>
<div>
<div align="center" class="container">
<br>
<h2>상권정보검색</h2><br><br>
<div>
<div style="width:310;height:254;" align="left">
				<form >
						<div class="seoulMap" align="left">

							<img id="searchGuMap" onmouseout="mouseOutMap();"
								src="/bisup/resources/img/seoul_map.png" alt="서울특별시 자치구 선택" width="310"
								height="254" usemap="#seoulMap" class="mapImg" align="left">


							<map name="seoulMap">
								<area alt="종로구_23" onmouseover="mouseOverMap('whdfh');"
									shape="poly"
									coords="142,65,135,72,135,86,138,88,139,93,142,97,140,114,148,125,152,122,169,123,188,121,188,113,179,112,172,102,162,101,155,96,162,89,158,68,153,63,142,66"
									href="/FORKI/content/findKinder/findkinder.do?gu=23&dong=&schul_nm=">
								<area alt="중구_25" onmouseover="mouseOverMap('wndrn');"
									shape="poly"
									coords="144,131,149,129,147,125,151,123,160,123,174,123,188,121,192,126,177,145,174,140,169,143,161,137,149,135,145,138,143,130"
									href="/FORKI/content/findKinder/findkinder.do?gu=25&dong=&schul_nm=">
								<area alt="용산구_21" onmouseover="mouseOverMap('dydtks');"
									shape="poly"
									coords="136,153,145,139,151,135,161,137,169,143,174,141,185,153,158,177,139,170,136,153"
									href="/FORKI/content/findKinder/findkinder.do?gu=21&dong=&schul_nm=">
								<area alt="성동구_16" onmouseover="mouseOverMap('tjdehd');"
									shape="poly"
									coords="177,146,192,127,188,122,196,122,202,118,219,130,226,130,214,158,196,149,190,149,184,153,177,146"
									href="/FORKI/content/findKinder/findkinder.do?gu=16&dong=&schul_nm=">
								<area alt="광진구_6" onmouseover="mouseOverMap('rhkdwls');"
									shape="poly"
									coords="214,158,229,122,241,122,247,118,249,122,247,126,248,132,252,132,249,147,234,161,222,162,214,158"
									href="/FORKI/content/findKinder/findkinder.do?gu=6&dong=&schul_nm=">
								<area alt="동대문구_11" onmouseover="mouseOverMap('ehdeoans');"
									shape="poly"
									coords="188,121,188,113,210,93,217,93,224,88,223,79,226,94,224,101,229,117,226,130,219,130,201,117,196,122,187,120"
									href="/FORKI/content/findKinder/findkinder.do?gu=11&dong=&schul_nm=">
								<area alt="중랑구_24" onmouseover="mouseOverMap('wndfkd');"
									shape="poly"
									coords="224,87,224,79,231,77,250,75,258,76,259,91,256,95,259,100,252,109,246,118,241,122,228,122,229,117,224,102,226,94,224,87"
									href="/FORKI/content/findKinder/findkinder.do?gu=24&dong=&schul_nm=">
								<area alt="성북구_17" onmouseover="mouseOverMap('tjdqnr');"
									shape="poly"
									coords="153,63,158,69,162,89,155,97,162,101,172,102,179,112,188,113,203,98,210,93,216,93,224,87,224,79,217,80,208,73,197,85,188,84,179,79,179,74,160,59,152,64"
									href="/FORKI/content/findKinder/findkinder.do?gu=17&dong=&schul_nm=">
								<area alt="강북구_3" onmouseover="mouseOverMap('rkdqnr');"
									shape="poly"
									coords="177,17,184,28,181,45,187,49,208,73,197,85,188,84,180,79,178,72,160,58,161,50,157,42,161,35,167,33,168,19,177,17"
									href="/FORKI/content/findKinder/findkinder.do?gu=3&dong=&schul_nm=">
								<area alt="도봉구_10" onmouseover="mouseOverMap('ehqhd');"
									shape="poly"
									coords="177,16,181,1,194,3,197,10,201,6,208,9,210,16,209,32,212,39,212,57,207,54,202,65,189,50,181,46,184,33,184,26,177,16"
									href="/FORKI/content/findKinder/findkinder.do?gu=10&dong=&schul_nm=">
								<area alt="노원구_9" onmouseover="mouseOverMap('shdnjs');"
									shape="poly"
									coords="210,15,210,23,209,29,212,38,212,57,207,55,202,66,217,80,232,76,249,75,255,65,253,54,244,53,240,48,240,34,242,28,239,20,243,16,242,11,235,10,229,5,217,8,210,14"
									href="/FORKI/content/findKinder/findkinder.do?gu=9&dong=&schul_nm=">
								<area alt="은평구_22" onmouseover="mouseOverMap('dmsvud');"
									shape="poly"
									coords="100,114,84,102,96,103,98,87,110,53,132,38,141,45,143,64,135,71,135,85,129,91,129,96,124,98,112,109,108,106,100,114"
									href="/FORKI/content/findKinder/findkinder.do?gu=22&dong=&schul_nm=">
								<area alt="서대문구_14" onmouseover="mouseOverMap('tjeoans');"
									shape="poly"
									coords="101,114,109,106,112,109,119,105,129,96,129,92,135,86,138,88,139,94,143,99,140,114,149,128,140,133,125,134,101,114"
									href="/FORKI/content/findKinder/findkinder.do?gu=14&dong=&schul_nm=">
								<area alt="마포구_13" onmouseover="mouseOverMap('akvh');"
									shape="poly"
									coords="84,103,79,113,67,117,99,141,116,145,129,149,136,153,145,138,144,132,133,133,125,134,84,103"
									href="/FORKI/content/findKinder/findkinder.do?gu=13&dong=&schul_nm=">
								<area alt="양천구_19" onmouseover="mouseOverMap('didcjs');"
									shape="poly"
									coords="45,141,42,150,45,159,41,177,47,177,52,183,65,176,73,181,79,181,84,162,91,156,85,141,72,140,71,156,55,160,45,143"
									href="/FORKI/content/findKinder/findkinder.do?gu=19&dong=&schul_nm=">
								<area alt="강서구_4" onmouseover="mouseOverMap('rkdtj');"
									shape="poly"
									coords="54,111,29,87,22,95,26,101,0,132,2,138,16,143,20,151,27,146,42,149,46,141,55,160,71,156,72,140,84,141,82,136,64,124,54,111"
									href="/FORKI/content/findKinder/findkinder.do?gu=4&dong=&schul_nm=">
								<area alt="구로구_7" onmouseover="mouseOverMap('rnfh');"
									shape="poly"
									coords="41,177,38,187,34,188,41,196,39,203,36,208,38,210,42,207,57,209,59,202,63,202,76,191,80,197,90,203,98,204,99,201,92,180,83,168,80,181,73,182,69,177,64,177,52,183,47,177,40,177"
									href="/FORKI/content/findKinder/findkinder.do?gu=7&dong=&schul_nm=">
								<area alt="금천구_8" onmouseover="mouseOverMap('rmacjs');"
									shape="poly"
									coords="79,197,79,204,88,222,87,227,93,231,95,230,95,237,103,247,107,242,112,241,119,233,114,226,106,216,105,204,98,205,89,203,78,196"
									href="/FORKI/content/findKinder/findkinder.do?gu=8&dong=&schul_nm=">
								<area alt="영등포구_20" onmouseover="mouseOverMap('dudemdvh');"
									shape="poly"
									coords="83,136,91,156,84,163,84,169,92,179,99,200,107,190,113,187,119,172,133,171,134,158,126,153,100,147,83,136"
									href="/FORKI/content/findKinder/findkinder.do?gu=20&dong=&schul_nm=">
								<area alt="동작구_12" onmouseover="mouseOverMap('ehdwkr');"
									shape="poly"
									coords="99,201,107,190,113,187,120,172,134,171,159,183,159,209,146,205,144,194,128,193,119,192,98,201"
									href="/FORKI/content/findKinder/findkinder.do?gu=12&dong=&schul_nm=">
								<area alt="관악구_5" onmouseover="mouseOverMap('rhksdkr');"
									shape="poly"
									coords="98,205,100,200,119,193,126,193,144,195,145,204,150,208,158,210,163,217,163,225,152,229,146,236,142,242,133,243,128,245,118,230,106,216,105,205,98,205"
									href="/FORKI/content/findKinder/findkinder.do?gu=5&dong=&schul_nm=">
								<area alt="서초구_15" onmouseover="mouseOverMap('tjch');"
									shape="poly"
									coords="159,209,159,183,173,169,179,165,185,164,197,200,202,201,209,216,219,215,228,208,234,209,243,225,238,229,234,239,224,240,225,244,222,249,209,250,199,241,198,231,198,225,194,219,191,222,183,227,177,224,176,218,169,217,168,221,162,225,163,217,159,209"
									href="/FORKI/content/findKinder/findkinder.do?gu=15&dong=&schul_nm=">
								<area alt="강남구_1" onmouseover="mouseOverMap('rkdska');"
									shape="poly"
									coords="179,165,192,155,202,158,221,167,224,183,250,193,263,217,258,223,249,222,243,225,235,217,238,216,231,208,220,215,211,216,204,202,197,201,185,165,179,164"
									href="/FORKI/content/findKinder/findkinder.do?gu=1&dong=&schul_nm=">
								<area alt="송파구_18" onmouseover="mouseOverMap('thdvk');"
									shape="poly"
									coords="221,168,226,183,250,194,263,217,269,215,269,210,275,210,282,201,290,193,289,184,277,182,274,177,277,171,260,160,263,152,259,149,253,149,249,156,242,162,230,166,221,168"
									href="/FORKI/content/findKinder/findkinder.do?gu=18&dong=&schul_nm=">
								<area alt="강동구_2" onmouseover="mouseOverMap('rkdehd');"
									shape="poly"
									coords="254,149,259,139,259,133,269,125,281,123,300,112,302,118,306,133,306,145,292,146,277,172,260,160,264,153,259,150,253,149"
									href="/FORKI/content/findKinder/findkinder.do?gu=2&dong=&schul_nm=">
							</map>
						</div>
				</form>
			</div>
<div id="map" style="width:500px;height:400px;position: relative;" align="right" ></div></div></div>
<br>
<br>
<table  class="table">
  <thead>
  <tr>
		<th>#</th>
		<th>지역구</th>
		<th>위험지수</th>
		<th>평균폐업기간</th>
		<th>점포증감률</th>
		<th>신규창업 위험 지수 값</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
		<td>1</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	      <tr>
		<td>2</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	      <tr>
		<td>3</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	    </tbody>
</table>

<h3>상권위험지수</h3>
<br>
<table  class="table">
  <thead>
  <tr>
		<th>#</th>
		<th>지역구</th>
		<th>위험지수</th>
		<th>평균폐업기간</th>
		<th>점포증감률</th>
		<th>신규창업 위험 지수 값</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
		<td>1</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	      <tr>
		<td>2</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	      <tr>
		<td>3</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
		<td>Table cell</td>
	      </tr>
	    </tbody>
</table>
</div>
<script type="text/javascript">

    var map = sop.map("map"); //map 생성

    map.setView(sop.utmk(953427, 1950827), 5); // 지도 중심좌표로 뷰 설정

    //지도에 표시되는 폴리곤 데이터
    
    //폴리곤 생성
  

    
</script>
<script type="text/javascript">
function mouseOverMap(guCode)
{
	document.getElementById('searchGuMap').src = "/bisup/resources/map/"+guCode+".png";
}

function mouseOutMap()
{
	
	document.getElementById('searchGuMap').src = "/bisup/resources/img/seoul_map.png";
  
}
</script> 
		
</body>

</html> --%>


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
<script type="text/javascript">
  var accessToken = 'fe93c398-00cb-4f02-b471-eedfd39e9fe0';
  var consumer_key = 'ed2cc2868ea14215a368';
  var consumer_secret = 'ed2cc2868ea14215a368';
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

	$(document).ready(function addArea() {
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
	});

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
