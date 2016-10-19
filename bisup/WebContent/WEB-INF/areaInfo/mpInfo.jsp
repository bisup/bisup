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
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> -->
<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=bce731c194bf44debe25"></script>
<style>
#content {
    clear: both;
    width: 2200px;
    min-height: 400px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
    padding-left:15%;
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


	
	$('.gcode').click(function addArea() {
		
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
			
				
				      $.ajax({                     
     		            url : 'https://sgisapi.kostat.go.kr/OpenAPI3/stats/company.json' +
     		          	'?accessToken='+accessToken+'&year='+year+'&area_type='+0+'&theme_cd='+5010+'&adm_cd='+adm_cd+'&low_search='+1,
     		            type : 'get',
     		            datatype:'json',
     					success: function (res,status) { 
     						
     						target = res.result;
     					 
     		     			for (idx = 0, len = target.length; idx < len; idx ++) {
     							conComplite[target[idx].adm_cd] = target[idx];
     							 value=conComplite[target[idx].adm_cd];
     							key =target[idx].adm_cd;	
    
     						} 
     					
     						sopArea.eachLayer(function (layer) {
     							key = layer.feature.properties.adm_cd;
     							value = conComplite[key];
     							strToolTip = "<p>해당 위치는 " + value.adm_nm + "입니다.</p>";
     				
     							layer.bindToolTip(strToolTip);
     							
     						});
     					}
                     });
				
				var g=gcode;
				var url="/bisup/my/areaInfo/mpInfo.do";
				var params ="gcode="+g;
	
				$("#dcode button").each(function(){
				
				$("#dcode button:eq(0)").remove();
				//기존에 있던 동버튼 모두 삭제,eq : 지정된 index번째의 엘리먼트 선택
							});
				
				$.ajax({
					type:"post" // 포스트방식
					,url:url //url주소
					,data:params //요청에 전달되는 프로퍼티를 가진 객체
					,dataType:"json" //리턴된 데이터타입 : json타입으로 받겠다 
					,success:function(args){//응답이 성공 상태 코드를 반환하면 호출되는 함수
			
					for(var idx=0; idx<args.data.length; idx++){
				
					$("#dcode").append("<button value='"+args.data[idx].dcode+"' class='dcode' id=dong>"+args.data[idx].dn+"</button>");		
				
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
				     		     			
				     							 value=target[0];
				     							
				     							
				     		 $(".tbody1").append("<tr><td>"+value.adm_nm+"</td><td>"+value.total_ppl+"</td><td>"+value.f_ppl+"</td><td>"+value.m_ppl+"</td></tr>");  
				   
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
						     			 value=target[0];
						     				
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

