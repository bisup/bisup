<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<!-- header -->
	<script type="text/javascript" src="/js/ctznMain.js"></script>	
<input type="hidden" id= "SVC_STDR_YM_CD" value='201606'>
	<!-- 신규 창업위험도 -->
	<div class="mKeyvisual">
		<div class="bg">
			<!-- left -->
			<div class="gLeft">
				<!-- 20151001-2 -->
				<div class="list1">
					<h3>2015년 3분기 기준 (서울시)</h3>
					<dl>
					<dt class="first">폐업신고율</dt>
					<dd class="first">
						<span class="tx1" id="clsbizRt"></span>
						<span class="tx2" id="clsbizRt1"></span>
					</dd>
					<dt>3년간개업대비폐업신고율</dt>
					<dd>
						<span class="tx1" id="lsmthProvs3BeingIrdsRt"></span>
						<span class="tx2" id="lsmthProvs3BeingIrdsRt1"></span>
					</dd>
					<dt>평균<br> 폐업기간</dt>
					<dd>
						<span class="tx1" id="prvyyProvsDelngIrdsRt"></span>
						<span class="tx2" id="prvyyProvsDelngIrdsRt1">전년 동 분기 대비</span>
					</dd>
					<dt>점포<br> 증감률</dt>
					<dd>
						<span class="tx1" id="prvyyProvsStorCoRt"></span>
						<span class="tx2" id="prvyyProvsStorCoRt1">전년 동 분기 대비</span>
					</dd>
					</dl>
				</div>
				<!-- //20151001-2 -->
				
				
				
				
				
				<!-- <dl class="list1">
				<dt>폐업률</dt>
				<dd>
					<span id="clsbizRt" class="same"></span>
					<span class="tx">
					 (<span class="stdrQuTxt"></span>) 
					</span>
				</dd>
				<dt>3년이상<br> 생존률</dt>
				<dd>
					<span id="prvyyProvs3BeingRt" class="same"></span>
					<span class="tx">
					(<span class="stdrQuTxt"></span>)
					</span>
				</dd>
				<dt class="t2">거래<br> 증감률</dt>
				<dd class="t2">
					<span id="prvyyProvsDelngIrdsRt" class="same"></span>
					<span class="tx">
					(<span class="stdrQuTxt"></span>)
					</span>
				</dd>
				</dl> -->
				
				
			</div>
			<!-- left -->
			<!-- center -->
			<div class="gCenter">
				
				<div class="mKeygraph">
					<!-- 20151109-1 -->
					<h3>
						<span class="ti1">2015년 3분기</span>
						<strong class="ti2"><em>서울시</em> 신규 창업위험도</strong>
					</h3>
					<!-- //20151109-1 -->
					<div id="riskIdexValue" class="img">
						<img src="/bisup/resources/img/keygrap.png" width="532" height="249" alt="주의">
					</div>
				</div>

			</div>
			<!-- //center -->
			<!-- right -->
			<div class="gRight">
				<div class="txt1">
					<strong class="ti">신규 창업위험도란 ?</strong><br>
					
					해당 지역 내 신규 창업 시 위험도를 폐업률과 3년 생존율로 결합(0~100으로 환산) 하여 만든 지표입니다.<br> 
					주) 표준화구간(2년)을 이용하여 (횡적+종적) 상대화 지수를 구현
<!-- 
					신규 창업위험도는 서울시 전체에 대해서
					창업을 했을때 얼마나 위험한지를 지수로
					산출하여 년 4회 공지합니다.<br>
					지수 산출 방범은 자치구별 창업에 대한
					안정성, 성장성, 활성도 등을 감안하여 종합적
					판단을 통해 0 ~100으로 환산하여 산출됩니다.
 -->				
 				</div>
 				<a href="#" class="btn" name="dmy1010">위험 지표 자세히 보기</a> <!-- add20151001 -->
			</div>
			<!-- right -->
		</div>
	</div>
	<!-- //신규 창업위험도 -->

</body>
</html>