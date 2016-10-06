<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
  
<head>
    <title>SOP JavaScript : Polygon sample</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://sgisapi.kostat.go.kr/OpenAPI3/auth/javascriptAuth?consumer_key=ed2cc2868ea14215a368"></script>
</head>

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
</style>

<body>
<div id="selsta">
<div id="fieldset1">
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
			</div> <!-- id filedset1 -->
</div>	<!-- 유동인구 id=selsta  -->
</body>

</html>
