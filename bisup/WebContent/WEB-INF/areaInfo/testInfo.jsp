<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <title>SOP JavaScript : Polygon sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=ed2cc2868ea14215a368"></script>
</head>

<body>
<div id="map" style="width:650px;height:400px"></div>
<script type="text/javascript">

    var map = sop.map("map"); //map 생성

    map.setView(sop.utmk(953427, 1950827), 5); // 지도 중심좌표로 뷰 설정

    //지도에 표시되는 폴리곤 데이터
    var polygons = [
        [
            [949279, 1951131],
            [950631, 1950331],
            [951063, 1949091]
        ]
    ];
    //폴리곤 생성
    var polygon = sop.polygon(polygons, {
        stroke: true,
        color: "red",
        weight : 3,
        opacity: 1,
        fill: true,
        fillColor:"red",
        fillOpacity: 0.2
    });

    polygon.bindInfoWindow("폴리곤 입니다."); //인포 윈도우 바인드

    polygon.addTo(map); //지도에 폴리곤 추가

    map.fitBounds(polygon); ////fitBounds 최대 줌 레벨로 polygon데이터를 보여 줍니다
</script>
</body>

</html>
