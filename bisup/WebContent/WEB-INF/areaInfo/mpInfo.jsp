<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<% 
	String cp = request.getContextPath(); //웹컨텐츠앞경로까지 가져오기 (프로젝트명)
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>

	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  	<script src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
  	
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=bce731c194bf44debe25"></script>
<style type="text/css">
.gcode{
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
	line-height:20px;
	-moz-border-radius:15px;
	-webkit-border-radius:15px;
	border-radius:15px;
	text-align:center;
	vertical-align:middle;  
	display:inline-block;
	font-size:15px;
	color:#0f0f0f;
	width:80px;
	height:30px;
	padding:5px;
	text-shadow:#dfe6e8 2px 2px 0px;
	border-color:#fff7ff;
	border-width:1px;
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
	#divCon {
		margin: 5px 0;
		width: 660px;
		height: 160px;
		overflow-x:hidden;
		overflow-y:auto;
		border: 2px dotted #3388ff;
	}
</style>
</head>

<body>
<!-- gu/dong선택 -->
<div id="dongS">
<h4>지역을 선택해주세요</h4>
<table class="table" style="position: relative; width:150px; text-align:center;">
 
  	<tr align="center">
 <c:forEach items="${list}" var="list"  end="8">
      <td> <button value="${list.gcode}" class="gcode" >${list.gn}</button></td>
	</c:forEach> 
	</tr>   
	<tr align="center">
  	<c:forEach items="${list }" var="list" begin="9" end="17">
      <td><button value="${list.gcode}" class="gcode">${list.gn}</button></td>
	</c:forEach> 
	</tr>    
	<tr align="center">
  	<c:forEach items="${list }" var="list" begin="18" end="24">
     <td><button value="${list.gcode}" class="gcode">${list.gn}</button></td>
	</c:forEach> 
	</tr>  
 	</table>
 	
 <div id="dcode"></div>
         </div> <!-- gu/dong선택 종료 -->
         <br>
         <br>
         <br>
<div id="map" style="width:650px;height:400px"></div>
<button id="addArea">경계조회</button>
<button id="addStatistic">인구통계조회</button>
<button id="clear">지도초기화</button>
<div id="divCon"></div>


 <script type="text/javascript">
  var accessToken = '0d5dc53e-b0d6-484a-9c37-286de2409e68';
  var consumer_key = "bce731c194bf44debe25";
  var consumer_secret = 'b91c3a3960a146b5b79e';
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

	$('.gcode').click(function addArea() {
		if (sopArea) {
			sopArea.remove();
			sopArea = undefined;
			oriArea = undefined;
		}  
        var year = "2010";
      	var adm_cd = $('.gcode').val();
		$.ajax({
          url : 'http://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson' +
          		'?accessToken='+ accessToken +'&year='+year+'&adm_cd='+adm_cd+'&low_search='+1,	
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

/* 	function addStatistic() {
		if (!oriArea) {
			alert("경계조회를 먼저 하세요");
			return;
		}

          
          var adm_cd = "11040";
         
          $.ajax({
            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/startupbiz/pplsummary.json' +
          	'?accessToken='+accessToken+'&adm_cd='+adm_cd
            ,
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
					strToolTip += "<p>10대미만: " + value.teenage_less_than_per + "</p>";
					strToolTip += "<p>10대 : " + value.teenage_per + "</p>";
					strToolTip += "<p>20 : " + value.twenty_per + "</p>";
					strToolTip += "<p>30 : " + value.thirty_per + "</p>";
					strToolTip += "<p>40: " + value.forty_per + "</p>";
					strToolTip += "<p>50 : " + value.fifty_per + "</p>";
                  	strToolTip += "<p>60 : " + value.sixty_per + "</p>";
                	strToolTip += "<p>70 : " + value.seventy_more_than_per + "</p>";
                  	

					layer.bindToolTip(strToolTip);
				});

			}
		});
	}  */
	
	$('#dong').click(function addStatistic() {
		
		if (!oriArea) {
			alert("경계조회를 먼저 하세요");
			return;
		}

          
          var adm_cd = $('#dong').val();
         
          $.ajax({
            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/startupbiz/mfratiosummary.json' +
          	'?accessToken='+accessToken+'&adm_cd='+adm_cd
            ,
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
					strToolTip += "<p>f_per : " + value.f_per + "</p>";
					strToolTip += "<p>m_per : " + value.m_per + "</p>";
					strToolTip += "<p>f_ppl : " + value.f_ppl + "</p>";
					strToolTip += "<p>m_ppl: " + value.m_ppl + "</p>";
					strToolTip += "<p>total_ppl: " + value.total_ppl + "</p>";
                  
                  	

					layer.bindToolTip(strToolTip);
				});

			}
		});
	});
	

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
 
<script>
 
 $('.gcode').click(function dongS() {
 	var g=$(this).val();
	var url="/bisup/my/areaInfo/mpInfo.do";
	var params ="gcode="+g;
	
	$("#dcode button").each(function(){
		//id가 city 이며 option인 요소를
		$("#dcode button:eq(0)").remove();
		//city option의 1번째를 계속 삭제(0번째만 남기고 모두 지우게 된다. )
		//eq : 지정된 index번째의 엘리먼트 선택
	});

	$.ajax({
		type:"post" // 포스트방식
		,url:url //url주소
		,data:params //요청에 전달되는 프로퍼티를 가진 객체
		,dataType:"json" //리턴된 데이터타입 : json타입으로 받겠다 
		,success:function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수
			
			for(var idx=0; idx<args.data.length; idx++){
				
				$("#dcode").append("<button value='"+args.data[idx].dcode+"' class='gcode' id=dong>"+args.data[idx].dn+"</button>");
				//alert(args.data1[idx].dn);
				//$("#city").append("<option value='"+args.data1[idx]+"'>"+args.data1[idx]+"</option>");	
				
			}
		}
	,error:function(e){
		//이곳의 ajax에서 에러가 나면 알러창으로 에러 메시지 출력
		alert(e.responseText);
		
	}
	});  
 });  
</script>





</body>
</html>

