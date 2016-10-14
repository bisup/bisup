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
  	<link rel="stylesheet" href="/bisup/css/jang.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=bce731c194bf44debe25"></script>
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
</head>

<body>
<!-- gu/dong선택 -->
<div id="dongS">
<h4>지역을 선택해주세요</h4>
<table class="table" style="position: relative; width:150px; text-align:center;">
 
  	<tr align="center">
 <c:forEach items="${list}" var="list"  end="8">
      <td> <button value="${list.gcode}" class="gcode" id="gu">${list.gn}</button></td>
	</c:forEach> 
	</tr>   
	<tr align="center">
  	<c:forEach items="${list }" var="list" begin="9" end="17">
      <td><button value="${list.gcode}" class="gcode" id="gu">${list.gn}</button></td>
	</c:forEach> 
	</tr>    
	<tr align="center">
  	<c:forEach items="${list }" var="list" begin="18" end="24">
     <td><button value="${list.gcode}" class="gcode" id="gu">${list.gn}</button></td>
	</c:forEach> 
	</tr>  
 	</table>
 	
 <div id="dcode"></div>
         </div> <!-- gu/dong선택 종료 -->
         <br>
         <br>
         <br>
<div id="map" style="width:650px;height:400px"></div> <!-- 지도 구역 구간 -->
<div id="ageR"></div><!--  연령별 비율 차트 구간 -->


<!-- <button id="addArea">경계조회</button>
<button id="addStatistic">인구통계조회</button>
<button id="clear">지도초기화</button>-->
<div id="divCon"> --------------console구간---------</div> 


 <script type="text/javascript">
  var accessToken = 'b87efa4b-70d0-408f-9c15-ae2686fc9919';
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
	} //token 받기 종료

	//sop.DomUtil.get("addarea").onclick = gcode;
	
	//sop.DomUtil.get("addStatistic").onclick = addStatistic;
	//sop.DomUtil.get("clear").onclick = clear;
	divConsole = sop.DomUtil.get("divCon");

	/* 지도에 경계띄우기 : 구버튼클릭했을때 동경계보여주기*/
	$('.gcode').click(function addArea() {
		/* 다른거 클릭하면 없어지는지 확인 */
	  	if (sopArea) {
			sopArea.remove();
			sopArea = undefined;
			oriArea = undefined;
					}  
        var year = "2013";
     	var adm_cd =$(this).val();
		
      	alert("adm_cd"+adm_cd);
		
      	$.ajax({
          	url : 'http://sgisapi.kostat.go.kr/OpenAPI3/boundary/hadmarea.geojson' +
          		'?accessToken='+ accessToken +'&year='+year+'&adm_cd='+adm_cd+'&low_search='+1,	
          	type : 'get',
	 		 datatype : "geojson",
			success: function( res,status) {
                oriArea = res;
				sopArea = sop.geoJson(res).addTo(map);
				map.fitBounds(sopArea.getBounds());
				/*  logger("경계조회 결과");
				logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>");  */
				var idx, len, target, conComplite = {}, key, value, strToolTip;
				target = res.result;
  
				for (idx = 0, len = target.length; idx < len; idx ++) {
					conComplite[target[idx].adm_cd] = target[idx];
				}

				/* logger("----------- [ 가구통계 조회 성공 ] -----------");
				logger("<pre>" + JSON.stringify(res, null, 2) + "</pre>"); */
				sopArea.eachLayer(function (layer) {
					key = layer.feature.properties.adm_cd;
					value = conComplite[key];

					if (!value) { return; }

					strToolTip = "<p>지역명 : " + value.adm_nm + "</p>";

					layer.bindToolTip(strToolTip);
			});
		}
      	}); 
	}   
			 /* addArea()종료 */ 
		); /* 클릭펑션종료 */

	
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
	
	$('#dong').click(
		function addStatistic() {
		
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
				
				$("#dcode").append("<button value='"+args.data[idx].dcode+"' class='dcode' id=dong>"+args.data[idx].dn+"</button>");
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

