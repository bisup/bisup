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
<style>
#content {
    clear: both;
    width: 2200px;
    min-height: 400px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
    padding-left:18%;
}
.tb_date{
   
    table-layout: fixed;
    border: 0;
    border-spacing: 0;
    border-top: 3px solid #444;
    background: #fff;
    overflow: hidden;
    
}
#th{
    padding: 12px;
    height: 24px;
    border: 0;
    border-left:  solid #cbcbcb;
    border-bottom: 1px solid #cbcbcb;
    text-align: center;
}

.tb_date>tbody>tr>td{
	padding: 12px;
    height: 24px;
    border-left: 0px solid #cbcbcb;
    border-bottom: 2px solid #cbcbcb;
    text-align: center;
    table-layout: fixed;
    border: 1;
    border-spacing: 0;
    border-top: 3px solid #444;
    overflow: hidden;
} 



</style>
</head>

<body>
<!-- gu/dong선택 -->
<div id="wrap" align="center">
<div id="dongS">

<div id="header">
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
</div>

 <div id="dcode"></div>
         </div> <!-- gu/dong선택 종료 -->
         <br>
         <br>
         <br>
 <div id="content">         
 <div id="main" style="margin-bottom: 500px; width: 2200px; ">
<div id="left_main"style="float:left; width:660px;">
<div id="map" style="width:660px;height:400px;"></div> <!-- 지도 구역 구간 -->	
			</div>


    
  



 <script type="text/javascript">
 $(document).ready(function(){
  var accessToken = '';
  var consumer_key = "bce731c194bf44debe25";
  var consumer_secret = 'b91c3a3960a146b5b79e';
	
  var map, mapOptions, oriArea, sopArea, logger, divConsole;
  var idx, len, target, conComplite = {}, key, value, strToolTip;
	
	mapOptions = {
		ollehTileLayer: true,
		measureControl: false,
		zoomSliderControl: false,
		panControl: false,
		attributionControl: false
	};

	map = sop.map("map", mapOptions);
	map.setView([953427, 1950827], 0);

	$.ajax({
        url : 'http://sgisapi.kostat.go.kr/OpenAPI3/auth/authentication.json' +
        		'?consumer_key=bce731c194bf44debe25&consumer_secret=b91c3a3960a146b5b79e',
        type : 'get',
        success: function(res, status) {
				accessToken = res.result.accessToken;
			}
		});


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
		var gcode=$(this).val();
      
		
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
				
				//*******구 경계나눴을때 동이름 띄우기!!
				
				var g=gcode;
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
					
					
				
				}
				
					$('.dcode').click(function addStatistic() {

						var adm_cd = $(this).val();
				
				          $.ajax({
				            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/startupbiz/mfratiosummary.json' +
				          	'?accessToken='+accessToken+'&adm_cd='+adm_cd
				            ,
				            type : 'get',
							success: function (res,status) {
								// 맵형태로 변환 한다.
								
								 target = res.result;
				     						$(".tbody1").find("tr").remove(); 
				     		     			//for (idx = 0, len = target.length; idx < len; idx ++) {
				     							 value=target[0];
				     							
				     							
				     		 $(".tbody1").append("<tr><td>"+value.adm_nm+"</td><td>"+value.total_ppl+"</td><td>"+value.f_ppl+"</td><td>"+value.m_ppl+"</td></tr>");  
				     							/* var chartlist1=[];
				     					 		chartlist.push(value.total_ppl);
				     					 		chartlist.push(value.f_ppl);
				     					 		chartlist.push(value.m_ppl);
				     					 		chartlist.push(value.adm_nm);
				     					 		
				     					 		$.ajaxSettings.traditional = true;
				     							$.ajax({
				     						          type: 'get',
				     								  url: '/bisup/my/areaInfo/chartBar.do',
				     								  dataType : 'html',
				     								  data : {'chartlist1' : chartlist1},
				     								  success: 
				     										function(data) {
				     								     	$("#chartBar").html(data);
				     								       	$("#chartBar").css("display","block");
				     								    	}
				     							});		  */
				     		  
							}
							});
						}); //dong버튼클릭
						
						$('.dcode').click(function ageRate() {
							var adm_cd = $(this).val();
						 
							  $.ajax({
						            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/startupbiz/pplsummary.json' +
						          	'?accessToken='+accessToken+'&adm_cd='+adm_cd
						            ,
						            type : 'get',
									success: function (res,status) {
										// 맵형태로 변환 한다.
									
										 target = res.result;
						     						
						     		     			//for (idx = 0, len = target.length; idx < len; idx ++) {
						     							
						     							 value=target[0];
						     							
						     							
						     					/*  $(".tbody2").append("<tr><td><td>"+conComplite[key].adm_nm+
						     									 "</td><td>"+conComplite[key].teenage_less_than_per+
						     									 "</td><td>"+conComplite[key].teenage_per+"</td><td>"
						     									 +conComplite[key].twenty_per+"</td><td>"+
						     									 conComplite[key].thirty_per+"</td><td>"+conComplite[key].forty_per+
						     									 "</td><td>"+conComplite[key].fifty_per+"</td><td>"+
						     									 conComplite[key].sixty_per+"</td><td>"+
						     									 conComplite[key].seventy_more_than_per+"</td></tr>");   */
						     					 		var chartlist=[];
						     					 		chartlist.push( value.teenage_less_than_per);
						     					 		chartlist.push( value.teenage_per);
						     					 		chartlist.push( value.twenty_per);
						     					 		chartlist.push( value.thirty_per);
						     					 		chartlist.push( value.forty_per);
						     					 		chartlist.push( value.fifty_per);
						     					 		chartlist.push( value.sixty_per);
						     					 		chartlist.push( value.seventy_more_than_per);
						     					 		
						     					 		$.ajaxSettings.traditional = true;
						     							$.ajax({
						     						          type: 'get',
						     								  url: '/bisup/my/areaInfo/chartview.do',
						     								  dataType : 'html',
						     								  data : {'chartlist' : chartlist},
						     								  success: 
						     										function(data) {
						     								     	$("#chartView").html(data);
						     								       	$("#chartView").css("display","block");
						     								    	}
						     							});
						     								    
									}
								});
						});
					 
						
						
						
				}
				
				
					,error:function(e){
					//이곳의 ajax에서 에러가 나면 알러창으로 에러 메시지 출력
			alert(e.responseText);
		
			}
				});  
	
	
			}
    	}); 
	}   
			 /* addArea()종료 */ 
		); /* 클릭펑션종료 */
      	});
</script> 
<div>
<div id="right_main" style="float: left;">
<div>
<table class="tb_date" width="650">
					<thead>
						<tr>

							<th id="th" style="border-left: 0">동이름</th>
							<th id="th">총인구</th>
							<th id="th">남자인구</th>
							<th id="th">여자인구</th>
						</tr>
					</thead>
					
					<tbody class="tbody1" >
						
					</tbody>
				</table>
<div id="chartView" style="display: none;" ></div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>

