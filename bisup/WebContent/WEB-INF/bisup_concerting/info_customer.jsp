<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>  
<head>
<title>거래처 정보</title>
 <script>
      var x = new Array(); //x 위도 배열생성
      var y = new Array(); //y 경도 배열생성
      var title = new Array(); // title 제목 배열 생성 
      </script>
<style type="text/css">
#fieldset1 {
	position: relative;
    min-height: 400px;
    min-width:600px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
    left:15%; 
   
} 
#f1{
width: 350px;

}

#map{
   position: absolute;
   top: 40%;
   bottom: 20%;
   left:57%;
   width: 20%;
   height: 40%;
   text-align: right;
   padding-left:40%;
   
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
    
    height: 5px;
    border: 0;
    border-left:  solid #cbcbcb;
    border-bottom: 1px solid #cbcbcb;
    text-align: center;
} 
</style>
</head>
<body>
      <br>
      <form:form method="post" >
		<div id="fieldset1">
			<p>
			<h4>★거래처 정보를 지도로 제공하여 성공 창업을 도와드립니다.★</h4>
			</p>

			<fieldset id="f1">
				<legend>검색 조건 설정</legend>

				<label>항목 검색</label> 
				<select name="division">

					<option value="">선택</option>
					<option value="인테리어" >인테리어</option>
					<option value="장비대여" >장비대여</option>
					<option value="인력(아르바이트)" >인력(아르바이트)</option>
					<option value="홍보업체" >홍보업체</option>
				</select> <input type="submit" value="검색하기" >

			</fieldset>
				<br>
				
			<table width="500" border="1" class="tb_date">
				<tr>
					<th id="th" width="150" style="border-left: 0">구분</th>
					<th id="th" width="150">업체명</th>
					<th id="th" width="300">주소</th>
				</tr>
				
				
				<c:forEach var="bis" items="${concerting}">
					<tr height="40">
						<td id="th" style="border-left: 0">${bis.division}</td>
						<td id="th">${bis.company }</td>
						<td id="th">
						<a href="${bis.address}" target="_blank">${bis.address}</a></td>
					</tr>
					<script>
       					  x.push('${bis.x}') 
        				  y.push('${bis.y}')
       					  title.push('${bis.company}') 
        			 </script>
				</c:forEach>
				
			</table>
			
		</div>
	
	</form:form>
      
      <div id="map"></div>      
      <div id="clickLatlng"></div>
      <script type="text/javascript"
         src="//apis.daum.net/maps/maps3.js?apikey=15e23e5cf8b80901b98ad7e74cba97d2"></script>

      <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center : new daum.maps.LatLng(37.498240, 127.027610), // 지도의 중심좌표
            level : 9 
            // 지도의 확대 레벨
            
        
         };

         var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 
         
         
     	 // 지도에 마커를 생성하고 표시한다
         for(i=0; i<x.length; i++ ){
            
            var mposition = new daum.maps.LatLng(parseFloat(x[i]), parseFloat(y[i]));
            
            var marker = new daum.maps.Marker({
                  position: mposition, // 마커의 좌표
                   image : markerImage, // 마커의 이미지
                   map: map, // 마커를 표시할 지도 객체
                   

               });
            marker.setMap(map);		 
            
            // 마커 이미지의 주소
            var markerImageUrl = '/bisup/resources/img/maker.png'
             ,markerImageSize = new daum.maps.Size(40, 42), // 마커 이미지의 크기
             markerImageOptions = { 
                 offset : new daum.maps.Point(20, 42)// 마커 좌표에 일치시킬 이미지 안의 좌표
             };
            var markerImage = new daum.maps.MarkerImage(markerImageUrl, markerImageSize, markerImageOptions);  
       		
            
            var iwContent = title[i], // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwPosition = new daum.maps.LatLng(x[i], y[i]), //인포윈도우 표시 위치입니다
            iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

       	    // 인포윈도우를 생성하고 지도에 표시합니다
            var infowindow = new daum.maps.InfoWindow({
                map: map, // 인포윈도우가 표시될 지도
                position : iwPosition, 
                content : iwContent,
                removable : iwRemoveable
      		});
            infowindow.open(map, marker); 
            
         
            
         } 
         
         
      </script>

</body>
</html>