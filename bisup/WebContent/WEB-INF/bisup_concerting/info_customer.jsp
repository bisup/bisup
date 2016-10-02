<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html> 
<head>
<title>거래처 정보</title>
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
   bottom: 20%;
   left:55%;
   width: 30%;
   height: 60%;
   text-align: right;
   padding-left: 50;
   
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
					<option value="인테리어">인테리어</option>
					<option value="장비대여">장비대여</option>
					<option value="인력(아르바이트)">인력(아르바이트)</option>
					<option value="홍보업체">홍보업체</option>
				</select> <input type="submit" value="검색하기">
			</fieldset>
				<br>
			<table width="500" border="1" class="tb_date">
				<tr>
					<th id="th" width="100" style="border-left: 0">구분</th>
					<th id="th" width="150">업체명</th>
					<th id="th" width="300">주소</th>
				</tr>
				
				<c:forEach var="bis" items="#{concerting}">
					<tr>
						<td id="th" style="border-left: 0"></td>
						<td id="th"></td>
						<td id="th"></td>
					</tr>
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
            level : 3
         // 지도의 확대 레벨
         };

         var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

         // 지도를 클릭한 위치에 표출할 마커입니다
         var marker = new daum.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다 
            position : map.getCenter()
         });
         // 지도에 마커를 표시합니다
         marker.setMap(map);

         // 지도에 클릭 이벤트를 등록합니다
         // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
         daum.maps.event.addListener(map, 'click', function(mouseEvent) {

            // 클릭한 위도, 경도 정보를 가져옵니다 
            var latlng = mouseEvent.latLng;

            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            /* var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
            message += '경도는 ' + latlng.getLng() + ' 입니다';  */

            var resultDiv = document.getElementById('clickLatlng');
            /* resultDiv.innerHTML = message; */
         });
      </script>

</body>
</html>