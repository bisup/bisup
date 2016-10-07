


<%@ page  contentType="text/html; charset=UTF-8"%>
 
 
 



<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="utf-8" />
	    <meta name="format-detection" content="telephone=no" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <title>대화형 통계지도 | 통계지리정보서비스</title>
	    
	    <link rel="stylesheet" type="text/css" href="/css/um.css" />
	    <link href="/css/common.css" rel="stylesheet" type="text/css" />
	    <link href="/css/default.css" rel="stylesheet" type="text/css" />
	    <link href="/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />
	    <link href="/css/wheelcolorpicker.css" rel="stylesheet" type="text/css" />
	    <link rel="stylesheet"  href="/js/plugins/jquery-easyui-1.4/sop.css" />
	    <link href="/css/map/interactiveFunc.css" rel="stylesheet" type="text/css" />
	    <link rel='shortcut icon' href='/img/ico/n_favicon.png'/> 
	  
	    <link rel="stylesheet" type="text/css" href="/css/jquery.mCustomScrollbar.css" />
	    <link rel="stylesheet" href="/js/plugins/EasyTree/skin-lion/ui.easytree_new.css">
	    <link rel="stylesheet" type="text/css" href="/js/plugins/colorpicker/css/colpick.css">
	    <link rel="stylesheet" href="/css/popup.css">
	    <link rel="stylesheet" href="/css/tutorial/tutorial.css">
	    <link rel="stylesheet" type="text/css" href="/css/tutorial/common.css">
	    <script type="text/javascript" src="/js/plugins/jquery.min.js"></script>
	    <script type="text/javascript" src="/js/plugins/jquery-ui-1.10.3.custom.js"></script>  
	    <script type="text/javascript" src="/js/plugins/jquery.mCustomScrollbar.concat.min.js"></script>  
	    <script type="text/javascript" src="/js/plugins/colorpicker/js/colpick.js"></script>
	    <script type="text/javascript" src="/js/plugins/jquery.wheelcolorpicker.js"></script>
	    <script type="text/javascript" src="/js/plugins/colorpicker/js/jquery.xcolor.js"></script>
	    <script type="text/javascript" src="/js/plugins/EasyTree/jquery.easytree.js"></script> 
	    <script type="text/javascript" src="/js/plugins/colResizable-1.5.min.js"></script> 
	    <script type="text/javascript" src="/js/plugins/highcharts/highcharts.js"></script>
	    <!-- 9월 서비스 -->
	    <script type="text/javascript" src="/js/plugins/highcharts/highcharts-more.js"></script>
	    <script type="text/javascript" src="/jsp/pyramid/js/highchart/js/highcharts-3d.src.js"></script>
	    <script type="text/javascript" src="/js/plugins/highcharts/modules/exporting.js"></script>
	    <script type="text/javascript" src="/js/plugins/btoa.js"></script>
	    <script type="text/javascript" src="/js/plugins/highcharts/highchart.drag.js"></script>
	    
	    <!-- 2016.03.23 j.h.Seok -->
<!-- 	    <link rel="stylesheet" type="text/css" href="/css/handsontable.css"> -->
<!-- 	    <script type="text/javascript" src="/js/plugins/handsontable.js"></script> -->
		<link rel="stylesheet" type="text/css" href="/css/handsontable.full.css">
	    <script type="text/javascript" src="/js/plugins/handsontable.full.js"></script>
	    
		<script type="text/javascript" src="/js/plugins/jquery-easyui-1.4/sop-src.js"></script>
		<script type="text/javascript" src="/js/plugins/jquery.sha256.js"></script>
		<script type="text/javascript" src="/js/plugins/durian-v2.0.js"></script>
		<script type="text/javascript" src="/js/common/sop.portal.absAPI.js"></script>	    
	    <script type="text/javascript" src="/js/common/map.js"></script>
	    <script type="text/javascript" src="/js/common/common.js"></script>
	    <script type="text/javascript" src="/js/common/mapNavigation.js"></script>
	   <script type="text/javascript" src="/js/common/mapInfo/publicDataBoard.js"></script>
	    <script type="text/javascript" src="/js/common/mapInfo/mydataDataBoard.js"></script>
	    <script type="text/javascript" src="/js/interactive/interactiveMap.js"></script>
<!-- 	    <script type="text/javascript" src="/js/interactive/tutorial.js"></script> -->
<!-- 
		leekh 사용자 안내 rotation 추가 start
 -->
 	    <script type="text/javascript" src="/js/interactive/rotation/jquery.slides.min.js"></script> 
 	    <script type="text/javascript" src="/js/interactive/rotation/interactiveRotation.js"></script> 
<!-- 
		leekh 사용자 안내 rotation 추가 end
 -->
	    <script type="text/javascript" src="/js/interactive/interactiveMapApi.js"></script>
	    <script type="text/javascript" src="/js/interactive/interactiveMapBtn.js"></script>
	    <script type="text/javascript" src="/js/interactive/interactiveMap_kosis.js"></script>
	    <script type="text/javascript" src="/js/interactive/interactiveLeftMenu.js"></script>
		<script type="text/javascript" src="/js/interactive/interactiveDataBoard.js"></script>
	    <script type="text/javascript" src="/js/common/mapInfo/bookmarkAndShareInfo.js"></script>
	    
	    
	    
	    <!-- 사용자지정 컨트롤  -->
		<script type="text/javascript" src="/js/thematicMap/thematicMap_api.js"></script>
	    <script type="text/javascript" src="/js/common/mapDraw/Draw.Feature.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/Draw.Control.Manager.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/draw/Draw.Cricle.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/draw/Draw.Rectangle.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/draw/Draw.Polygon.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/Draw.Control.Overlay.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/measure/Draw.AreaMeasure.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/measure/Draw.DistanceMeasure.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/Draw.Control.Distance.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/Draw.Control.Poi.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/poi/Poi.InteractiveMap.js"></script>
        <script type="text/javascript" src="/js/common/mapDraw/Draw.Control.Measure.js"></script>
        
        <script type="text/javascript" src="/js/board/jquery.paging.js"></script>
        <script type="text/javascript" src="/js/common/mapInfo/legendInfo.js"></script>
        <!--[If IE 9]>    
			<script type="text/javascript" src="/js/common/classList.js"></script>
		<![endif]-->
		
        <!-- 공유  -->
        <script type="text/javascript"  src="/js/interactive/kakao_script_api.js"></script>
        
        <script>
       		$(document).ready(
    			function() {
    				 if($interactiveMap.ui.getCookie("confirmMsg") == ""){
	       				$(".Popup_Info").hide();
    					$interactiveMap.ui.readyTutorial();
    				}
	       			if($(location).attr('search').match("tutorial_mode")){
	       				$(".Popup_Info").hide();
	    				$interactiveMap.ui.startTutorial();
	       			} 
    				
    				//북마크나 최신데이터는 조건설정창을 자동으로 열지않는다.
    				if ("" != "bookmark"   		  && 
    					"" != "recentdata" 		  && 
    					"" != "userdata"   		  && 
    					"" != "sharedata"  		  &&
    					"" != "totalindex" 		  &&
    					"" != "population" 		  &&
    					"" != "company"    		  &&
    					"" != "household"  		  &&
    					"" != "house"      		  &&
    					"" != "farmhousehold" 	  &&
    					"" != "forestryhousehold" &&
    					"" != "fisheryhousehold"  &&
    					"" != "householdmember"   &&
    					"" != "kosis") {
    					$(".sideQuick.sq02").click();
    				}
    				
    				var param = null;
    				var length = 0;
    				if (length == 0) {
    					param = "";
    				}else {
    					param = JSON.parse();
    				}
    				$interactiveMap.ui.doAnalysisShareInfo("", param);
    		});
       		
        </script>
        
	
        
        
	</head>

	<body>  
		<div id="wrap" style="height: 300px;">
			<!-- header // -->
			<header>
				<!-- Top Include -->
				


<script type="text/javascript" src="/js/plugins/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/js/common/includeSearch.js"></script>
<a class="skipNav" href="#container" tabindex="2">본문바로가기</a>
<div class="headerEtc">
</div>
<div class="headerContents">
	<h1><a href='/' tabindex="10"><img src='/img/common/logoPlus.gif' alt='SGIS 오픈플랫폼' title="통계지리정보 서비스 홈페이지 입니다"/></a></h1>
	
<!-- 	<div class="searchPop"> -->
<!-- 		<p class="subj">추천검색어</p> -->
<!-- 		<ul> -->
<!-- 			<li><a href="/view/common/searchList?searchKeyword=서울시%20인구">서울시 인구</a></li> -->
<!-- 			<li><a href="/view/common/searchList?searchKeyword=미취학아동">미취학아동</a></li> -->
<!-- 			<li><a href="/view/common/searchList?searchKeyword=자동차">자동차</a></li> -->
<!-- 			<li><a href="/view/common/searchList?searchKeyword=편의점">편의점</a></li> -->
<!-- 			<li><a href="/view/common/searchList?searchKeyword=20대">20대</a></li> -->
<!-- 		</ul> -->
<!-- 		<p class="subj">인기검색어</p> -->
<!-- 		<ol> -->
<!-- 			<li><a href="javascript:void(0)">서울시인구</a></li> -->
<!-- 			<li><a href="javascript:void(0)">미취학아동</a></li> -->
<!-- 			<li><a href="javascript:void(0)">편의점</a></li> -->
<!-- 			<li><a href="javascript:void(0)">20대</a></li> -->
<!-- 			<li><a href="javascript:void(0)">출산율</a></li> -->
<!-- 		</ol> -->
<!-- 	</div> -->
	
	<h2>주메뉴</h2>
	<ul id="gnb" class="gnb" style="font-size: 16px;font-weight: bold;">
		<li style="width: 110px;"><a id="themaList" href="/view/thematicMap/categoryList" tabindex="11">통계주제도</a></li>
		<li style="width: 145px;"><a id="interList" href="/view/map/interactiveMap" tabindex="12">대화형통계지도</a></li>
		<li style="width: 110px;"><a id="serviceList" href="/view/common/serviceMain" tabindex="13">활용서비스</a></li>
		<li style="width: 110px;"><a id="analList" href="/view/common/analMapMain" tabindex="14">분석지도</a></li>
		<li style="width: 115px;"><a id="sopList" href="/view/board/sopBoardMain" tabindex="15">알림마당</a></li>
	</ul>
	<form action="#" method="post">
		<fieldset>
			<legend class='blind'>통합검색</legend>
			<label for="searchKeyword">통계정보 검색</label>
			<input id="searchKeyword" type="text" placeholder="통계정보를 검색해 보세요" onkeydown="if(event.keyCode == 13) { $includeSearch.ui.moveSearchList(); return false; }"/>
			<a href="javascript:$includeSearch.ui.moveSearchList();" tabindex="16" ><img src="/img/common/btn_search.png" title="검색하기" alt="검색" id="searchBtn" /></a>
		</fieldset>
		
		<!-- <div class="searchPop">
			<p class="subj">추천검색어</p>
			<ul>
				<li><div onclick="location.href='/view/common/searchList?searchKeyword=서울시%20인구'">서울시 인구</div></li>
				<li><div onclick="location.href='/view/common/searchList?searchKeyword=미취학아동'">미취학아동</div></li>
				<li><div onclick="location.href='/view/common/searchList?searchKeyword=자동차'">자동차</div></li>
				<li><div onclick="location.href='/view/common/searchList?searchKeyword=편의점'">편의점</div></li>
				<li><div onclick="location.href='/view/common/searchList?searchKeyword=20대'">20대</div></li>
			</ul>
		</div> -->
	</form>
</div>

<div class="submenuBox"><!-- submenu  -->
	<div class="rela"></div> <!-- 9월 서비스 변경 -->
		<div class="etc">센서스 등 통계자료를 외부자료와 지도위에서 융합하여 사용 할 수 있는 SGIS의 새로운 서비스입니다.</div>
		<div class="ulDiv"> <!-- 9월 서비스 변경 -->
		<ul style="margin-left : 0px; line-height: 10px;">
			<li><a id="human" href="/view/thematicMap/categoryListHuman" tabindex="17">인구와 가구</a></li>
			<li><a id="house" href="/view/thematicMap/categoryListHouse" tabindex="18">주거와 교통</a></li>
			<li><a id="welfare" href="/view/thematicMap/categoryListWelfare" tabindex="19">복지와 문화</a></li>
			<li><a id="work" href="/view/thematicMap/categoryListWork" tabindex="20">노동과 경제</a></li>
			<li><a id="envi" href="/view/thematicMap/categoryListEnvironment" tabindex="21">환경과 안전</a></li>
		</ul>
		<ul style="margin-left : -8px; line-height: 10px;">
			<li><a id="mainDex" href="/view/map/interactiveMap/mainIndexView" tabindex="17">총조사 주요지표</a></li>
			<li><a id="popHouse" href="/view/map/interactiveMap/populationHouseView" tabindex="18">인구주택총조사</a></li>
			<li><a id="3fv" href="/view/map/interactiveMap/3fView" tabindex="19">농림어업총조사</a></li>
			<li><a id="comp" href="/view/map/interactiveMap/companyView" tabindex="20">전국사업체조사</a></li>
			<li><a id="kosi" href="/view/map/interactiveMap/kosisView" tabindex="21">KOSIS(지역통계)</a></li>
			<li><a id="pubData" href="/view/map/interactiveMap/publicDataView" tabindex="22">공공데이터</a></li>
			<li><a id="uData" href="/view/map/interactiveMap/userDataView" tabindex="23">나의 데이터</a></li>
		</ul>
		<ul style="margin-left : 23px; line-height: 10px;">
			<li><a id="houseAnal" href="/view/house/houseAnalysisMap" tabindex="24">살고싶은 우리동네</a></li>
			<li><a id="bizMap" href="/view/bizStats/bizStatsMap" tabindex="25">생활업종 통계지도</a></li>
			<li><a id="comIntro" href="/view/community/intro" tabindex="26">통계커뮤니티맵</a></li>
			<li><a id="statexp" href="http://sgis.kostat.go.kr/statexp/index.jsp" tabindex="27">통계지도체험</a></li>
			<li><a  id="useBoard" href="/jsp/share/useBoardList.jsp" tabindex="28">우수활용사례</a></li><!-- 2016.03.18 수정, 사용자공유마당->우수활용사례  -->
		</ul>
		<ul style="margin-left : -8px; line-height: 10px;">
			<li><a id="staMonth" href="http://analysis.kostat.go.kr/funny_month/month/sta_month_main.do" tabindex="29">월간통계</a></li>
			<li><a id="pyra" href="http://sgis.kostat.go.kr/jsp/pyramid/pyramid1.jsp" tabindex="29">인구피라미드</a></li>
			<li><a id="pubModel" href="http://analysis.kostat.go.kr/publicsmodel/" tabindex="30">고령화현황보기</a></li>
			<li><a id="statbdFam" href="http://sgis.kostat.go.kr/statbd/family_01.vw" tabindex="31">성씨분포</a></li>
			<li><a id="statbdFuture" href="http://sgis.kostat.go.kr/statbd/future_01.vw" tabindex="32">지방의변화보기</a></li>
		</ul>
		<ul style="margin-left : -11px; line-height: 10px;">
			<li><a id="sopIn" href="/view/board/sopIntro" tabindex="33">SGIS 플러스 소개</a></li>
			<li><a id="ean" href="/view/board/expAndNotice" tabindex="34">설명과 공지</a></li>
			<li><a id="shortc" href="/contents/shortcut/shortcut_05_02.jsp" tabindex="35">자료신청</a></li>
			<li><a id="qar" href="/view/board/qnaAndRequest" tabindex="36">질문과 개선요청</a></li>
		</ul>
	</div>
</div>
			</header>
	
			<!-- body -->
			<div class="containerBox">  
				<div class="rela">
					
					<div class="sceneBox on" id="view1">
						<div class="sceneRela">
							<div class="toolBar">
								<h2>대화형통계지도</h2>
								<div class="viewTitle"><span style="background:#0070c0;">VIEW 1</span></div>
								<!-- 네비게이터 -->
								<div id="mapNavi_1"></div>
								
								<div class="tb_right" id="btnList_1">
									<img id="tuto_start_btn" src="/img/tutorial/tuto_start_btn.png" style="cursor:pointer; display:block; position:absolute; margin-top:3px; right:302px;" onclick="javascript:$interactiveMap.ui.readyTutorial();">
									<div class="tb_radio">
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(1, false);" class="fl" style="cursor:pointer;" title="사업체전개도 끄기"  >체크1</a>
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(1, true);" class="fr" style="cursor:pointer;" title="사업체전개도 보기" >체크2</a>
									</div>
									<ul> 
										<li><a onclick="javascript:$interactiveMap.ui.doMaxSize(1);" class="tb_sizing" style="cursor:pointer;" title="전체 화면 확대"><img src="/img/ico/ico_toolbars01.png" alt="전체 화면 확대"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doClearMap(1);" style="cursor:pointer;" title="초기화" ><img src="/img/ico/ico_toolbars02.png" alt="초기화"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doShare(1);" style="cursor:pointer;" title="URL 공유하기" ><img src="/img/ico/ico_toolbars04.png" alt="URL 공유하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doBookMark(1);" style="cursor:pointer;" title="즐겨찾기로 저장하기" ><img src="/img/ico/ico_toolbars05.png" alt="즐겨찾기로 저장하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.reportDataSet(1);" class="tb_report" style="cursor:pointer;" title="보고서 보기" ><img src="/img/ico/ico_toolbars06.png" alt="보고서 보기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doAddMap(1);" class="tb_mapAdd" style="cursor:pointer;" title="지도 추가하여 비교하기" ><img src="/img/ico/ico_toolbars07.png" alt="지도 추가하여 비교하기"/></a></li>
										<li style="display:none;"><a onclick="javascript:$interactiveMap.ui.doCombineMap(1);" class="tb_combine" style="cursor:pointer;" title="지도 겹쳐보기" ><img src="/img/ico/ico_toolbars08.png" alt="지도 겹쳐보기"/></a></li>
									</ul> 
									<a onclick="javascript:$interactiveMap.ui.doRemoveMap(1);" class="tb_close" style="cursor:pointer;"><img src="/img/um/btn_closel04.png" alt="창닫기" style="height:34px;"/></a>
								</div>
							</div>
							<div class="interactiveBar"><!-- map topbar -->
					    		<p class="helperText" id="helper_1" style="margin-left:150px;">왼쪽 통계메뉴 버튼을 클릭하여 항목을 선택하고 통계버튼을 만드세요.</p>
					    		<p class="helperText" id="title_1" style="display:none;"></p>  
					    		<a style="cursor:pointer" onclick="javascript:window.open('/html/newhelp/In_help_10_0.html');"><img src="/img/im/icon_q.gif" alt="도움말"></a>
					    	</div><!-- map topbar -->
					    		
					    	<div class="mapContents" id="mapRgn_1"></div><!-- 맵영역 --> 
					    	<div class="resizeIcon"><!-- 리사이즈 아이콘 --></div>
					    	
					    	<!-- 설명 문구 -->
					    	<div class="noticeTextPopup" id="noticeTextPopup01">
								<a onclick="javascript:$interactiveMap.ui.informationPopOpen();">
								<img src="/img/new/use_notice_map.png"></a>
							</div>
				    	</div>
			    	</div>
			    	
			    	<div class="sceneBox" id="view2">
						<div class="sceneRela">
							<div class="toolBar">
							<h2>대화형통계지도</h2>
							<div class="viewTitle"><span style="background:#9ed563;">VIEW 2</span></div>
								<!-- 네비게이터 -->
								<div id="mapNavi_2"></div>
								
								<div class="tb_right" id="btnList_2">
									<div class="tb_radio">
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(2, false);" class="fl" style="cursor:pointer;" title="사업체전개도 끄기"  >체크1</a>
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(2, true);" class="fr" style="cursor:pointer;" title="사업체전개도 보기"  >체크2</a>
									</div>
									<ul> 
										<li><a onclick="javascript:$interactiveMap.ui.doMaxSize(2);" class="tb_sizing" style="cursor:pointer;" title="전체 화면 확대"  ><img src="/img/ico/ico_toolbars01.png" alt="전체 화면 확대"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doClearMap(2);" style="cursor:pointer;" title="초기화"  ><img src="/img/ico/ico_toolbars02.png" alt="초기화"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doShare(2);" style="cursor:pointer;" title="URL 공유하기" ><img src="/img/ico/ico_toolbars04.png" alt="URL 공유하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doBookMark(2);" style="cursor:pointer;" title="즐겨찾기로 저장하기" ><img src="/img/ico/ico_toolbars05.png" alt="즐겨찾기로 저장하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.reportDataSet(2);" class="tb_report" style="cursor:pointer;" title="보고서 보기" ><img src="/img/ico/ico_toolbars06.png" alt="보고서 보기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doAddMap(2);" class="tb_mapAdd" style="cursor:pointer;" title="지도 추가하여 비교하기" ><img src="/img/ico/ico_toolbars07.png" alt="지도 추가하여 비교하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doCombineMap(2);" class="tb_combine" style="cursor:pointer;" title="지도 겹쳐보기" ><img src="/img/ico/ico_toolbars08.png" alt="지도 겹쳐보기"/></a></li>
									</ul> 
									<a onclick="javascript:$interactiveMap.ui.doRemoveMap(2);" class="tb_close" style="cursor:pointer;"><img src="/img/um/btn_closel03.png" alt="창닫기" style="height:34px;"/></a>
								</div>
							</div>
							<div class="interactiveBar"><!-- map topbar -->
					    		<p class="helperText" id="helper_2" style="margin-left:150px;">왼쪽 통계메뉴버튼을 클릭하여 통계항목을 선택하고, 통계버튼을 만드세요.</p><!-- 2016.09.07 9월 서비스 --> 
					    		<p class="helperText" id="title_2" style="display:none;"></p>  
					    	</div><!-- map topbar -->
						    
					    	<div class="mapContents" id="mapRgn_2"></div><!-- 맵영역 --> 
					    	<div class="resizeIcon"><!-- 리사이즈 아이콘 --></div>
					    	
					    	<!-- 설명 문구 -->
					    	<div class="noticeTextPopup" id="noticeTextPopup02">
								<a onclick="javascript:$interactiveMap.ui.informationPopOpen();">
								<img src="/img/new/use_notice_map.png"></a>
							</div>
				    	</div>
			    	</div>
			    	
			    	<div class="sceneBox" id="view3">
						<div class="sceneRela">
							<div class="toolBar">
							<h2>대화형통계지도</h2>
							<div class="viewTitle"><span style="background:#ff0066;">VIEW 3</span></div>
								<!-- 네비게이터 -->
								<div id="mapNavi_3"></div>
								
								<div class="tb_right" id="btnList_3">
									<div class="tb_radio">
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(3, false);" class="fl" style="cursor:pointer;" title="사업체전개도 끄기"  >체크1</a>
										<a onclick="javascript:$interactiveMap.ui.doInnerMap(3, true);" class="fr" style="cursor:pointer;" title="사업체전개도 보기"  >체크2</a>
									</div>
									<ul> 
										<li><a onclick="javascript:$interactiveMap.ui.doMaxSize(3);" class="tb_sizing" style="cursor:pointer;" title="전체 화면 확대" ><img src="/img/ico/ico_toolbars01.png" alt="전체 화면 확대"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doClearMap(3);" style="cursor:pointer;" title="초기화" ><img src="/img/ico/ico_toolbars02.png" alt="초기화"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doShare(3);" style="cursor:pointer;" title="URL 공유하기" ><img src="/img/ico/ico_toolbars04.png" alt="URL 공유하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doBookMark(3);" style="cursor:pointer;" title="즐겨찾기로 저장하기" ><img src="/img/ico/ico_toolbars05.png" alt="즐겨찾기로 저장하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.reportDataSet(3);" class="tb_report" style="cursor:pointer;" title="보고서 보기" ><img src="/img/ico/ico_toolbars06.png" alt="보고서 보기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doAddMap(3);" class="tb_mapAdd" style="cursor:pointer;" title="지도 추가하여 비교하기" ><img src="/img/ico/ico_toolbars07.png" alt="지도 추가하여 비교하기"/></a></li>
										<li><a onclick="javascript:$interactiveMap.ui.doCombineMap(3);" class="tb_combine" style="cursor:pointer;" title="지도 겹쳐보기" ><img src="/img/ico/ico_toolbars08.png" alt="지도 겹쳐보기"/></a></li>
									</ul> 
									<a onclick="javascript:$interactiveMap.ui.doRemoveMap(3);" class="tb_close" style="cursor:pointer;"><img src="/img/um/btn_closel02.png" alt="창닫기" style="height:34px;"/></a>
								</div>
							</div>
							<div class="interactiveBar"><!-- map topbar -->
					    		<p class="helperText" id="helper_3" style="margin-left:150px;">왼쪽 통계메뉴버튼을 클릭하여 통계항목을 선택하고, 통계버튼을 만드세요.</p> <!-- 2016.09.07 9월 서비스 -->
					    		<p class="helperText" id="title_3" style="display:none;"></p>  
					    	</div><!-- map topbar -->
						    
					    	<div class="mapContents" id="mapRgn_3"></div><!-- 맵영역 --> 
					    	<div class="resizeIcon"><!-- 리사이즈 아이콘 --></div>
					    	
					    	<!-- 설명 문구 -->
					    	<div class="noticeTextPopup" id="noticeTextPopup03">
								<a onclick="javascript:$interactiveMap.ui.informationPopOpen();">
								<img src="/img/new/use_notice_map.png"></a>
							</div>
				    	</div>
			    	</div>
				    
				    
					<!-- 조회버튼 -->
			    	<a href="javascript:void(0)" class="sideQuick sq02" id="map_left_btn">
			    		<span>통계메뉴</span>
			    		<img src="/img/ico/ico_totalmenu.gif" alt="통계메뉴" />
			    	</a>
			     
			    	<a href="javascript:void(0)" class="sideQuick sq03">
			    		<span>선택항목</span>
			    		<img src="/img/ico/ico_resultbtn.gif" alt="선택항목" />
			    	</a>
			    	<div class="sqListBox sq03">
			    		<div class="sqTabs">
			    			<span>통계표출</span>
			    			<a href="javascript:$interactiveLeftMenu.ui.showNumberClick();" id="showNumberBtn">off</a>
			    		</div>
			    		<div id="searchBtnResultRgn" class="sqList">
			    			<ul></ul>
			    		</div> 
			    	</div> 
				    	
			    	<!-- left menu --> 
    				<div class="leftArea">
    					<!-- Top Include -->
						



 


				<div class="shadow"></div>
				<!-- 1Depth Start -->
					<div class="quickBox step01"><!-- 대화형통계지도 메뉴 보기 start -->
						<div class="subj">
							<span>대화형통계지도 메뉴 보기</span>
							<a href="javascript:void(0)" class="stepClose">닫기</a>
						</div> 
						<div class="scrollBox" id="depth1Menu">
							<dl class="qmdl"> 
								<dd>
									<ul class="qmIcon01">
										<li id="mainIndexBtn" onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('mainIndex');"><span><a data-subj="총조사주요지표" title="&lt;p&gt;인구총조사 결과 중 주요지표에 대한 통계 조회가 가능합니다.&lt;br /&gt;
※ 특별조사구&#40;해외주제공관, 교도소 &amp;middot; 소년원, 군부대, 전투경찰대, 의무소방대 등&#41; 및 외국인 제외!&lt;/p&gt;
">총조사 주요지표</a></span></li>
										<li onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('populationHouse');"><span><a data-subj="인구주택총조사" title="&lt;p&gt;인구총조사 항목 중 인구&amp;middot;가구&amp;middot;주택 각 항목 및 결합조건으로 통계&amp;nbsp;조회가 가능합니다.&lt;/p&gt;
">인구주택총조사</a></span></li>
										<li onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('3f');"><span><a data-subj="농림어업총조사" title="&lt;p&gt;농림어업총조사 항목인 농가, 임가, 어가의 가구 및 가구원에 대한 통계 조회가 가능합니다.&lt;/p&gt;
">농림어업총조사</a></span></li>
										<li id="companyBtn" onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('company');"><span><a data-subj="전국사업체조사" title="&lt;p&gt;&lt;span style=&quot;color: rgb&#40;74, 74, 74&#41;; font-family: Dotum, sans-serif; font-size: 12px; line-height: normal;&quot;&gt;지역 종합정보를 조회합니다..&lt;/span&gt;&lt;/p&gt;
">전국사업체조사</a></span></li>
									</ul>
								</dd>
							</dl> 
							<dl class="qmdl"> 
								<dd>
									<ul class="qmIcon03">
										<li onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('kosis');"><span><a data-subj="KOSIS(지역통계)" title="&lt;p&gt;국가승인통계 중 KOSIS에서 서비스 되고 있는 행정구역단위 통계 조회가 가능합니다.&lt;/p&gt;
">KOSIS(지역통계)</a></span></li>
										<li onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('publicData');"><span><a data-subj="공공데이터" title="유동인구, 학교인구, 지하철승하차인구, 버스정류장 정보 등 공공데이터 정보를 조회합니다.">공공데이터</a></span></li>
										<li onclick="javascript:$interactiveLeftMenu.ui.setDetailStatsPanel('userData');"><span><a data-subj="나의 데이터" title="내가 등록한 정보 및 다른 사용자가 등록하여 공개한 정보를 조회합니다.">나의 데이터</a></span></li>  
									</ul>
								</dd>
							</dl> 
							<ul class="qmlist botn">
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doMaxSize();" style="cursor:pointer;">전체 화면 확대</a></li>
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doShare();" style="cursor:pointer;">URL 공유하기</a></li>
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doBookMark();" style="cursor:pointer;">즐겨찾기로 저장하기</a></li>
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doReport();" style="cursor:pointer;">보고서 보기</a></li>   
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doAddMap();" style="cursor:pointer;">지도 추가하여 비교하기</a></li>
	                            <li><a onclick="javascript:$interactiveLeftMenu.ui.doCombineMap();" style="cursor:pointer;">지도 겹쳐보기</a></li>
	                            <li><a href="/html/newhelp/In_help_10_0.html" target="_blank">도움말 보기</a></li> 
	                        </ul> 
						</div> 
						<div class="menuAutoClose">
							<input type="radio" name="menuAutoClose_radio" id="menuAutoClose_radio" checked="checked"/>
				            <label for="menuAutoClose_radio" class="on">통계메뉴바 자동 닫기</label>
						</div>
						<div class="btnBottom">
	                        <span class="logo"><img src="/img/pic/pic_logo01.gif" alt="통계청" /></span>
	                        <div class="serviceLayer" id="bottomServiceLayer">
								<ol>
									<li><a href="javascript:goExternalUrlLink('//www.kostat.go.kr');">통계청 홈페이지</a></li>
									<li><a href="javascript:goExternalUrlLink('//kosis.kr');">국가통계포털</a></li>
									<li><a href="javascript:goExternalUrlLink('//mdss.kostat.go.kr');">마이크로데이터</a></li>
									<li><a href="javascript:goExternalUrlLink('//www.index.go.kr');">e-나라지표</a></li>
									<li><a href="javascript:goExternalUrlLink('//meta.narastat.kr');">통계설명자료</a></li>
									<li><a href="javascript:goExternalUrlLink('//kssc.kostat.go.kr');">통계분류</a></li>
								</ol>
							</div>
	                        <div class="btnService" id="bottomService">통계청 주요서비스</div>
	                    </div>
						
					</div><!-- 대화형통계지도 메뉴 보기 end -->
					
					<!-- 2Depth start -->
					<div class="quickBox step02" id="quickBox_2depth">
						<div class="subj">
							<span id="submenuTitle">주요지표 선택</span>
							<a href="javascript:void(0)" class="stepClose">닫기</a>
						</div>
						<div class="scrollBox">
							<div id="API_0301" class="totalResult tr01"><!-- 주요지표 목록보기 -->
								<div class="stepBox mainIndex_stepBox"> 
								    <p class="on">주요지표
								    	<select title="주요지표 조사년도" id="mainIndex_year" name="mainIndex_year" style="font-size:13px;">
								     	</select>
								    </p>
								   	<ul class="dbTypeCk">
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio01" value="tot_ppltn" checked="checked"/>
								            <label for="mainIndex_radio01" class="on">총인구(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;대한민국 영토 내에 상주하는 모든 내․외국인의 인구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio02" value="avg_age" />
								            <label for="mainIndex_radio02">평균나이(세)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;&amp;sum;{&#40;각세나이+0.5&#41;&amp;times;각세별인구수&#41;}/총인구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio03" value="ppltn_dnsty" />
								            <label for="mainIndex_radio03">인구밀도(명/㎢)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="1㎢(1㎞ Ⅹ 1㎞)면적에 거주하는 인구"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio04" value="aged_child_idx" />
								            <label for="mainIndex_radio04">노령화지수</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="유소년(14세 이하) 인구 1백명 당 고령(65세 이상) 인구"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio05" value="oldage_suprt_per" />
								            <label for="mainIndex_radio05">노년부양비</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="생산가능(15세 ~ 64세) 인구 1백명 당 고령(65세 이상) 인구"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio06" value="juv_suprt_per" />
								            <label for="mainIndex_radio06">유년부양비</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="생산가능(15세 ~ 64세) 인구 1백명 당 유소년(14세 이하) 인구"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio07" value="tot_family" />
								            <label for="mainIndex_radio07">가구(가구)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;1인 또는 2인 이상이 모여서 취사, 취침 등 생계를 같이하는 생활 단위..&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio08" value="avg_fmember_cnt" />
								            <label for="mainIndex_radio08">평균 가구원(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;일정지역 내의 총가구원수를 해당 지역의 총 일반가구수로 나눈 수치&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio09" value="tot_house" />
								            <label for="mainIndex_radio09">주택(호)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;가구가 살수 있도록 지어진 집으로서 주택의 요건을 갖춘 단독주택, 아파트, 연립주택, 다세대주택, 비거주용건물내 주택을 말함&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
									</ul>
								</div>
								<div class="stepBox mainIndex_stepBox" id="mainIndex_box2" style="display:none;"> <!-- 2016.08.23 권차욱 9월서비스  -->
							  		<ul class="dbTypeCk mt10">
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio10" value="nongga_cnt" />
								            <label for="mainIndex_radio10">농가(가구)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;생계, 영리, 연구를 목적으로 농업을 경영하거나 농업에 종사하는 농가로 조사기준 시점 현재 농가로 정의된 가구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio11" value="nongga_ppltn" />
								            <label for="mainIndex_radio11">농가인구_계(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;조사기준 시점 현재 농가로 정의된 개인농가에서 취사, 취침 등 생계를 같이하는 사람&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio12" value="imga_cnt" />
								            <label for="mainIndex_radio12">임가(가구)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;조사기준일 현재 산림면적을 3ha 이상 보유하면서 지난 5년간 육림작업 실적이 있거나 지난 1년간 벌목업, 양묘업을 경영하였거나, 직접 생산한 임산물의 판매금액이 120만 원 이상인 가구&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio13" value="imga_ppltn" />
								            <label for="mainIndex_radio13">임가인구_계(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;조사기준 시점 현재 임가로 정의된 개인임가에서 취사, 취침 등 생계를 같이하는 사람&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio14" value="naesuoga_cnt" />
								            <label for="mainIndex_radio14">내수면총어가(가구)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;하천, 댐, 호수, 저수지, 기타 인공으로 조성한 담수 등에서 수산동식물을 양식, 채포, 채취하는 어업에 조사기준 시점 현재 내수면 어가로 정의된 가구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio15" value="naesuoga_ppltn" />
								            <label for="mainIndex_radio15">내수면어가인구(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;조사기준 시점 현재 내수면어가로 정의된 개인어가에서 취사, 취침 등 생계를 같이하는 사람&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio16" value="haesuoga_cnt" />
								            <label for="mainIndex_radio16">해수면총어가(가구)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;해수면에서 지난 1년간 판매할 목적으로 1개월 이상 어선어업, 마을어업, 양식어업을 직접 경영한 가구이거나, 지난 1년간 직접 어획하거나 양식한 수산물의 판매금액이 120만원 이상인 가구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio17" value="haesuoga_ppltn" />
								            <label for="mainIndex_radio17">해수면어가인구(명)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;조사기준 시점 현재 해수면어가로 정의된 개인어가에서 취사, 취침 등 생계를 같이하는 사람&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li>
								 	</ul>
								</div>
								<div class="stepBox mainIndex_stepBox"> 
								    <p class="on">사업체 주요지표
								    	<select title="주요지표 조사년도" id="mainIndex_corp_year" name="mainIndex_corp_year" style="font-size:13px;">
								     	</select>
								    </p>
								    <ul class="dbTypeCk mt10">
								        <li>
								            <input type="radio" name="mainIndex_radio" id="mainIndex_radio18" value="corp_cnt" />
								            <label for="mainIndex_radio18">사업체수(개)</label>
								            <a href="javascript:void(0)" class="ar" data-subj="주요지표" title="&lt;p&gt;일정한 장소에서 재화의 생산, 판매, 서비스제공 등 유,무형의 산업활동을 영위하고 있는 모든 사업체수&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
								        </li> 
								    </ul> 
								</div>
							</div>
							
							<div class="totalResult tr02"><!-- 인구주택총조사 통계 -->
								<ol class="cateMenu type01" id="populationTabDiv">
	                                <li class="on"><a href="javascript:$interactiveLeftMenu.ui.populationTab('population');" data-subj="조건설정 팁" title="&lt;p&gt;인구총조사 항목 중 상세조건 설정에 따른 인구통계 조회가 가능합니다.&lt;br /&gt;
- 성별 : 남성/여성&lt;br /&gt;
- 연령 : &lt;span style=&quot;line-height: 20.8px;&quot;&gt;조사시점 현재 실제로 태어난 사실상의 만 나이&lt;/span&gt;&lt;br /&gt;
- 교육정도별&amp;nbsp;: &lt;span style=&quot;line-height: 20.8px;&quot;&gt;교육부장관이 인정하는 정규교육 중 이수한 최고학력&lt;/span&gt;&lt;br /&gt;
- 혼인정도별 : &lt;span style=&quot;line-height: 20.8px;&quot;&gt;호적이나, 주민등록상의 신고와 관계없이 사실상의 혼인상태&lt;/span&gt;&lt;/p&gt;
">인구조건</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.populationTab('household');" data-subj="조건설정 팁" title="인구총조사 항목 중 상세조건 설정에 따른 가구통계 조회가 가능합니다.</br>- 세대구성 : 일반가구에 한하여 가구주와 그 가족의 친족관계에 따라 구분</br>- 점유형태 : 일반가구에 대하여 현재 사는 집을 점유하는 형태</br>※ 특별조사구, 집단가구, 외국인가구 제외">가구조건</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.populationTab('house');" data-subj="조건설정 팁" title="주택총조사 항목 중 상세조건 설정에 따른 주택통계 조회가 가능합니다.</br>※ 특별조사구, 외국인, 빈집 제외">주택조건</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.populationTab('combine');" data-subj="조건설정 팁" title="인구총조사 항목 중 인구·가구·주택 항목이 결합된 조건을 설정하여 통계조회가 가능합니다.">결합조건</a></li>
	                            </ol>
	                            
	                            <!-- 인구 조건 Start -->
	                            <div class="cm01 population_tab" id="API_0302">
	                            	<div class="stepBox">
									    <p class="on">조사년도(필수)
											<select title="인구조건 조사년도" id="population_year" name="population_year" style="font-size:13px;">
									        </select> 
										</p>
										<p class="on">성별(필수)</p>
									    <ul class="dbTypeCk radioStepBox validationStepBox"> <!-- 2016.03.21 수정, class추가 -->
									        <li>
									        	<input type="radio" id="population_gender01" name="population_gender"  value="0" checked=checked/>
									            <label for="population_gender01" class="mr20 on">전체</label>
									            <input type="radio" id="population_gender02" name="population_gender" value="1" />
									            <label for="population_gender02" class="mr20">남자</label>
									            <input type="radio" id="population_gender03" name="population_gender" value="2" />
									            <label for="population_gender03">여자</label>
									        </li> 
									    </ul>
									</div>
									<div class="stepBox"> 
										<a href="javascript:void(0)" class="roundTextBox" id="populationAgeTab">
									    	<input type="checkbox" />
											<span>연령(선택)</span>
									    </a>
									    
									    <div class="joinDefault">
									    	<div class="box_area_option02">
									    		<!-- 9월서비스 권차욱 수정 -->
				                                <div class="mgb_12">
				                                    <p class="houseArea">
				                                        <select title="시작범위" id="populationAgeFrom" name="age_from"></select>
				                                        <span>이상 ~</span>
				                                        <select title="마지막범위" id="populationAgeTo" name="age_to"></select>
				                                        <span id="ageToText">미만</span>
				                                    </p> 
				                                </div> 
				                                
				                                <div id="slider-range2" class="slider-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 19.7324%; width: 8.3612%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 19.7324%;"></a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 28.0936%;"></a></div>
				                                <ul class="slider_controll_bar">
				                                	<!-- 2016.09.08 9월 서비스 -->
				                                    <li>0</li>
				                                    <li style="margin-left:4px;">20</li>
				                                    <li style="margin-left:-2px;">40</li>
				                                    <li style="margin-left:-2px;">60</li>
				                                    <li>80</li>
				                                    <li style="margin-left:-5px;">100+</li>
				                                </ul>
				                            </div>
									    </div>
										    
									    <a href="javascript:void(0)" class="roundTextBox" id="populationEduTab" style="display:none;"> <!-- 2016.08.23 권차욱 9월서비스 -->
									    	<input type="checkbox" id="rt02" />
									    	<span>교육정도별(선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<!-- <ul class="studyType">
		                                    	<li>
		                                    		<select id="populationEduLevel" title="교육정도선택">
		                                    			<option value="">교육정도선택</option>
		                                    			<option value="1">수학없음(미취학포함)</option>
                                                        <option value="2">초등학교</option>
                                                        <option value="3">중학교</option>
                                                        <option value="4">고등학교</option>
                                                        <option value="5">전문학사</option>
                                                        <option value="6">학사</option>
                                                        <option value="7">석사</option>
                                        				<option value="8">박사</option>
		                                    		</select>
		                                    	</li>
		                                    </ul> -->
		                                    <ul class="dbTypeCk honinType multiCheckBox">
		                                    	<li>
		                                    		<input type="checkbox" name="edulevel_1" id="edu_level01" value="1" />
										            <label for="edu_level01">수학없음</label>
										            <input type="checkbox" name="edulevel_1" id="edu_level02" value="2" />
										            <label for="edu_level02">초등학교</label>
		                                    	</li>
		                                    	<li>
		                                    		<input type="checkbox" name="edulevel_1" id="edu_level03" value="3" />
										            <label for="edu_level03">중학교</label>
										            <input type="checkbox" name="edulevel_1" id="edu_level04" value="4" />
										            <label for="edu_level04">고등학교</label>
		                                    	</li>
		                                    	<li>
		                                    		<input type="checkbox" name="edulevel_1" id="edu_level05" value="5" />
										            <label for="edu_level05">전문학사</label>
										            <input type="checkbox" name="edulevel_1" id="edu_level06" value="6" />
										            <label for="edu_level06">학사</label>
		                                    	</li>
		                                    	<li>
		                                    		<input type="checkbox" name="edulevel_1" id="edu_level07" value="7" />
										            <label for="edu_level07">석사</label>
										            <input type="checkbox" name="edulevel_1" id="edu_level08" value="8" />
										            <label for="edu_level08">박사</label>
		                                    	</li>
		                                    </ul>
									    </div>
									    
									    <a href="javascript:void(0)" class="roundTextBox" id="populationMarryTab" style="display:none;"> <!-- 2016.08.23 권차욱 9월서비스 -->
									    	<input type="checkbox" id="rt03" />
									    	<span>혼인정도별(다중선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<ul class="dbTypeCk honinType multiCheckBox">
		                                    	<li>
		                                    		<input type="checkbox" name="mrg_state_1" id="rd_honin01" value="1" />
										            <label for="rd_honin01">미혼</label>
										            <input type="checkbox" name="mrg_state_1" id="rd_honin02" value="4" />
										            <label for="rd_honin02">이혼</label>
		                                    	</li>
		                                    	<li>
		                                    		<input type="checkbox" name="mrg_state_1" id="rd_honin03" value="2" />
										            <label for="rd_honin03">기혼</label>
										            <input type="checkbox" name="mrg_state_1" id="rd_honin04" value="3" />
										            <label for="rd_honin04">사별</label>
		                                    	</li>
		                                    </ul>
									    </div>
									</div>
	                            </div>
	                            <!-- 인구 조건 End -->
	                            
	                            <!-- 가구 조건 Start -->
	                            <div class="cm02 population_tab"  id="API_0305">
	                            	<div class="stepBox">
	                            		<p class="on">조사년도(필수)
											<select title="가구조건 조사년도" id="household_year" name="household_year" style="font-size:13px;">
									        </select>
										</p>   
									</div>
									<div class="stepBox">
										<a href="javascript:void(0)" class="roundTextBox" id="householdTypeTab">
											<input type="checkbox" />
											<span>세대구성(다중선택)</span>
										</a>
									    <div class="joinDefault">
									    	<ul class="multiCheckBox" style="overflow:visible;"> <!-- 2016.08.23 권차욱 9월 서비스  -->
										        <li>
										            <input type="checkbox" id="rd_household01" name="household_type" value="01" />
										            <label for="rd_household01">1세대 가구</label>
										            <a href="javascript:void(0)" class="ar" data-subj="1세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 같은 세대에 속하는 친족들만 함께사는 가구&#40;부부, 부부+형제자매 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_household02" name="household_type" value="02" />
										            <label for="rd_household02">2세대 가구</label>
										            <a href="javascript:void(0)" class="ar" data-subj="2세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 그 직계 또는 방계의 친족 2세대가 함께 사는 가구&#40;부부+자녀 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_household03" name="household_type" value="03" />
										            <label for="rd_household03">3세대 가구</label>
										            <a href="javascript:void(0)" class="ar" data-subj="3세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 그 직계 또는 방계의 친족 3세대가 함께 사는 가구&#40;부부+자녀+부모 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_household04" name="household_type" value="04" />
										            <label for="rd_household04">4세대 이상 가구</label> <!-- 2016.08.23 권차욱 9월 서비스 - 4세대->4세대 이상 가구 -->
										            <a href="javascript:void(0)" class="ar" data-subj="4세대  이상 가구" title="&lt;p&gt;가구주와 그&lt;span style=&quot;line-height: 20.8px;&quot;&gt;&amp;nbsp;직계 또는 방계의 친족 4세대가 함께 사는 가구&#40;부부+자녀+손자녀+부모 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <!--2016.08.23 권차욱 9월 서비스 - 5세대 이상 가구 삭제  -->
										        
										        <!--2016.08.23 권차욱 9월 서비스 - 라인추가 -->
										        <div style="width:260px;height:1px;border-bottom:1px dashed #cccccc;margin-bottom:5px;"></div>
										        <li>
										            <input type="checkbox" id="rd_household06" name="household_type" value="A0" />
										            <label for="rd_household06">1인가구</label>
										            <a href="javascript:void(0)" class="ar" data-subj="1인가구" title="혼자서 살림하는 가구"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_household07" name="household_type" value="B0" />
										            <label for="rd_household07">비혈연가구</label>
										            <a href="javascript:void(0)" class="ar" data-subj="비혈연가구" title="&lt;p&gt;비혈연 관계인만으로 구성된 가구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										    </ul>
									    </div> 
									    
									    <a href="javascript:void(0)" class="roundTextBox" id="householdOcptnTab" style="display:none;"> <!-- 2016.08.23 권차욱 9월 서비스 -->
									    	<input type="checkbox" />
											<span>점유형태(다중선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<ul class="multiCheckBox">
										        <li>
										            <input type="checkbox" id="rd_occupy01" name="ocptn_type" value="1" />
										            <label for="rd_occupy01">자기집</label>
										            <a href="javascript:void(0)" class="ar" data-subj="자기집" title="법률상 소유 여하를 불문하고 실제 거주자 소유로 되어 있는 집"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_occupy02" name="ocptn_type" value="2" />
										            <label for="rd_occupy02">전세(월세없음)</label>
										            <a href="javascript:void(0)" class="ar" data-subj="전세" title="일정액의 현금 또는 기타 방법으로 전세금을 내고 계약기간 세 들어 사는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_occupy03" name="ocptn_type" value="3" />
										            <label for="rd_occupy03">보증금 있는 월세</label>
										            <a href="javascript:void(0)" class="ar" data-subj="보증금 있는 월세" title="일정액의 보증금을 내고 매월 집세를 내는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_occupy04" name="ocptn_type" value="4" />
										            <label for="rd_occupy04">보증금 없는 월세</label>
										            <a href="javascript:void(0)" class="ar" data-subj="보증금 없는 월세" title="일정액의 보증금 없이 매월 집세(또는 월세)를 내는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_occupy05" name="ocptn_type" value="5" />
										            <label for="rd_occupy05">사글세</label>
										            <a href="javascript:void(0)" class="ar" data-subj="사글세" title="세입자가 집세를 한꺼번에 내고 매월 1개월분의 집세를 공제하는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_occupy06" name="ocptn_type" value="6" />
										            <label for="rd_occupy06">무상(관사, 사택, 친척집 등)</label>
										            <a href="javascript:void(0)" class="ar" data-subj="무상" title="다른 사람 소유의 건물 등을 사용하지만 임차료 등 대가를 지불하지 않는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										    </ul>
									    </div> 
									</div>
	                            </div>
	                            <!-- 가구 조건 End -->
	                            
	                            <!-- 주택 조건 Start -->
	                            <div class="cm03 population_tab"  id="API_0306">
	                            	<div class="stepBox"> 
	                            		<p class="on">조사년도(필수)
									    	<select title="주택조건 조사년도" id="house_year" name="house_year" style="font-size:13px;">
									     	</select> 
									    </p>   
									</div>
									<div class="stepBox"> 
										<a href="javascript:void(0)" class="roundTextBox" id="houseTypeTab">
											<input type="checkbox" />
											<span>주택유형(다중선택)</span>
										</a>
									    <div class="joinDefault">
									    	<ul class="multiCheckBox">
										        <li>
										            <input type="checkbox" id="rd_home01" name="house_type" value="01" />
										            <label for="rd_home01">단독주택</label>
										            <a href="javascript:void(0)" class="ar" data-subj="단독주택" title="&lt;p&gt;한 가구가 생활 할 수 있도록 건축된 일반 단독주택과 여러 가구가 살 수 있도록 설계된 다가구 단독주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_home02" name="house_type" value="02" />
										            <label for="rd_home02">아파트</label>
										            <a href="javascript:void(0)" class="ar" data-subj="아파트" title="&lt;p&gt;한 건물 내에 여러 가구가 거주할 수 있도록 지은 5층 이상의 공동주택으로 건축 당시&lt;span style=&quot;line-height: 20.8px;&quot;&gt;&amp;nbsp;&amp;lsquo;아파트&amp;rsquo;로&lt;/span&gt;&amp;nbsp;허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_home03" name="house_type" value="03" />
										            <label for="rd_home03">연립주택</label>
										            <a href="javascript:void(0)" class="ar" data-subj="연립주택" title="&lt;p&gt;한 건물 안에 여러 가구가 살 수 있도록 지은 4층 이하의 공동주택으로&amp;nbsp;건축 당시 &amp;lsquo;연립주택&amp;rsquo;으로 허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_home04" name="house_type" value="04" />
										            <label for="rd_home04">다세대주택</label>
										            <a href="javascript:void(0)" class="ar" data-subj="다세대주택" title="&lt;p&gt;한 건물 내에 여러 가구가 살 수 있도록 건축된 4층 이하의 공동주택으로&amp;nbsp;건물의 연면적이 660㎡이하이면서 건축 당시 다세대주택으로 허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_home05" name="house_type" value="05" />
										            <label for="rd_home05">비주거용건물(상가,공장,여관 등)내주택</label>
										            <a href="javascript:void(0)" class="ar" data-subj="비거주용건물 내 주택" title="&lt;p&gt;비거주용 건물 내에 주택의 요건&#40;방, 부엌, 독립된 출입구&#41;을 갖추고 있는 주거 부분이 있는 경우&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										        <li>
										            <input type="checkbox" id="rd_home06" name="house_type" value="06" />
										            <label for="rd_home06">주택이외의 거처</label>
										            <a href="javascript:void(0)" class="ar" data-subj="주택이외의 거처" title="&lt;p&gt;주택 요건을 갖추기 못한 거처&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
										        </li>
										    </ul>
									    </div>
									     
									   	<a href="javascript:void(0)" class="roundTextBox" id="houseConstYearTab" style="display:none;">	<!-- 2016.08.30 권차욱 9월 서비스 : display:none; -->
									    	<input type="checkbox" />
											<span>건축년도(선택)</span>
									    </a>
									    <div class="joinDefault" style="display:none;"> <!-- 2016.08.30 권차욱 9월 서비스 : display:none; -->
									    	<ul>
										        <li>
				                                    <div class="defaultLine">
				                                    	<select title="시작년도" id="houseConstYear" name="const_year">
				                                    		<option value="01">2010년</option>
                                                           	<option value="02">2009년</option>
                                                           	<option value="03">2008년</option>
                                                           	<option value="04">2007년</option>
                                                           	<option value="05">2006년</option>
                                                           	<option value="06">2005년</option>
                                                           	<option value="07">2000년~2004년</option>
                                                           	<option value="08">1995년~1999년</option>
                                                           	<option value="09">1990년~1994년</option>
                                                           	<option value="10">1980년~1989년</option>
                                                           	<option value="11">1970년~1979년</option>
                                                           	<option value="12">1960년~1969년</option>
                                                           	<option value="13">1959년 이전</option>
									        			</select>
				                                    </div>
										        </li> 
										    </ul> 
									    </div>
									    
									    <!-- 2016.08.30 권차욱 9월 서비스 : 주택사용기간 -->
									    <a href="javascript:void(0)" class="roundTextBox" id="houseUsePeriodTab">
									    	<input type="checkbox" />
											<span>노후년수(선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<ul>
										        <li>
				                                    <div class="defaultLine">
				                                    	<select title="시작년도" id="houseUsePeriod" name="house_use_prid_cd">
				                                    		<option value="01">1년 미만</option>
				                                    		<option value="02">1년 ~ 2년 미만</option>
				                                    		<option value="03">2년 ~ 3년 미만</option>
				                                    		<option value="04">3년 ~ 4년 미만</option>
				                                    		<option value="05">4년 ~ 5년 미만</option>
				                                    		<option value="06">5년 ~ 10년 미만</option>
				                                    		<option value="07">10년 ~ 15년 미만</option>
				                                    		<option value="08">15년 ~ 20년 미만</option>
				                                    		<option value="09">20년 ~ 30년 미만</option>
				                                    		<option value="10">30년 ~ 40년 미만</option>
				                                    		<option value="11">40년 ~ 50년 미만</option>
				                                    		<option value="12">50년 이상</option>
									        			</select>
				                                    </div>
										        </li> 
										    </ul> 
									    </div>
									     
									    <!-- 2016.08.30 권차욱  9월 서비스 --> 
									   	<a href="javascript:void(0)" class="roundTextBox" id="houseBdspaceTab">
									    	<input type="checkbox" />
											<span>연면적(선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<div class="box_area_option02">
				                                <div class="mgb_12">
				                                    <p class="houseArea">
				                                        <select title="시작범위" id="houseBdspaceFrom" name="bdspace_from"></select>
				                                        <span>초과 ~ </span>
				                                        <select title="마지막범위" id="houseBdspaceTo" name="bdspace_to"></select>
				                                        <span id="houseBdspaceToText">이하</span>
				                                    </p>
				                                    <p class="m2Area">
				                                        <span class="houseBdspaceFrom"></span>
				                                        <span>초과 ~</span>
				                                        <span class="houseBdspaceTo"></span>
				                                        <span class="houseBdspaceToText">이하</span>
				                                    </p>
				                                </div>
				                                <div id="slider-range3" class="slider-range"></div>
				                                <ul class="slider_controll_bar_long">
				                                    <li>0</li>
				                                    <li style="margin-left:-12px;">20</li>
				                                    <li style="margin-left:-12px;">40</li>
				                                    <li style="margin-left:-14px;">60</li>
				                                    <li style="margin-left:-14px;">85</li>
				                                    <li style="margin-left:-14px;">100</li>
				                                    <li style="margin-left:-14px;">130</li>
				                                    <li style="margin-left:-14px;">165</li>
				                                    <li style="margin-left:-12px;">230</li>
				                                    <li style="margin-left:-18px;">+</li>
				                                </ul> 
					                            </div>
										    </div>
									    
									</div>
	                            </div>
	                            <!-- 주택 조건 End -->
	                            
	                            <!-- 인구+가구+주택 결합조건 Start-->
	                            <div class="cm04 population_tab"  id="API_4011">
	                            	<div class="stepBox">
	                            		<div class="roundTextBox fl">조사년도(필수)
									   		<select title="인구조건 조사년도" id="population_year_combine" name="population_year_combine" class="fl" style="font-size:13px;">
											</select>
									    </div>
									    <!-- 2016.03.18 수정, 도움말 추가 -->
<!-- 									    <div class="fusionHelper"> -->
<!-- 									    	<div> -->
<!-- 									    		<span>*결합조건은 인구(특별조사구와 외국인 제외), 가구(집단가구 제외), 주택(주택 이외의 거처 제외)의</span><br> -->
<!-- 									    		<span>&nbsp;&nbsp;세가지 조건을 모두 충족하는 자료만 대상이므로 이용 시 유의바랍니다.</span> -->
<!-- 									    	</div> -->
<!-- 									    </div> -->
									    <ul class="dbTypeCk flType01 radioStepBox validationStepBox"> <!-- 2016.03.21 수정, class추가 -->
							                <li>
							                    <input type="radio" name="rd_combine_base" id="rd_combine_base01" value="population" />
									            <label for="rd_combine_base01" class="mr20" style="display:none;">인구(명) 기준</label> <!-- 2016.08.23 권차욱 9월 서비스 -->
									           <!--  <span id="rd_combine_base01-hidden" class="mr20 ml20">인구(명) 기준</span> -->
									            <input type="radio" name="rd_combine_base" id="rd_combine_base02" value="household" />
									            <label for="rd_combine_base02" class="mr20" style="display:none;">가구수(가구) 기준</label>	<!-- 2016.08.23 권차욱 9월 서비스 -->
									            <!-- <span id="rd_combine_base02-hidden" class="mr20 ml20">가구수(가구) 기준</span> -->
									            <input type="radio" name="rd_combine_base" id="rd_combine_base03" value="house" />
									            <label for="rd_combine_base03" style="display:none;">주택수(호) 기준</label>	<!-- 2016.08.23 권차욱 9월 서비스 -->
									           <!--  <span id="rd_combine_base03-hidden" class="ml20">주택수(호) 기준</span> -->
							                </li> 
									    </ul>
									</div>
									<div class="stepBox join">
							            <div class="joinStepBox first" id="fusionPopulation">
							            	<a href="javascript:void(0)" class="roundTextBox" id="populationGenderTab_combine">
										    	<input type="checkbox" />
												<span>성별(선택)</span>
										    </a>
										     <div class="joinDefault">
								            	<ul class="dbTypeCk radioStepBox validationStepBox"> <!-- 2016.03.21 수정, class추가 --> 
									                <li>
									                	<input type="radio" id="population_gender_combine01" name="population_gender_combine"  value="0"/>
											            <label for="population_gender_combine01" class="mr20">전체</label> 
											            <input type="radio" id="population_gender_combine02" name="population_gender_combine" value="1"/>
											            <label for="population_gender_combine02" class="mr20">남자</label>
											            <input type="radio" id="population_gender_combine03" name="population_gender_combine" value="2"/>
											            <label for="population_gender_combine03">여자</label>
									                </li> 
											    </ul> 
								    		</div>
								    		
										    <a href="javascript:void(0)" class="roundTextBox" id="populationAgeTab_combine">
										    	<input type="checkbox" />
												<span>연령(선택)</span>
										    </a>
										    <div class="joinDefault">
										    	<div class="box_area_option02">
										    		<!-- 9월서비스 권차욱 수정 -->
					                                <div class="mgb_12">
					                                    <p class="houseArea">
					                                        <select title="시작범위" id="populationAgeFrom_combine" name="age_from_combine"></select>
					                                        <span>이상 ~ </span>
					                                        <select title="마지막범위" id="populationAgeTo_combine" name="age_to_combine"></select>
					                                        <span id="ageToText_combine">미만</span>
					                                    </p> 
					                                </div> 
					                                
					                                <div id="slider-range2_combine" class="slider-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 19.7324%; width: 8.3612%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 19.7324%;"></a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 28.0936%;"></a></div>
					                                <ul class="slider_controll_bar">
					                                	<!-- 2016.09.08 9월 서비스 -->
					                                    <li style="margin-left:-8px;">0</li>
					                                    <li style="margin-left:12px;">20</li>
					                                    <li style="margin-left:8px;">40</li>
					                                    <li style="margin-left:7px;">60</li>
					                                    <li style="margin-left:9px;">80</li>
					                                    <li style="margin-left:7px;">100+</li>
					                                </ul>
					                            </div>
										    </div>
										    
										    <a href="javascript:void(0)" class="roundTextBox" id="populationEduTab_combine" style="display:none;"> <!-- 2016.08.23 권차욱 9월 서비스  -->
										    	<input type="checkbox" />
												<span>교육정도별(다중선택)</span>
										    </a>
										    <div class="joinDefault">
										    	<!-- <ul class="studyType">
			                                    	<li>
			                                    		<select id="populationEduLevel_combine" title="교육정도선택">
			                                    			<option value="">교육정도선택</option>
			                                    			<option value="1">수학없음(미취학포함)</option>
	                                                        <option value="2">초등학교</option>
	                                                        <option value="3">중학교</option>
	                                                        <option value="4">고등학교</option>
	                                                        <option value="5">전문학사</option>
	                                                        <option value="6">학사</option>
	                                                        <option value="7">석사</option>
	                                        				<option value="8">박사</option>
			                                    		</select>
			                                    	</li>
			                                    </ul> -->
			                                    <ul class="dbTypeCk honinType multiCheckBox">
			                                    	<li>
			                                    		<input type="checkbox" name="edulevel_combine" id="edu_level_combine01" value="1" />
											            <label for="edu_level_combine01">수학없음</label>
											            <input type="checkbox" name="edulevel_combine" id="edu_level_combine02" value="2" />
											            <label for="edu_level_combine02">초등학교</label>
			                                    	</li>
			                                    	<li>
			                                    		<input type="checkbox" name="edulevel_combine" id="edu_level_combine03" value="3" />
											            <label for="edu_level_combine03">중학교</label>
											            <input type="checkbox" name="edulevel_combine" id="edu_level_combine04" value="4" />
											            <label for="edu_level_combine04">고등학교</label>
			                                    	</li>
			                                    	<li>
			                                    		<input type="checkbox" name="edulevel_combine" id="edu_level_combine05" value="5" />
											            <label for="edu_level_combine05">전문학사</label>
											            <input type="checkbox" name="edulevel_combine" id="edu_level_combine06" value="6" />
											            <label for="edu_level_combine06">학사</label>
			                                    	</li>
			                                    	<li>
			                                    		<input type="checkbox" name="edulevel_combine" id="edu_level_combine07" value="7" />
											            <label for="edu_level_combine07">석사</label>
											            <input type="checkbox" name="edulevel_combine" id="edu_level_combine08" value="8" />
											            <label for="edu_level_combine08">박사</label>
			                                    	</li>
		                                   		 </ul>
										    </div>
										    
										    <a href="javascript:void(0)" class="roundTextBox" id="populationMarryTab_combine" style="display:none;"> <!-- 2016.08.23 권차욱 9월 서비스 -->
										   		<input type="checkbox" />
												<span>혼인정도별(다중선택)</span>
										    </a>
										    <div class="joinDefault">
										    	<ul class="dbTypeCk honinType multiCheckBox">
			                                    	<li>
			                                    		<input type="checkbox" name="mrg_state_combine" id="rd_honin_combine01" value="1" />
											            <label for="rd_honin_combine01">미혼</label>
											            <input type="checkbox" name="mrg_state_combine" id="rd_honin_combine02" value="4" />
											            <label for="rd_honin_combine02">이혼</label>
			                                    	</li>
			                                    	<li>
			                                    		<input type="checkbox" name="mrg_state_combine" id="rd_honin_combine03" value="2" />
											            <label for="rd_honin03">기혼</label>
											            <input type="checkbox" name="mrg_state_combine" id="rd_honin_combine04" value="3" />
											            <label for="rd_honin04">사별</label>
			                                    	</li>
			                                    </ul>
										    </div>
							            </div>
							            
							            <div class="joinStepBox" id="fusionHousehold">
							            	<a href="javascript:void(0)" class="roundTextBox" id="householdTypeTab_combine">
							            		<input type="checkbox" />
												<span>세대구성(다중선택)</span>
							            	</a>
							            	<div class="joinDefault">
								            	<ul class="multiCheckBox" style="width:250px;"> 
									                <li>
											            <input type="checkbox" id="rd_household_combine01" name="household_type_combine" value="01" />
											            <label for="rd_household_combine01">1세대 가구</label>
											            <a href="javascript:void(0)" class="ar" data-subj="1세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 같은 세대에 속하는 친족들만 함께사는 가구&#40;부부, 부부+형제자매 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_household_combine02" name="household_type_combine" value="02" />
											            <label for="rd_household_combine02">2세대 가구</label>
											            <a href="javascript:void(0)" class="ar" data-subj="2세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 그 직계 또는 방계의 친족 2세대가 함께 사는 가구&#40;부부+자녀 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_household_combine03" name="household_type_combine" value="03" />
											            <label for="rd_household_combine03">3세대 가구</label>
											            <a href="javascript:void(0)" class="ar" data-subj="3세대 가구" title="&lt;p&gt;&lt;span style=&quot;line-height: 20.8px;&quot;&gt;가구주와 그 직계 또는 방계의 친족 3세대가 함께 사는 가구&#40;부부+자녀+부모 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_household_combine04" name="household_type_combine" value="04" />
											            <label for="rd_household_combine04">4세대  이상 가구</label>  <!-- 2016.08.23 권차욱 9월 서비스 - 4세대가구->4세대이상가구 -->
											            <a href="javascript:void(0)" class="ar" data-subj="4세대 이상 가구" title="&lt;p&gt;가구주와 그&lt;span style=&quot;line-height: 20.8px;&quot;&gt;&amp;nbsp;직계 또는 방계의 친족 4세대가 함께 사는 가구&#40;부부+자녀+손자녀+부모 등&#41;&lt;/span&gt;&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <!-- 2016.08.23 권차욱 9월 서비스 - 5세대 이상 가구 삭제-->
											        
											         <!--2016.08.23 권차욱 9월 서비스 - 라인추가 -->
										        	<div style="width:260px;height:1px;border-bottom:1px dashed #cccccc;margin-bottom:5px;"></div>
											        <li>
											            <input type="checkbox" id="rd_household_combine06" name="household_type_combine" value="A0" />
											            <label for="rd_household_combine06">1인가구</label>
											            <a href="javascript:void(0)" class="ar" data-subj="1인가구" title="혼자서 살림하는 가구"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_household_combine07" name="household_type_combine" value="B0" />
											            <label for="rd_household_combine07">비혈연가구</label>
											            <a href="javascript:void(0)" class="ar" data-subj="비혈연가구" title="&lt;p&gt;비혈연 관계인만으로 구성된 가구&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											    </ul>
										    </div>
										    
										    <a href="javascript:void(0)" class="roundTextBox" id="householdOcptnTab_combine" style="display:none;"> <!-- 2016.08.23 권차욱 9월 서비스 -->
										    	<input type="checkbox" />
												<span>점유형태(다중선택)</span>
										    </a>
							            	<div class="joinDefault">
								            	<ul class="multiCheckBox" style="width:250px;"> 
									                <li>
											            <input type="checkbox" id="rd_occupy_combine01" name="ocptn_type_combine" value="1" />
											            <label for="rd_occupy_combine01">자기집</label>
											            <a href="javascript:void(0)" class="ar" data-subj="자기집" title="법률상 소유 여하를 불문하고 실제 거주자 소유로 되어 있는 집"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_occupy_combine02" name="ocptn_type_combine" value="2" />
											            <label for="rd_occupy_combine02">전세(월세없음)</label>
											            <a href="javascript:void(0)" class="ar" data-subj="전세" title="일정액의 현금 또는 기타 방법으로 전세금을 내고 계약기간 세 들어 사는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_occupy_combine03" name="ocptn_type_combine" value="3" />
											            <label for="rd_occupy_combine03">보증금 있는 월세</label>
											            <a href="javascript:void(0)" class="ar" data-subj="보증금 있는 월세" title="일정액의 보증금을 내고 매월 집세를 내는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_occupy_combine04" name="ocptn_type_combine" value="4" />
											            <label for="rd_occupy_combine04">보증금 없는 월세</label>
											            <a href="javascript:void(0)" class="ar" data-subj="보증금 없는 월세" title="일정액의 보증금 없이 매월 집세(또는 월세)를 내는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_occupy_combine05" name="ocptn_type_combine" value="5" />
											            <label for="rd_occupy_combine05">사글세</label>
											            <a href="javascript:void(0)" class="ar" data-subj="사글세" title="세입자가 집세를 한꺼번에 내고 매월 1개월분의 집세를 공제하는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_occupy_combine06" name="ocptn_type_combine" value="6" />
											            <label for="rd_occupy_combine06">무상(관사, 사택, 친척집 등)</label>
											            <a href="javascript:void(0)" class="ar" data-subj="무상" title="다른 사람 소유의 건물 등을 사용하지만 임차료 등 대가를 지불하지 않는 경우"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											    </ul>
										    </div>
							            </div>
							            
							            <div class="joinStepBox" id="fusionHouse">
							            	<a href="javascript:void(0)" class="roundTextBox" id="houseTypeTab_combine">
							            		<input type="checkbox" />
												<span>주택유형(다중선택)</span>
							            	</a>
							            	<div class="joinDefault">
								            	<ul class="multiCheckBox" style="width:250px;"> 
									                <li>
											            <input type="checkbox" id="rd_home_combine01" name="house_type_combine" value="01" />
											            <label for="rd_home_combine01">단독주택</label>
											            <a href="javascript:void(0)" class="ar" data-subj="단독주택" title="&lt;p&gt;한 가구가 생활 할 수 있도록 건축된 일반 단독주택과 여러 가구가 살 수 있도록 설계된 다가구 단독주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_home_combine02" name="house_type_combine" value="02" />
											            <label for="rd_home_combine02">아파트</label>
											            <a href="javascript:void(0)" class="ar" data-subj="아파트" title="&lt;p&gt;한 건물 내에 여러 가구가 거주할 수 있도록 지은 5층 이상의 공동주택으로 건축 당시&lt;span style=&quot;line-height: 20.8px;&quot;&gt;&amp;nbsp;&amp;lsquo;아파트&amp;rsquo;로&lt;/span&gt;&amp;nbsp;허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_home_combine03" name="house_type_combine" value="03" />
											            <label for="rd_home_combine03">연립주택</label>
											            <a href="javascript:void(0)" class="ar" data-subj="연립주택" title="&lt;p&gt;한 건물 안에 여러 가구가 살 수 있도록 지은 4층 이하의 공동주택으로&amp;nbsp;건축 당시 &amp;lsquo;연립주택&amp;rsquo;으로 허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_home_combine04" name="house_type_combine" value="04" />
											            <label for="rd_home_combine04">다세대주택</label>
											            <a href="javascript:void(0)" class="ar" data-subj="다세대주택" title="&lt;p&gt;한 건물 내에 여러 가구가 살 수 있도록 건축된 4층 이하의 공동주택으로&amp;nbsp;건물의 연면적이 660㎡이하이면서 건축 당시 다세대주택으로 허가받은 주택&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <li>
											            <input type="checkbox" id="rd_home_combine05" name="house_type_combine" value="05" />
											            <label for="rd_home_combine05">비주거용건물(상가,공장,여관 등)내주택</label>
											            <a href="javascript:void(0)" class="ar" data-subj="비거주용건물" title="&lt;p&gt;비거주용 건물 내에 주택의 요건&#40;방, 부엌, 독립된 출입구&#41;을 갖추고 있는 주거 부분이 있는 경우&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
											        </li>
											        <!-- 2016.08.23 권차욱 9월 서비스 - 주택이외의 거처 살림 -->
											        <li> 
 											            <input type="checkbox" id="rd_home_combine06" name="house_type_combine" value="06" />
											            <label for="rd_home_combine06">주택이외의 거처</label>
											            <a href="javascript:void(0)" class="ar" data-subj="주택이외의 거처" title="&lt;p&gt;주택 요건을 갖추기 못한 거처&lt;/p&gt;
"><img src="/img/ico/ico_tooltip01.png" /></a>
 											        </li> 
											    </ul>
										    </div>
										    
										    <a href="javascript:void(0)" class="roundTextBox" id="houseConstYearTab_combine" style="display:none;">	<!-- 2016.08.30 권차욱 9월 서비스 : display:none; -->
										    	<input type="checkbox" />
												<span>건축년도(선택)</span>
										    </a>
										    <div class="joinDefault" style="display:none;">	<!-- 2016.08.30 권차욱 9월 서비스 : display:none; -->
										    	<div class="box_area_option02">
					                                <ul>
				                                    	<li>
				                                    		<select title="시작년도" id="houseConstYear_combine" name="const_year_combine">
					                                    		<option value="01">2010년</option>
	                                                           	<option value="02">2009년</option>
	                                                           	<option value="03">2008년</option>
	                                                           	<option value="04">2007년</option>
	                                                           	<option value="05">2006년</option>
	                                                           	<option value="06">2005년</option>
	                                                           	<option value="07">2000년~2004년</option>
	                                                           	<option value="08">1995년~1999년</option>
	                                                           	<option value="09">1990년~1994년</option>
	                                                           	<option value="10">1980년~1989년</option>
	                                                           	<option value="11">1970년~1979년</option>
	                                                           	<option value="12">1960년~1969년</option>
	                                                           	<option value="13">1959년 이전</option>
										        			</select>
				                                    	</li>
				                                    </ul>
					                            </div>
										    </div>
										    
										    <!-- 2016.08.30 권차욱 9월 서비스 : 노후년수 -->
										    <a href="javascript:void(0)" class="roundTextBox" id="houseUsePeriodTab_combine">
										    	<input type="checkbox" />
												<span>노후년수(선택)</span>
										    </a>
										    <div class="joinDefault">
										    	<ul>
											        <li>
					                                    <div class="defaultLine">
					                                    	<select title="시작년도" id="houseUsePeriod_combine" name="house_use_prid_cd_combine">
					                                    		<option value="01">1년 미만</option>
					                                    		<option value="02">1년 ~ 2년 미만</option>
					                                    		<option value="03">2년 ~ 3년 미만</option>
					                                    		<option value="04">3년 ~ 4년 미만</option>
					                                    		<option value="05">4년 ~ 5년 미만</option>
					                                    		<option value="06">5년 ~ 10년 미만</option>
					                                    		<option value="07">10년 ~ 15년 미만</option>
					                                    		<option value="08">15년 ~ 20년 미만</option>
					                                    		<option value="09">20년 ~ 30년 미만</option>
					                                    		<option value="10">30년 ~ 40년 미만</option>
					                                    		<option value="11">40년 ~ 50년 미만</option>
					                                    		<option value="12">50년 이상</option>
										        			</select>
					                                    </div>
											        </li> 
											    </ul> 
										    </div>
										    
										    <!-- 2016.09.09 권차욱  9월 서비스 -->
										    <a href="javascript:void(0)" class="roundTextBox" id="houseBdspaceTab_combine">
										    	<input type="checkbox" />
												<span>연면적(선택)</span>
										    </a>
										    <div class="joinDefault">
										    	<div class="box_area_option02">
					                                <div class="mgb_12">
					                                    <p class="houseArea">
					                                        <select title="시작범위" id="houseBdspaceFrom_combine" name="bdspace_from_combine"></select>
					                                        <span>초과 ~</span>
					                                        <select title="마지막범위" id="houseBdspaceTo_combine" name="bdspace_to_combine"></select>
					                                        <span id="houseBdspaceToText_combine">이하</span>
					                                    </p>
					                                    <p class="m2Area">
					                                        <span class="houseBdspaceFrom_combine">약 18.2평</span>
					                                        <span>초과 ~</span>
					                                        <span class="houseBdspaceTo_combine">약 25.8평</span>
					                                        <span class="houseBdspaceToText_combine">이하</span>
					                                    </p>
					                                </div>
					                                <div id="slider-range3_combine" class="slider-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false"><div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 19.7324%; width: 8.3612%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 19.7324%;"></a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 28.0936%;"></a></div>
					                                <ul class="slider_controll_bar">
						                                    <li style="margin-left:-6px;">0</li>
						                                    <li style="margin-left:-11px;">20</li>
						                                    <li style="margin-left:-11px;">40</li>
						                                    <li style="margin-left:-9px;">60</li>
						                                    <li style="margin-left:-10px;">85</li>
						                                    <li style="margin-left:-10px;">100</li>
						                                    <li style="margin-left:-10px;">130</li>
						                                    <li style="margin-left:-10px;">165</li>
						                                    <li style="margin-left:-10px;">230</li>
						                                    <li style="margin-left:224px;position:absolute;">+</li>
						                                </ul> 
					                            </div>
										    </div>
							            </div>
									</div>
	                            </div>
	                            <!-- 인구+가구+주택 결합조건 End -->
							</div>
							
							<!-- 농림어가총조사 통계 -->
							<div class="totalResult tr03">
	                            <ol class="cateMenu type02" id="3fTabDiv">
	                                <li class="on"><a href="javascript:$interactiveLeftMenu.ui.tripleFTab('farm');" data-subj="조건설정 팁" title="&lt;p&gt;농림어업총조사 항목 중 상세조건 설정에 따른 가구통계 조회가 가능합니다.&lt;br /&gt;
- 농가 : 생계, 영리, 연구를 목적으로 농업을 경영하거나 농업에 종사하는 농가로 조사기준 시점 현재 농가로 정의된 가구&lt;/p&gt;
">농가</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.tripleFTab('forest');" data-subj="조건설정 팁" title="&lt;p&gt;농림어업총조사 항목 중 상세조건 설정에 따른 가구통계 조회가 가능합니다.&lt;br /&gt;
- 임가 : 조사기준일 현재 산림면적을 3ha 이상 보유하면서 지난 5년간 육림작업 실적이 있거나 지난 1년간 벌목업, 양묘업을 경영하였거나, 직접 생산한 임산물의 판매금액이 120만 원 이상인 가구&lt;/p&gt;
">임가</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.tripleFTab('fish');" data-subj="조건설정 팁" title="&lt;p&gt;농림어업총조사 항목 중 상세조건 설정에 따른 가구통계 조회가 가능합니다.&lt;br /&gt;
- 어가 : 지난 1년간 판매 목적으로 1개월 이상 어선어업, 마을어업, 양식어업을 직접 경영한 가구이거나, 지난 1년간 직접 어획하거나 양식한 수산물의 판매금액이 120만 원 이상인 가구&lt;/p&gt;
">어가</a></li>
	                            </ol>
	                            
	                            <!-- 농가 Start -->
	                            <div class="cm01" id="API_0310">
	                            	<div class="stepBox">
										<p class="on">조사년도(필수)
											<select title="농림어업 조사년도" id="3f_year" name="3f_year" style="font-size:13px;">
									        </select>
										</p>
										<p class="on" id="3fFishTab-title">어가 구분(필수)</p>
									    <ul class="dbTypeCk radioStepBox validationStepBox" id="3fFishTab-content"> <!-- 2016.03.21 수정, class추가 -->
									        <li>
									        	<input type="radio" name="3f_fish_ppl" id="3f_fish_see" value="1" checked=checked/>
									            <label for="3f_fish_see" class="mr20 on">해수면어가</label>
									            <input type="radio" name="3f_fish_ppl" id="3f_fish_land" value="2" />
									            <label for="3f_fish_land">내수면어가</label>
									        </li> 
									    </ul>
										<div class="txt01">필수항목 설정 시 가구기준 검색조건이 
										<br />생성되며, 선택항목 추가 설정시 가구원 기준으로 검색됩니다.</div>
									</div>
									
									<div class="stepBox">  
									    <div class="txt01">추가선택시 가구원 기준 검색</div>
									    <a href="javascript:void(0)" class="roundTextBox" id="3fGenderTab">
									    	<input type="checkbox" id="rt01">
									    	<span>가구원 성별(선택)</span>
									    </a> 
									    <div class="joinDefault">
										    <ul class="dbTypeCk radioStepBox">
										        <li>
										            <input type="radio" name="3f_gender" id="3f_gender01" value="0" checked=checked/>
										            <label for="3f_gender01" class="mr20 on">전체</label>
										            <input type="radio" name="3f_gender" id="3f_gender02" value="1" />
										            <label for="3f_gender02" class="mr20">남자</label>
										            <input type="radio" name="3f_gender" id="3f_gender03" value="2" />
										            <label for="3f_gender03">여자</label>
										        </li> 
										    </ul>
										</div> 
										
									    <a href="javascript:void(0)" class="roundTextBox" id="3fAgeTab">
									    	<input type="checkbox">
									    	<span>해당 가구원 연령(선택)</span>
									    </a>
									    <div class="joinDefault">
									    	<div class="box_area_option02">
									    		<!-- 9월서비스 권차욱 수정  -->
				                                <div class="mgb_12">
				                                    <p class="houseArea">
				                                        <select title="시작범위" id="3fAgeFrom" name="age_from"></select>
				                                        <span>이상 ~</span>
				                                        <select title="마지막범위" id="3fAgeTo" name="age_to"></select>
				                                        <span id="3fAgeToText">미만</span>
				                                    </p>
				                                </div>
				                                <div id="slider-range4" class="slider-range"></div>
				                                <ul class="slider_controll_bar">
				                                	<!-- 2016.09.08 9월 서비스 -->
				                                   	<li>0</li>
				                                    <li style="margin-left:4px;">20</li>
				                                    <li style="margin-left:-2px;">40</li>
				                                    <li style="margin-left:-2px;">60</li>
				                                    <li style="margin-left:-2px;">80</li>
				                                    <li style="margin-left:-5px;">100+</li>
				                                </ul> 
				                            </div>
									    </div>
									</div>
	                            </div>
	                            <!-- 농가 End -->
							</div>
							
							<!-- 사업체총조사 통계 Start -->
							<div class="totalResult tr04">
								<ol class="cateMenu" id="companyTabDiv">
	                                <li class="on"><a href="javascript:$interactiveLeftMenu.ui.companyTab('industry');" data-subj="조건설정 팁" title="전국사업체조사 항목 중 산업분류에 따른 사업체통계 조회가 가능합니다.</br>- 산업분류 : 9차(2006년 이후), 8차(2005년 이전)</br>※ 장소가 일정치 않은 개인운수(개인택시 등)업체 제외">산업분류</a></li>
	                                <li><a href="javascript:$interactiveLeftMenu.ui.companyTab('theme');" data-subj="조건설정 팁" title="전국사업체조사 결과 중 생활밀접업종 대해 쉽게 통계조회가 가능합니다.</br>- 생활편의, 쇼핑, 교통, 숙박, 음식점, 공공, 교육, 기업">테마업종</a></li>
	                            </ol>
	                            
	                            <!-- 산업분류 Start -->
	                            <div class="cm01 company_tab" id="API_0304-b">
	                            	<div class="stepBox">
										<p class="on">조사년도(필수)
											<select title="사업체 조사년도" id="company_year" name="company_year" style="font-size:13px;">
									        </select>
										</p>
									    <!-- <ul>
									        <li>
			                                    <div class="etcRight">
			                                    	<span>산업분류차수</span>
				                                    <span>2006년~현재 :9차</span>
				                                    <span>2000년~2005년 :8차</span>
			                                    </div>
									        </li>
									    </ul> -->
									    <p class="on">대상 선택하기(필수)</p>
									    <ul class="radioStepBox validationStepBox">  <!-- 2016.03.21 수정, class추가 -->
									        <li>
									            <input type="checkbox" id="rd_cData_type01" name="cDataType" value="corp_cnt" checked=checked/>
									            <label for="rd_cData_type01" class="mr20 on">사업체수</label>
									            <input type="checkbox" id="rd_cData_type02" name="cDataType" value="tot_worker" />
									            <label for="rd_cData_type02">종사자수</label>
									        </li> 
									    </ul>
									</div>
									<div class="stepBox">
									    <a href="javascript:$interactiveLeftMenu.ui.companyClassView();" data-subj="표준산업분류목록 팁" title="설정한 조사년도 기준의 산업분류차수목록을 열람하여 조사 업종에 대하여 조회할 수 있습니다." class="roundArrBox">표준산업분류목록</a>
									</div>
	                            </div>
	                            <!-- 산업분류 End -->
	                            
	                            <!-- 테마업종 Start -->
	                            <div class="cm02 company_tab" id="API_0304-a">
	                            	<div class="stepBox">
										<p class="on">대상 선택하기, 필수</p>
									    <ul class="radioStepBox validationStepBox"> <!-- 2016.03.21 수정, class추가 -->
									        <li>
									            <input type="checkbox" id="rd_cDataType01" name="cDataType1" value="corp_cnt" checked=checked/>
									            <label for="rd_cDataType01" class="mr20 on">사업체수</label>
									            <input type="checkbox" id="rd_cDataType02" name="cDataType1" value="tot_worker" />
									            <label for="rd_cDataType02" class="mr20">종사자수</label>
									        </li>
									    </ul>
									    <p class="on">테마유형 사업체, 필수</p>
									    <div id="themeCodeList">
									    	<a href="javascript:void(0)" class="subRoundTextBox">
												<span>생활서비스</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
			                                    	<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_1001" value="1001" />
											            <label for="theme_1001">인테리어</label>
											            <input type="checkbox" name="theme_codes" id="theme_1002" value="1002" />
											            <label for="theme_1002">목욕탕</label>
											            <input type="checkbox" name="theme_codes" id="theme_1003" value="1003" />
											            <label for="theme_1003">교습학원</label>
											            <input type="checkbox" name="theme_codes" id="theme_1004" value="1004" />
											            <label for="theme_1004">어학원</label>
											            <input type="checkbox" name="theme_codes" id="theme_1005" value="1005" />
											            <label for="theme_1005">예체능학원</label>
											            <input type="checkbox" name="theme_codes" id="theme_1006" value="1006" />
											            <label for="theme_1006">부동산중개업</label>
											            <input type="checkbox" name="theme_codes" id="theme_1007" value="1007" />
											            <label for="theme_1007">이발소</label>
											            <input type="checkbox" name="theme_codes" id="theme_1008" value="1008" />
											            <label for="theme_1008">미용실</label>
											            <input type="checkbox" name="theme_codes" id="theme_1009" value="1009" />
											            <label for="theme_1009">세탁소</label>
											            <input type="checkbox" name="theme_codes" id="theme_1010" value="1010" />
											            <label for="theme_1010">PC방</label>
											            <input type="checkbox" name="theme_codes" id="theme_1011" value="1011" />
											            <label for="theme_1011">노래방</label>
			                                    	</li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>도소매</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_2001" value="2001" />
											            <label for="theme_2001">문구점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2002" value="2002" />
											            <label for="theme_2002">서점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2003" value="2003" />
											            <label for="theme_2003">편의점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2004" value="2004" />
											            <label for="theme_2004">식료품점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2005" value="2005" />
											            <label for="theme_2005">휴대폰점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2006" value="2006" />
											            <label for="theme_2006">의류</label>
											            <input type="checkbox" name="theme_codes" id="theme_2007" value="2007" />
											            <label for="theme_2007">화장품/방향제</label>
											            <input type="checkbox" name="theme_codes" id="theme_2008" value="2008" />
											            <label for="theme_2008">철물점</label>
											            <input type="checkbox" name="theme_codes" id="theme_2009" value="2009" />
											            <label for="theme_2009">주유소</label>
											            <input type="checkbox" name="theme_codes" id="theme_2010" value="2010" />
											            <label for="theme_2010">꽃집</label>
											            <input type="checkbox" name="theme_codes" id="theme_2011" value="2011" />
											            <label for="theme_2011">슈퍼마켓</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>숙박</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_4001" value="4001" />
											            <label for="theme_4001">호텔</label>
											            <input type="checkbox" name="theme_codes" id="theme_4002" value="4002" />
											            <label for="theme_4002">여관(모텔포함)및 여인숙</label>
											        </li>
			                                    </ul>
										    </div>
										    <a id="food" href="javascript:void(0)" class="subRoundTextBox">
												<span>음식점</span>
											</a>
											<div id="foodInfo" class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_5001" value="5001" />
											            <label for="theme_5001">한식</label>
											            <input type="checkbox" name="theme_codes" id="theme_5002" value="5002" />
											            <label for="theme_5002">중식</label>
											            <input type="checkbox" name="theme_codes" id="theme_5003" value="5003" />
											            <label for="theme_5003">일식</label>
											            <input type="checkbox" name="theme_codes" id="theme_5004" value="5004" />
											            <label for="theme_5004">분식</label>
											            <input type="checkbox" name="theme_codes" id="theme_5005" value="5005" />
											            <label for="theme_5005">서양식</label>
											            <input type="checkbox" name="theme_codes" id="theme_5006" value="5006" />
											            <label for="theme_5006">제과점</label>
											            <input type="checkbox" name="theme_codes" id="theme_5007" value="5007" />
											            <label for="theme_5007">패스트푸드</label>
											            <input type="checkbox" name="theme_codes" id="theme_5008" value="5008" />
											            <label for="theme_5008">치킨</label>
											            <input type="checkbox" name="theme_codes" id="theme_5009" value="5009" />
											            <label for="theme_5009">호프 및 간이주점</label>
											            <input type="checkbox" name="theme_codes" id="theme_5010" value="5010" />
											            <label for="theme_5010">카페</label>
											            <input type="checkbox" name="theme_codes" id="theme_5011" value="5011" />
											            <label for="theme_5011">기타 외국식</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>교통</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_3001" value="3001" />
											            <label for="theme_3001">지하철역</label>
											            <input type="checkbox" name="theme_codes" id="theme_3002" value="3002" />
											            <label for="theme_3002">터미널</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>공공</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_6001" value="6001" />
											            <label for="theme_6001">우체국</label>
											            <input type="checkbox" name="theme_codes" id="theme_6002" value="6002" />
											            <label for="theme_6002">행정기관</label>
											            <input type="checkbox" name="theme_codes" id="theme_6003" value="6003" />
											            <label for="theme_6003">경찰/지구대</label>
											            <input type="checkbox" name="theme_codes" id="theme_6004" value="6004" />
											            <label for="theme_6004">소방서</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>교육</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_7001" value="7001" />
											            <label for="theme_7001">초등학교</label>
											            <input type="checkbox" name="theme_codes" id="theme_7002" value="7002" />
											            <label for="theme_7002">중학교</label>
											            <input type="checkbox" name="theme_codes" id="theme_7003" value="7003" />
											            <label for="theme_7003">고등학교</label>
											            <input type="checkbox" name="theme_codes" id="theme_7004" value="7004" />
											            <label for="theme_7004">전문대학</label>
											            <input type="checkbox" name="theme_codes" id="theme_7005" value="7005" />
											            <label for="theme_7005">대학교</label>
											            <input type="checkbox" name="theme_codes" id="theme_7006" value="7006" />
											            <label for="theme_7006">대학원</label>
											            <input type="checkbox" name="theme_codes" id="theme_7007" value="7007" />
											            <label for="theme_7007">어린이보육업</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>기업</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_8001" value="8001" />
											            <label for="theme_8001">제조/화학</label>
											            <input type="checkbox" name="theme_codes" id="theme_8002" value="8002" />
											            <label for="theme_8002">서비스</label>
											            <input type="checkbox" name="theme_codes" id="theme_8003" value="8003" />
											            <label for="theme_8003">통신/IT</label>
											            <input type="checkbox" name="theme_codes" id="theme_8004" value="8004" />
											            <label for="theme_8004">건설</label>
											            <input type="checkbox" name="theme_codes" id="theme_8005" value="8005" />
											            <label for="theme_8005">판매/유통</label>
											            <input type="checkbox" name="theme_codes" id="theme_8006" value="8006" />
											            <label for="theme_8006">기타금융업</label>
											            <input type="checkbox" name="theme_codes" id="theme_8007" value="8007" />
											            <label for="theme_8007">기타의료업</label>
											            <input type="checkbox" name="theme_codes" id="theme_8008" value="8008" />
											            <label for="theme_8008">문화/체육</label>
											        </li>
			                                    </ul>
										    </div>
										    <a href="javascript:void(0)" class="subRoundTextBox">
												<span>편의/문화</span>
											</a>
											<div class="joinDefault">
										    	<ul class="dbTypeCk honinType subRadioStepBox">
										    		<li>
			                                    		<input type="checkbox" name="theme_codes" id="theme_9001" value="9001" />
											            <label for="theme_9001">백화점/중대형마트</label>
											            <input type="checkbox" name="theme_codes" id="theme_9002" value="9002" />
											            <label for="theme_9002">은행</label>
											            <input type="checkbox" name="theme_codes" id="theme_9003" value="9003" />
											            <label for="theme_9003">병원</label>
											            <input type="checkbox" name="theme_codes" id="theme_9004" value="9004" />
											            <label for="theme_9004">극장/영화관</label>
											            <input type="checkbox" name="theme_codes" id="theme_9005" value="9005" />
											            <label for="theme_9005">도서관/박물관</label>
											        </li>
			                                    </ul>
										    </div>
									    </div>
									</div> 
	                            </div>
	                            <!-- 테마업종 End --> 
							</div>
							<!-- 사업체총조사 통계 End -->
							
							<!-- 행정구역 통계목록보기 Start -->
							<div class="totalResult tr05">
								<div id="kosis">
	                            	<div class="stepBox">
									    <ul>
									        <li>
									            <input type="text" class="inp" id="kosisSearchText" placeholder="통계항목 검색" />
									            <a href="javascript:interactiveMapKosis.kosisSearch(0);" class="btn_stepSearch">검색</a>
									        </li>
									        <li style="height: auto; text-align: right; padding-top: 5px; margin-bottom: -8px;">
									        	<img src="/img/ico/kosis_gis_se_sido.png" style="vertical-align: middle;"> : 시도 </img>
									        	<img src="/img/ico/kosis_gis_se_sgg.png" style="vertical-align: middle;"> : 시군구 </img>
									        	<img src="/img/ico/kosis_gis_se_adm.png" style="vertical-align: middle;"> : 읍면동 </img>
									        </li>
									    </ul>
									</div>
									<!-- kosis 리스트 -->
								    <div class="stepTreeBox" id="kosisStatsTree"></div>

			                        <!-- 검색 리스트 -->
			                        <div class="stepBox xWidth" id="kosis_SearchBox" style="display: none;">
			                        	<div style="text-align: center;">
							            	<a href="javascript:interactiveMapKosis.kosisTreeShow();" class="btnStyle01">KOSIS 목록으로</a>
							        	</div>
										<p class="result">검색결과 : 5개</p>
							            <ul class="xWidth radioStepOneBox">
							                <li>
							                    <input type="radio" name="rd_goocha" id="rd_goocha01" />
									            <label for="rd_goocha01">농업, 임업 및 어업농업</label>
							                </li>
							                <li>
							                    <input type="radio" name="rd_goocha" id="rd_goocha02" />
									            <label for="rd_goocha02">광업</label>
							                </li>
							                <li>
							                    <input type="radio" name="rd_goocha" id="rd_goocha03" />
									            <label for="rd_goocha03">제조업</label>
							                </li>
							                <li>
							                    <input type="radio" name="rd_goocha" id="rd_goocha04" />
									            <label for="rd_goocha04">전기, 가스, 중기 및 수도사업</label>
							                </li>
									    </ul>
									    
									</div>
	                            </div>
							</div>
							<!-- 행정구역 통계목록보기 End --> 
							 
							 <!-- 공공데이터 통계목록보기 Start -->
							<div class="totalResult tr06">
	                            <div class="stepBox">
									<p>위치중심 공공데이터 목록</p>
								    <ul class="type01 publicData_stepBox" id="publicDataLeftList">
									</ul>
								</div>
							</div>
							<!-- 공공데이터 통계목록보기 End -->
							 
							 <!-- 사용자데이터업로드 Start -->
							<div class="totalResult tr07">
	                            <div class="stepBox"> 
								    <span class="txt">사용자가 보유하고 있는 txt, csv, Excel, KML 등의 포맷파일을 업로드하여 지도 위에 매핑할 수 있습니다
								    </span>
								    <p>나의 데이터에 저장된 목록</p>
								    <ul id="myDataLoadList">
								    </ul>
								    <div id="myDataListTablePage"></div>
								    <br/>
								    <div style="text-align: center;">
						            	<a href="/view/mypage/myData/dataList" class="btnStyle01">나의 데이터 이동</a>
						        	</div>
								</div>
	                            <div class="stepBox">
									<p>공개된 사용자 데이터 목록</p>
								    <ul id="shareDataLoadList">
								    </ul>
								    <div id="shareDataListTablePage"></div>
								</div>
							</div>
							<!-- 사용자데이터업로드 End --> 
							
							<!-- POI 위치조회 Start -->
							<div class="totalResult tr08">
	                            <div class="stepBox">
									POI 위치조회 내용 보류
								</div>
							</div>
							<!-- POI 위치조회 End -->
						</div>
						<div class="btnBottom">
		                	<a href="javascript:$interactiveLeftMenu.ui.addSearchBtn();" class="btnStyle02" id="buttonMakeBtn" data-subj="조건결합설정 팁" title="현재 선택된 통계항목 창에 해당하는 통계조건을 통계버튼으로 생성하여 통계값을 조회 할 수 있어요">검색조건 생성</a>
		                </div> 
					</div><!-- 사업체총조사 통계조건 end --> 
					
					<!-- 3Depth start -->
					<!-- 해당분류 세부업종 선택하기 start -->
					<div class="quickBox step03" id="companyClassListDiv">
						<div class="subj">
							<span>산업분류목록 선택하기</span>
							<a href="javascript:void(0)" class="stepClose">닫기</a>
						</div>
						<div class="normalBox">
							<div class="stepBox">
								<ul>
							        <li>
							            <input type="text" class="inp" id="companySearchText" placeholder="통계항목 검색" />
							            <a href="javascript:$interactiveLeftMenu.ui.companySearch(0);" class="btn_stepSearch">검색</a>
							        </li>
							    </ul>
							</div>
							<!-- 산업분류 리스트 -->
					        <div class="stepTreeBox" id="company_TreeBox">
	                        </div>
	                        
	                        <!-- 산업분류 검색 리스트 -->
	                        <div class="stepBox xWidth" id="company_SearchBox" style="display: none;">
								<p class="result">검색결과 : <span id="companySearchCount"></span>개</p>
					            <ul class="xWidth radioStepOneBox2" id="companySearchDataList">
							    </ul>
							    <div id="companyTablePage"></div>
								<br/>
							    <div style="text-align: center;">
					            	<a href="javascript:$interactiveLeftMenu.ui.companyTreeShow();" class="btnStyle01">산업분류 목록으로</a>
					        	</div>
							</div>
						</div>
						<div class="btnBottom">
	                        <a href="javascript:$interactiveLeftMenu.ui.addSearchBtn();" class="btnStyle02">산업조건 버튼생성</a>
	                    </div>
					</div>
					<!-- 해당분류 세부업종 선택하기 end -->
					
					<!-- KOSIS 세부 항목 Start -->
					<!-- 9월 서비스 - kosis 상세항목메뉴 수정  -->
					<!-- <div class="popBox hangjungArea" id="kosisArea">
						<a href="javascript:interactiveMapKosis.dataFieldClose();" class="kosisClose">close</a>
						<div class="rela">
							<div id="kosisTitle" ></div>
							<div id="kosisOrigin" >
								출처 : KOSIS(<a href="javascript:interactiveMapKosis.kosisLinked();">통계표보기</a>)
							</div>
							<p>행정구역통계<br/>세부조건설정</p>
							<ul id="kosisDataFieldTable"  style="font-size:12px;"> 
								<li>
									<label for="hangOption01">세부항목</label>
									<select id="hangOption01"  ><option>항목을 필수로 선택하세요</option></select>
								</li>
								<li>
									<label for="hangOption01">주기</label>
									<select id="hangOption01" ><option>부정기</option></select>
								</li>
								<li>
									<label for="hangOption01">년도</label>
									<select id="hangOption01" ><option>2010</option></select>
								</li>
								<li>
									<label for="hangOption01">가구주와의 관계</label>
									<select id="hangOption01" ><option>합계</option></select>
								</li>
								<li>
									<label for="hangOption01">성별</label>
									<select id="hangOption01" ><option>합계</option></select>
								</li> 
							</ul>
							<a href="javascript:interactiveMapKosis.setKosisParams();" class="btnStyle01">버튼 생성</a>
							<a href="javascript:void(0)" class="resizeIcon">창축소</a>
						</div>
					</div> -->
					<!-- KOSIS 세부 항목 End -->
					
					<!-- 3Depth start -->
					<!-- KOSIS 세부항목 선택하기 start -->
					<div class="quickBox step03" id="kosisDetailDiv">
						<div class="subj">
							<span>KOSIS(지역통계) 세부항목 선택하기</span>
							<a href="javascript:void(0)" class="stepClose">닫기</a>
						</div>
						<div class="normalBox">
							<div class="stepBox" style="width:280px;">
								<div id="kosisTitle"></div>
								<div id="kosisOrigin" style="margin-top:15px;"></div>
							</div>
							<div class="cm01" style="width:280px;"> <!-- 2016.09.05 9월 서비스 -->
	                            	<div id="kosisDataFieldTable" class="stepBox"></div>
	                            </div>
						</div>
						<div class="btnBottom">
	                        <a href="javascript:interactiveMapKosis.setKosisParams();" class="btnStyle02">검색조건 버튼생성</a>
	                    </div>
					</div>
					<!-- 해당분류 세부업종 선택하기 end -->

			    	</div>
			    	
			    	<!-- 데이터보드 -->
			    	<div id="dataBoard">
						

<a href="javascript:void(0)" class="interactiveDataBoard">데이터보드</a>
<div class="dataSideBox">
	<div class="bar">
		<div id="dataSlider" class="dataSlider"></div> 
		<a href="javascript:void(0)"><img src="/img/ico/ico_close02.png" alt="데이터보드 닫기" /></a>
	</div>
	<div class="dataSideContents">
	
		<!-- 일반 DataBoard Start -->
		<div class="dataSideScroll " id="normalDataBoard">
			<div class="dataBoardDiv" id="viewDataBoard">
				<p class="txt" id="dataBoardTitle"></p>								<!-- 제목 -->
				<p class="txt" id="dataBoardOrigin" style="display:none;"></p>		<!-- 출처 -->
				<p class="txt" id="dataBoardArea"></p>								<!-- 지역 -->
				<p class="txt" id="dataBoardStats"></p>								<!-- 통계 -->
				
				<dl class="dscList">
					<!-- 데이터 보기 Start -->
					<dt id="viewCurrentRegionData_dt_area"><a href="javascript:void(0)" class="on">데이터 보기</a></dt>
					<dd id="viewCurrentRegionData_dd_area">
						<div class="compareBox">
							<div class="typeBox">
								<a href="javascript:void(0)" class="first on">차트</a>
								<a href="javascript:void(0)">표</a>
							</div>
							<div id="wrapperChartScroll" class="censusChart" style="width:520px;height:303px;">
								<div class="charts" id="targetCharts"></div>
							</div>
							<div class="tables"><!-- 표영역 -->
								<table summary="항목, 순위, 값, 비율(%)">
									<caption>해당지역 내 데이터 보기</caption>
									<thead>
										<tr>
											<th scope="col">항목</th>
											<th scope="col">순위</th>
											<th scope="col">값</th>
											<th scope="col">비율(%)</th>
										</tr>
									</thead> 
								</table>
								<div class="scrolls">
									<table summary="항목, 순위, 값, 비율(%)">
										<caption>해당지역 내 데이터 보기</caption> 
										<tbody id="barChartTable">
										</tbody>
									</table>
								</div>
							</div><!-- 표영역 -->
						</div>
					</dd>
					<!-- 데이터 보기 End -->
					
					<!-- 상위 지역 비교 데이터 보기 Start -->
					<dt id="viewUpRegionData_dt_area"><a href="javascript:void(0)" class="on">상위 지역 비교 데이터 보기</a></dt>
					<dd id="viewUpRegionData_dd_area">
						<div class="compareBox">
							<div class="typeBox">
								<a href="javascript:void(0)" class="first on">차트</a>
								<a href="javascript:void(0)">표</a>
							</div>
							<div class="charts censusChart">
								<div class="topAreaChartsBox">
									<div id="pieChartDiv1"></div>
									<div id="pieChartDiv2"></div>
									<div id="pieChartDiv3"></div>
									<p class="pieLegend"></p>
								</div>
							</div>
							<div class="tables"><!-- 표영역 -->
								<table summary="항목, 값">
									<caption>상위 지역 비교 데이터 보기</caption>
									<thead>
										<tr>
											<th scope="col">항목</th>
											<th scope="col">값</th>
										</tr>
									</thead> 
								</table>
								<div>
									<table summary="항목, 값">
										<caption>상위 지역 비교 데이터 보기</caption>
										<tbody id="pieChartTable">
										</tbody>
									</table>
								</div>
							</div><!-- 표영역 -->
						</div>
					</dd> 
					<!-- 상위 지역 비교 데이터 보기 End -->
					
					<!-- 시계열 조회 Start -->
					<dt id="viewTimeSeriesData_dt_area"><a href="javascript:void(0)" class="on">시계열 조회</a></dt>
					<dd id="viewTimeSeriesData_dd_area">
						<div class="clockTypeBox">
							<a href="javascript:void(0)" class="btn_clockTypePlay">play</a>
							<a href="javascript:void(0)" class="btn_clockTypeSetting">설정</a>
							<a href="javascript:void(0)" class="btn_clockTypeOk">ok</a>
							<ul class="yearList" id="tableTimeSeries">
							</ul>
						</div>
					</dd>
					<!-- 시계열 조회 End -->
				</dl>
			</div>
			
			<!-- 공공데이터 Include -->
			


<div class="dataBoardDiv" id="publicDataDiv">
	<dl class="dscList"> 
		<dt class="mt15"><a href="javascript:void(0)" class="on">지도영역 내 조회된 정보 목록</a></dt>
		<dd>
			<p class="rsText">총 <strong id="publicDataCnt"></strong>개 검색</p>
			<div class="mapResultList">
				<ul id="publicDataList">
				</ul>
			</div>
		</dd>
		
		<!-- 유동인구 정보 Start -->
		<dt class="publicDataDT"><a href="javascript:void(0)" class="on">해당 POI 통계정보</a></dt>
		<dd class="publicDataDD" id="publicPopulationDiv">
			<div class="publicArrControllerBox">
				<a href="javascript:$publicDataBoard.ui.publicPopulationPrev();" class="fl">이전</a>
				<strong id="publicPopulationTitle"></strong>
				<a href="javascript:$publicDataBoard.ui.publicPopulationNext();" class="fr">다음</a>
			</div>
			<div class="poiCharts" id="publicPopulationChart"></div>
			<p class="origin_txt_2">출처 : 중소기업청, 전국 주요상권 유동인구 DB (2010)</p>
		</dd>
		<!-- 유동인구 정보 End -->
		
		<!-- 학교인구 정보 Start -->
		<dt class="publicDataDT"><a href="javascript:void(0)" class="on">해당 POI 통계정보</a></dt>
		<dd class="publicDataDD" id="publicSchoolDiv">
			<div class="publicArrControllerBox">
				<a href="javascript:$publicDataBoard.ui.publicSchoolPrevNext();" class="fl">이전</a>
				<strong id="publicSchoolTitle">학생/교직원 현황</strong>
				<a href="javascript:$publicDataBoard.ui.publicSchoolPrevNext();" class="fr">다음</a>
			</div>
			<!-- 해당학교 학생/교직원 현황 Start -->
			<div id="publicSchoolChartDiv01">
				<div class="poiPieCharts" id="publicSchoolChart"></div>
				<ul class="poiPieList">
					<li>・ 총학생수 : <span id="schoolStdtCnt"></span>명</li>
					<li>・ 총교직원수 : <span id="schoolTcherCnt"></span>명</li>
					<li>・ 교직원 1명당 학생수 : <span id="schoolTperS"></span>명</li>
					<li>・ <span id="sggNmSchool"></span> 평균 학생수
						<ol>
							<li>- 총학생수 평균 : <span id="schoolStdtAvg"></span>명</li>
							<li>- 총교직원수 평균 : <span id="schoolTcherAvg"></span>명</li>
						</ol>
					</li>
				</ul>
			</div>
			<!-- 해당학교 학생/교직원 현황 End -->
			<!-- 학교별 평균 학생/교직원 현황 Start -->
			<div id="publicSchoolChartDiv02" style="display: none;">
				<div class="imAreaCharts" id="publicSchoolGroupChart"></div>
			</div>
			<!-- 학교별 평균 학생/교직원 현황 End -->
			<p class="origin_txt_2">출처 : 한국교육개발원, 교육기본통계 (유초중등통계, 고등통계) (2013)</p>
		</dd>
		<!-- 학교인구 정보 End -->
		
		<!-- 지하철 승하차인구 정보 Start -->
		<dt class="publicDataDT"><a href="javascript:void(0)" class="on">해당 POI 통계정보</a></dt>
		<dd class="publicDataDD" id="publicMetroDiv">
			<div class="publicArrControllerBox">
				<a href="javascript:$publicDataBoard.ui.publicMetroPrev();" class="fl">이전</a>
				<strong id="publicMetroTitle">일평균 / 승하차인원 정보</strong>
				<a href="javascript:$publicDataBoard.ui.publicMetroNext();" class="fr">다음</a>
			</div>
			<div class="imAreaCharts metroChartDiv" id="publicMetroChart01"></div>		<!-- 일평균 승하차인원 정보 -->
			<div class="imAreaCharts metroChartDiv" id="publicMetroChart02"></div>		<!-- 월평균 승하차인원 정보 -->
			<div class="imAreaCharts metroChartDiv" id="publicMetroChart03"></div>		<!-- 요일평균 승하차인원 정보 -->
			<p class="origin_txt_2">출처 : 지자체 지하철 관리기관, 지하철 이용현황 (2013, 2014)</p>
		</dd>
		<!-- 지하철 승하차인구 정보 End -->
		
		<!-- 버스정류장 정보 Start -->
		<dt class="publicDataDT"><a href="javascript:void(0)" class="on">해당 POI 통계정보</a></dt>
		<dd class="publicDataDD" id="publicBusStopDiv">
			<p class="origin_txt_2">출처 : 국토교통부, 버스정류장 위치정보 (2014)</p>
		</dd>
		<!-- 버스정류장 정보 End -->
		
		<dt><a href="javascript:void(0)" class="on">임의영역 반경 내 주요 정보 목록</a></dt>
		<dd>
			<div style="position: relative;">
				<div class="imAreaSlideEtc">임의반경영역 설정(m)</div>
				<div class="imAreaSlide" id="publicDataSlide"></div>
				<div>
					<ul class="rbSlide_controll_bar">
		            	<li>50</li>
		                <li>150</li>
		                <li>250</li>
		                <li>500</li>
					</ul>
				</div> 
				<ul class="imAreaList">
					<li>반경 내 인구 : <span id="circlePeople"></span>명</li>
					<li>반경 내 가구 : <span id="circleFamily"></span>가구</li>
					<li>반경 내 주택 : <span id="circleHouse"></span>호</li>
					<li>반경 내 사업체 수 : <span id="circleCorp"></span>개</li>
				</ul>	 
				<div class="imAreaCharts" id="publicDataThemeChart"></div>
				<div class="imAreaTitle">임의반경에 포함되는 집계구 단위의 통계</div>
			</div>
		</dd>
	</dl>
</div>
			
			<!-- 나의데이터 Include -->
			


<div class="dataBoardDiv" id="myDataDiv">
<!-- 	<p class="dbText01">업로드 데이터를 기반으로 순번에 따라 최대 300개 까지 표출됩니다</p> -->
	<!-- 일반 데이터 -->
	<div class="myDataDivSub" id="myDataNormalDiv">
		<div class="dbTitle01">조회 방식 설정</div>
		<div class="dbRangeBox">
			<ul class="dbTypeList" id="searchMethodBox">
				<li id="searchMethod01" style="display:none;">
					<div class="dbTypeSubj">POI 보기</div>
					<div class="dbTypeCk">
						<input type="radio" name="dbTypeCk" id="dbTypeCk01" value="location" />
	                  	<label for="dbTypeCk01">선택</label>
					</div>
					<div class="dbTypeContents">
						 <span class="dbTypeGps"></span>
					</div>
				</li>
				<li id="searchMethod02" style="display:none;">
					<div class="dbTypeSubj">열지도</div>
					<div class="dbTypeCk">
						<input type="radio" name="dbTypeCk" id="dbTypeCk02" value="ratio" />
	                  	<label for="dbTypeCk02">선택</label>
					</div>
					<div class="dbTypeContents" style="text-align: center;">
						<img src="/img/ico/wheel.500.png" width="40" height="40" style="margin-top: 8px;"/>
					</div>
				</li>
				<li id="searchMethod03" style="display:none;">
					<div class="dbTypeSubj">버블범례</div>
					<div class="dbTypeCk">
						<input type="radio" name="dbTypeCk" id="dbTypeCk03" value="bubble" />
	                     <label for="dbTypeCk03">선택</label>
					</div>
					<div class="dbTypeContents">
						<ul class="dbRingList">
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
				</li>
				<li id="searchMethod04" style="display:none;">
					<div class="dbTypeSubj">색상범례</div>
					<div class="dbTypeCk">
						<input type="radio" name="dbTypeCk" id="dbTypeCk04" value="colorFull" />
	                    <label for="dbTypeCk04">선택</label>
					</div>
					<div class="dbTypeContents">
						 <ul class="dbColorbar"></ul>
					</div>
				</li>
			</ul>
		</div>
		
		<div class="dbTitle01">적용된 위치정보 목록</div>
		<div id="userDataGrid" style="margin-left:10px;"></div>
	</div>
	
	<!-- KML 데이터 -->
	<div class="myDataDivSub" id="myDataKmlDiv">
		<div class="dbTitle01">KML 데이터</div>
		<div id="basic_handson01"></div>
	</div>
</div>
		</div>
		<!-- 일반 DataBoard End -->
			
		<!-- Full Size DataBoard Start -->
		<div class="dataSideScroll" id="fullDataBoard">
			<div class="dssRow">
				<div class="fl">
					<p>데이터 조회 조건</p>
					<div class="dssContents" style="height:310px;">
<!-- 						<div class="clickMiniMap"></div> -->
						<div class="cmListBox">
							<span>조회정보</span>
							<div id="fullDataBoardTitle">
								<p class="txt" id="dataBoardTitle" style="padding-left:10px;font-size:13px;"></p>								<!-- 제목 -->
								<p class="txt" id="dataBoardOrigin" style="display:none;padding-left:10px;font-size:13px;"></p>					<!-- 기준년도 -->
								<p class="txt" id="dataBoardArea" style="padding-left:10px;font-size:13px;"></p>								<!-- 지역 -->
								<p class="txt" id="dataBoardStats" style="padding-left:10px;font-size:13px;"></p>								<!-- 통계 -->
							</div>
							<span>조회년도</span>
							<ul id="fullTableTimeSeries">
							</ul>
						</div>
					</div>
				</div>
				<div class="fr"> 
					<p>해당 지역 내 데이터 보기(차트)</p>
					<div class="dssContents" id="fullTargetChart"></div>
				</div>
			</div> 
			<div class="dssRow">
				<div class="fl">
					<p>상위 지역 비교 데이터 보기</p>
					<div class="dssContents" id="fullPieChart" style="height:240px;"></div>
					<div class="fullPieLegend"></div>
				</div>
				<div class="fr"> 
					<p>해당 지역 내 데이터 보기(표)</p>
					<div class="dssContents fullCompareBox" id="dssChart03">
						<!-- 표영역 -->
						<div class="tables">
							<table summary="항목, 순위, 값, 비율(%)">
								<caption>해당지역 내 데이터 보기</caption>
								<thead>
									<tr>
										<th scope="col">항목</th>
										<th scope="col">순위</th>
										<th scope="col">값</th>
										<th scope="col">비율(%)</th>
									</tr>
								</thead> 
							</table>
							<div class="scrolls">
								<table summary="항목, 순위, 값, 비율(%)">
									<caption>해당지역 내 데이터 보기</caption> 
									<tbody id="fullBarChartTable">
									</tbody>
								</table>
							</div>
						</div>
						<!-- 표영역 -->
					
					</div>
				</div> 
			</div>
		</div>
		<!-- Full Size DataBoard End -->
	</div>
</div>  
					</div>
			    	<!-- 데이터보드 end-->
			    	
			    	<!-- 공유팝업  -->
			    	<div id="sharedlg" class="popBox" style="display:none; z-index:20001;">
						<div class="topbar">
							<span>조회한 통계결과  URL공유하기</span>
							<a onclick="javascript:$interactiveMap.ui.doCancel('sharedlg');">닫기</a>
						</div>
						<div class="popContents">
							<ul class="listFormPop">
								<li>
									<label for="urlsubj" class="label">URL 내용 :</label>
									<input type="text" id="urlsubj" class="inp" readonly=readonly />
								</li>
								<li>
									<div style="width:100%;margin:auto 0">
										<table style="margin:auto;width:270px;height:30px;margin-top:10px">
											<tr style="height:30px;line-height:1px;">
												<td valign="middle">
													<a href="javascript:$interactiveMap.ui.shareToKakaoStory();" style="margin-left:10px;"><img src="/img/im/kakao.png" alt="카카오스토리"></a>
												</td>
												<td valign="middle">
													<div id="twitterDiv" style="margin-left:25px;">
													<!-- 	<a class='twitter-share-button' href='//twitter.com/share' data-count='none'>twitter</a> -->
													</div>
												</td>
												<td valign="middle">
													<div id="facebookDiv"></div>
												</td>
											</tr>
										</table>
									</div>
								</li>
							</ul>
							<p class="txt">SGIS+plus 사용자간 통계조회 결과의<br />자유로운 열람이 가능합니다.</p>
							<div class="btnBox">
								<a onclick="javascript:$interactiveMap.ui.doDone('sharedlg');" class="btnStyle01">URL 복사하기</a>
								<a onclick="javascript:$interactiveMap.ui.doCancel('sharedlg');" class="btnStyle01">닫기</a>
							</div>
						</div>
					</div>
					
					<!-- 북마크 팝업  -->
					<div id="bookmarkdlg" class="popBox" style="display:none; z-index:20001;">
						<div class="topbar">
							<span>조회한 통계결과 My Page 저장하기</span>
							<a onclick="javascript:$interactiveMap.ui.doCancel('bookmarkdlg');">닫기</a>
						</div>
						<div class="popContents">
							<ul class="listFormPop">
								<li>
									<label for="savesubj" class="label">저장제목 :</label>
									<input type="text"  id="savesubj" class="inp" maxlength="100" />
								</li>
								<!-- <li>
									<label for="savedate" class="label">저장일시 :</label>
									<input type="text" readonly=readonly id="savedate" class="inp" />
								</li> -->
								<li id="caseInput" style="display:none;">
									<span class="label">공개여부</span>
									<input type="checkbox" id="openShare" />
									<label for="ckbigong" class="mr20">SGIS+plus 활용사례 공유</label>
								</li>
							</ul>
							<div id="caseHelper" style="display:none;">
								<p class="txt">조회결과 저장기간은 2개월 까지며,<br />조회결과 공개여부에 따라 SGIS+plus 사용자간<br />데이터의 자유로운 열람이 가능합니다.</p>
								<p class="txt">저장된 내용을 활용사례로 공유시 저장기간을 연장할 수<br /> 있습니다.</p>
								</div>
							<div class="btnBox">
								<a onclick="javascript:$interactiveMap.ui.doDone('bookmarkdlg');" class="btnStyle01">My Page 저장</a>
								<a onclick="javascript:$interactiveMap.ui.doCancel('bookmarkdlg');" class="btnStyle01">닫기</a>
							</div>
						</div>
					</div>
					
					<!-- ( mask ) -->
        			<div class="deem" style="display: none;"></div> 
      				<!-- ( mask ) -->
				</div>	 
			</div>
			
			  
			<!-- footer// -->
		    <footer id="footer">
		    	<!-- Bottom Include -->
				




	<div class="relaHidden">
		<iframe id="authFrame" src="" width="0" height="0" frameborder="0" title="SSO인증"></iframe>				<!--// SSO인증 -->
		<iframe id="registerFrame" src="" width="0" height="0" frameborder="0" title="회원가입"></iframe>					<!--// 회원가입 -->
		<iframe id="unRegisterFrame" src="" width="0" height="0" frameborder="0" title="회원탈퇴"></iframe>				<!--// 회원탈퇴 -->
		<iframe id="loginFrame" src="" width="0" height="0" frameborder="0" title="로그인"></iframe>					<!--// 로그인 -->
		<iframe id="logoutFrame" src="" width="0" height="0" frameborder="0" title="로그아웃"></iframe>					<!--// 로그아웃 -->
		<iframe id="modifyFrame" src="" width="0" height="0" frameborder="0" title="회원수정"></iframe>					<!--// 회원수정 -->
	</div>



		    </footer>
		</div>
		
		<script>
			// 2016. 04. 21 j.h.Seok 수정
			 //트위터
			window.twttr = (function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0],
				    t = window.twttr || {};
				  if (d.getElementById(id)) return t;
				  js = d.createElement(s);
				  js.id = id;
				  js.src = "http://platform.twitter.com/widgets.js";
				  fjs.parentNode.insertBefore(js, fjs);
				 
				  t._e = [];
				  t.ready = function(f) {
				    t._e.push(f);
				  };
				 
				  return t;
			}(document, "script", "twitter-wjs"));
			
			window.fbAsyncInit = function() {
			    FB.init({
			      appId      : '893451250742184', //'893451250742184'(상용),//'1516531411965359'(이전),
			      xfbml      : true,
			      version    : 'v2.5'//'v2.4'
			    });
			};

			 //페이스북
			window.facebook =(function(d, s, id){
			     var js, fjs = d.getElementsByTagName(s)[0];
			     if (d.getElementById(id)) {return;}
			     js = d.createElement(s); js.id = id;
			     js.src = "http://connect.facebook.net/ko_KR/sdk.js";
			     fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
			
		</script>
		
		<div id="notice_mini_pop" class="popupWrapper" style="margin-left: 200px; margin-top: 120px; width:602px; height:375px; background: rgba(0,0,0,0); display:none;">
			<div>
				<img src="/img/new/sgis_use_notice_pop.png" alt='' usemap="#Map" />
				<map name="Map">
					<area shape="rect" coords="565 0 601 36" href="javascript:$interactiveMap.ui.informationPopClose();" >
				</map>
			</div>
 		</div>
 		
 		<!--하루동안 열지않기  -->
 		
 		<div class="Popup_Info" style="display:none;" id="interactive_laypopup">
		<div class="PopupCont">
			<h1>대화형 통계지도 이용안내</h1>
			<button type="button" style="z-index:100;" class="Popup_close1" onclick="javascript:commonPopupObj.closeWin('interactive_laypopup', 1);">창닫기</button>
			
			<div id="slides">
				<img id="interactiveRotationImg1" src="/img/interactiveMapRotation/interactiveRocation1.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg2" src="/img/interactiveMapRotation/interactiveRocation2.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내" usemap="#rotation2"/>
				<img id="interactiveRotationImg3" src="/img/interactiveMapRotation/interactiveRocation3.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg4" src="/img/interactiveMapRotation/interactiveRocation4.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg5" src="/img/interactiveMapRotation/interactiveRocation5.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg6" src="/img/interactiveMapRotation/interactiveRocation6.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg7" src="/img/interactiveMapRotation/interactiveRocation7.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내" usemap="#rotation7"/>
				<img id="interactiveRotationImg8" src="/img/interactiveMapRotation/interactiveRocation8.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg9" src="/img/interactiveMapRotation/interactiveRocation9.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg10" src="/img/interactiveMapRotation/interactiveRocation10.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg11" src="/img/interactiveMapRotation/interactiveRocation11.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg12" src="/img/interactiveMapRotation/interactiveRocation12.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg13" src="/img/interactiveMapRotation/interactiveRocation13.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg14" src="/img/interactiveMapRotation/interactiveRocation14.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg15" src="/img/interactiveMapRotation/interactiveRocation15.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg16" src="/img/interactiveMapRotation/interactiveRocation16.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg17" src="/img/interactiveMapRotation/interactiveRocation17.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg18" src="/img/interactiveMapRotation/interactiveRocation18.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
				<img id="interactiveRotationImg19" src="/img/interactiveMapRotation/interactiveRocation19.png" style="width:977px; height:522px;" alt="대화형통계지도이용안내"/>
			</div>
			<map name="rotation2">
				<area shape="rect" coords="333 98 413 120" href="javascript:moveHighFunction(1);">
			</map>
			<map name="rotation7">
				<area shape="rect" coords="453 171 521 193" href="javascript:moveHighFunction(1);">
			</map>	
			<div class="Popup-page-alter" style="z-index: 999999;">
					<div id="preViewBtn" class="fl ml20"><a href="#"><img src="/img/interactiveMapRotation/l_arrow.png" alt="arrow"></a></div>
					<div id="nextViewBtn" class="fr mr20"><a href="#"><img src="/img/interactiveMapRotation/r_arrow.png" alt="arrow"></a></div>
			</div>
			<div class="Pagination" style="font-size:13px;">
				<ul id="rotationDiv" style="width:500px;">
					<li id="rotationPageText1"><a href="#">1</a></li> 
					<li id="rotationPageText2"><a href="#">2</a></li>
					<li id="rotationPageText3"><a href="#">3</a></li>
					<li id="rotationPageText4"><a href="#">4</a></li>
					<li id="rotationPageText5"><a href="#">5</a></li>
					<li id="rotationPageText6"><a href="#">6</a></li>
					<li id="rotationPageText7"><a href="#">7</a></li>
					<li id="rotationPageText8"><a href="#">8</a></li>
					<li id="rotationPageText9"><a href="#">9</a></li>
					<li id="rotationPageText10"><a href="#">10</a></li>
					<li id="rotationPageText11"><a href="#">11</a></li>
					<li id="rotationPageText12"><a href="#">12</a></li>
					<li id="rotationPageText13"><a href="#">13</a></li>
					<li id="rotationPageText14"><a href="#">14</a></li>
					<li id="rotationPageText15"><a href="#">15</a></li>
					<li id="rotationPageText16"><a href="#">16</a></li>
					<li id="rotationPageText17"><a href="#">17</a></li>
					<li id="rotationPageText18"><a href="#">18</a></li>
					<li id="rotationPageText19"><a href="#">19</a></li>
				</ul>
			</div>
			<div class="CloseZone">
				<div class="popmm">
					<label><input type="checkbox" name="close" value="OK">오늘 하루 열지 않음</label>
					<button type="button" class="Popup_close2" onclick="javascript:commonPopupObj.closeWin('interactive_laypopup', 1);">창닫기</button>
				</div>
			</div>
		</div>
	</div>
 		
		<div id ="dataBoardImgDiv" style="display:none; float: right; width:549px; height:882px; top:138px; right:0px; position:absolute; background-image: url('/img/tutorial/companyDataboard2Img.png'); background-position: bottom; z-index:10003;">
			<img id="yearChoice2006Img" src="/img/tutorial/yearChoice2006Img.png" draggable="false">
			<img id="yearChoice2010Img" src="/img/tutorial/yearChoice2010Img.png" draggable="false">
			<img id="yearChoice2014Img" src="/img/tutorial/yearChoice2014Img.png" draggable="false">
			<img id="toPoint_db1" src="/img/tutorial/toPoint_3.png" draggable="false" style="display:none; position:absolute; right:375px; bottom:385px; z-index: 10003;">
			<img id="toPoint_db2" src="/img/tutorial/toPoint_3.png" draggable="false" style="display:none; position:absolute; right:40px; bottom:385px; z-index: 10003;">
			<img id="toPoint_db3" src="/img/tutorial/toPoint_3.png" draggable="false" style="display:none; position:absolute; right:130px; bottom:320px; z-index: 10003;">				
		</div>
			<div class="tutorialWrapper" style= "display: none" draggable="false">
				<img id="tuto_end_btn" src="/img/tutorial/tuto_end_btn.png" style="cursor:pointer; display:block; position:absolute; right:302px; top:107px; z-index:10003;" onclick="javascript:$interactiveMap.ui.closeTutorial();" draggable="false">
				<img id="rightControlImg" src="/img/tutorial/rightControlImg.png" style="display:none; position:absolute; top:103px; right:1px; z-index:10002;" draggable="false">
				
				<div id="headerTutorial" style="width:100%; height:135px;" draggable="false">
					<div id="tutorialText" draggable="false">
					</div>
				</div>

				<img id="mainIndexImg" src="/img/tutorial/mainIndexImg.png" draggable="false">
				<img id="ptotalImg" src="/img/tutorial/ptotalImg.png" draggable="false">
				<img id="searchImg" src="/img/tutorial/searchImg.png" draggable="false">			
				<img id="addrSearchImg" src="/img/tutorial/addrSearchImg.png" draggable="false">			
				<img id="dragItemListImg" src="/img/tutorial/dragItemListImg.png" draggable="false">			
				<img id="addrChoiceImg" src="/img/tutorial/addrChoiceImg.png" draggable="false">
				<img id="okImg" src="/img/tutorial/okImg.png" draggable="false">
				
				<div id="zoomMapImgDiv" draggable="false">
<!-- 				<img id="zoomMapImg" src="/img/tutorial/zoomMapImg.png" draggable="false"> -->
				</div>
				<img id="zoomInImg" src="/img/tutorial/zoomInImg.png" draggable="false">
				<img id="zoomInMapImg" src="/img/tutorial/zoomInMapImg.png" draggable="false">
				
				<img id="dragItemImg" src="/img/tutorial/dragItemImg.png" draggable="true" style="display:none; position:absolute; top:227px; left:-2px; border: 3px outset red; cursor:pointer; z-index:10001;" draggable="false">			
				
				<img id="zoomMapImg2" src="/img/tutorial/zoomMapImg2.png" draggable="false">
				<img id="zoomMapInfoImg" src="/img/tutorial/zoomMapInfoImg.png" draggable="false">
				<img id="MouseoverImg" src="/img/tutorial/MouseoverImg.png" draggable="false">
				
				<img id="zoomOutImg" src="/img/tutorial/zoomOutImg.png" draggable="false">
				<img id="zoomOutMapImg" src="/img/tutorial/zoomOutMapImg.png" draggable="false">

				<img id="dataBoardImg" src="/img/tutorial/dataBoardImg.png" draggable="false">
				<img id="dataBoardDetailImg" src="/img/tutorial/dataBoardDetailImg.png" draggable="false">
				<img id="dataBoardPyoImg" src="/img/tutorial/dataBoardPyoImg.png" draggable="false">
				<img id="dataBoardPyoDetailImg" src="/img/tutorial/dataBoardPyoDetailImg.png" draggable="false">
				<img id="showDataImg" src="/img/tutorial/showDataImg.png" draggable="false">
				<img id="dataBoardYearImg" src="/img/tutorial/dataBoardYearImg.png" draggable="false">
				<img id="dataBoardCloseImg" src="/img/tutorial/dataBoardCloseImg.png" draggable="false">
				
				<img id="redLegendInfo" src="/img/tutorial/redLegendInfo.png" draggable="false">
				<img id="greenLegendInfo" src="/img/tutorial/greenLegendInfo.png" draggable="false">
				<img id="bottomControlImg1" src="/img/tutorial/bottomControlImg1.png" draggable="false">
				<img id="bottomControlImg2" src="/img/tutorial/bottomControlImg2.png" draggable="false">
				
				<img id="greenLegendImg" src="/img/tutorial/greenLegendImg.png" draggable="false">
				<img id="greenLegendMapImg" src="/img/tutorial/greenLegendMapImg.png" draggable="false">
				
				<img id="legendOptionImg" src="/img/tutorial/legendOptionImg.png" draggable="false">
				<img id="legendTypeImg" src="/img/tutorial/legendTypeImg.png" draggable="false">
				<img id="legendTypeBubbleImg" src="/img/tutorial/legendTypeBubbleImg.png" draggable="false">
				<img id="legendBubbleMapImg" src="/img/tutorial/legendBubbleMapImg.png" draggable="false">
				<img id="cleanImg" src="/img/tutorial/cleanImg.png" draggable="false">
				<img id="cleanMapImg" src="/img/tutorial/cleanMapImg.png" draggable="false">

				<img id="addrChoice2Img" src="/img/tutorial/addrChoice2Img.png" draggable="false">
				<img id="zoomMapImg3" src="/img/tutorial/zoomMapImg3.png" draggable="false">
				<img id="zoomOutMap2Img" src="/img/tutorial/zoomOutMap2Img.png" draggable="false">
				<img id="zoomOutMap3Img" src="/img/tutorial/zoomOutMap3Img.png" draggable="false">
				
				<img id="mainMenuImg" src="/img/tutorial/mainMenuImg.png" draggable="false">
				
				<img id="slide1Img" src="/img/tutorial/slide1Img.png" draggable="false">
				<img id="slide2Img" src="/img/tutorial/slide2Img.png" draggable="false">
				<img id="slide3Img" src="/img/tutorial/slide3Img.png" draggable="false">
				<img id="slide4Img" src="/img/tutorial/slide4Img.png" draggable="false">
				<img id="slide5Img" src="/img/tutorial/slide5Img.png" draggable="false">
				<img id="slide6Img" src="/img/tutorial/slide6Img.png" draggable="false">
				
				<img id="companyBtnImg" src="/img/tutorial/companyBtnImg.png" draggable="false">
				<img id="themaListImg" src="/img/tutorial/themaListImg.png" draggable="false">
				<img id="themaRestaurantImg" src="/img/tutorial/themaRestaurantImg.png" draggable="false">
				<img id="themaCafeImg" src="/img/tutorial/themaCafeImg.png" draggable="false">
				<img id="themaButtonImg" src="/img/tutorial/themaButtonImg.png" draggable="false">
				<img id="zoomMapImg4" src="/img/tutorial/zoomMapImg4.png" draggable="false">
				<img id="dragItemImg2" src="/img/tutorial/dragItemImg2.png" draggable="true" style="display:none; position:absolute; top:227px; left:-3px; border: 3px outset red; cursor: pointer;z-index:10001;" draggable="false">

				<img id="zoomMapImg5" src="/img/tutorial/zoomMapImg5.png" draggable="false">
				
				<img id="redRegionImg" src="/img/tutorial/redRegionImg.png" draggable="false">
				<img id="redRegionInfoImg" src="/img/tutorial/redRegionInfoImg.png" draggable="false">
				<img id="whiteRegionImg" src="/img/tutorial/whiteRegionImg.png" draggable="false">
				<img id="whiteRegionInfoImg" src="/img/tutorial/whiteRegionInfoImg.png" draggable="false">

				<img id="companyDataboardImg" src="/img/tutorial/companyDataboardImg.png" draggable="false">
				
				<img id="companyDataboard2Img" src="/img/tutorial/companyDataboard2Img.png" draggable="false">

<!-- 			<img id="dataBoard2006Img" src="/img/tutorial/dataBoard2006Img.png" draggable="false"> -->
<!-- 			<img id="yearChoice2006Img" src="/img/tutorial/yearChoice2006Img.png" draggable="false"> -->
				<img id="baseYear2006MapImg" src="/img/tutorial/baseYear2006MapImg.png" draggable="false">
				
<!-- 			<img id="dataBoard2010Img" src="/img/tutorial/dataBoard2010Img.png" draggable="false"> -->
<!-- 			<img id="yearChoice2010Img" src="/img/tutorial/yearChoice2010Img.png" draggable="false"> -->
				<img id="baseYear2010MapImg" src="/img/tutorial/baseYear2010MapImg.png" draggable="false">
				
<!-- 					<img id="yearChoice2014Img" src="/img/tutorial/yearChoice2014Img.png" draggable="false">				 -->
				
				<img id="rightControlImg2" src="/img/tutorial/rightControlImg2.png" draggable="false">
				<img id="rightControlImg3" src="/img/tutorial/rightControlImg3.png" draggable="false">
				
				<img id="poiButtonImg" src="/img/tutorial/poiButtonImg.png" draggable="false">
				<img id="poiButtonOnImg" src="/img/tutorial/poiButtonOnImg.png" draggable="false">
				<img id="poiRestaurantImg" src="/img/tutorial/poiRestaurantImg.png" draggable="false">
				<img id="poiSubmenuCafeImg" src="/img/tutorial/poiSubmenuCafeImg.png" draggable="false">
				<img id="poiMapImg" src="/img/tutorial/poiMapImg.png" draggable="false">
				<img id="poiGroupMarkerImg" src="/img/tutorial/poiGroupMarkerImg.png" draggable="false">
				<img id="poiMap2Img" src="/img/tutorial/poiMap2Img.png" draggable="false">
				<img id="poiMarkerImg" src="/img/tutorial/poiMarkerImg.png" draggable="false">
				<img id="poiMarkerInfoImg" src="/img/tutorial/poiMarkerInfoImg.png" draggable="false">
				<img id="poiCleanImg" src="/img/tutorial/poiCleanImg.png" draggable="false">
				<img id="poiCleanMapImg" src="/img/tutorial/poiCleanMapImg.png" draggable="false">
<!-- 				<img id="zoomMapImg6" src="/img/tutorial/zoomMapImg6.png" draggable="false"> -->
				<img id="zoomMapImg7" src="/img/tutorial/zoomMapImg7.png" draggable="false">

				<img id="toPoint_1" src="/img/tutorial/toPoint_1.png" draggable="false">
				<img id="toPoint_2" src="/img/tutorial/toPoint_2.png" draggable="false">
				<img id="toPoint_3" src="/img/tutorial/toPoint_3.png" draggable="false">
				<img id="toPoint_4" src="/img/tutorial/toPoint_4.png" draggable="false">

				<img id="toPoint_1_1" src="/img/tutorial/toPoint_1.png" draggable="false">
				<img id="toPoint_2_2" src="/img/tutorial/toPoint_2.png" draggable="false">
				<img id="toPoint_3_3" src="/img/tutorial/toPoint_3.png" draggable="false">
				<img id="toPoint_4_4" src="/img/tutorial/toPoint_4.png" draggable="false">
				
				<img id="toPoint_1_1_1" src="/img/tutorial/toPoint_1.png" draggable="false">
				<img id="toPoint_2_2_2" src="/img/tutorial/toPoint_2.png" draggable="false">

<!-- 이경현 dropzone 확대 2016.06.28 -->
				<div id="dropMapZone" style="display: none; position: absolute; width:250px; height:325px; left: 815px; top: 314px; z-index:10001">
					<svg id="dropMap" width="200px" height="275px" style="display:none;">
						<polygon id="dropMapInfo" points="135,54 124,55 103,73 105,89 96,90 94,92 95,101 97,102 96,106 92,110 92,115 85,118 82,128 77,133 73,141 65,148 56,154 55,166 56,170 61,175 64,183 67,184 71,179 75,181 75,181 77,191 85,201 89,201 91,204 90,208 91,217 93,218 102,207 102,200 106,194 111,192 111,188 114,186 111,182 114,160 111,149 113,144 116,145 120,142 118,128 121,124 125,123 126,114 128,107 129,99 140,83 141,67 136,60 135,54" style="fill:none;stroke:#0086c6; stroke-width:4"></polygon>
					</svg>
				</div>
				<div id="dropMapZone2" style="display: none; position: absolute; width:770px; height:450px; left: 653px; top: 151px; z-index:10001">	
					<svg id="dropMap2" width="470px" height="450px" style="display:none;" >
						<polygon id="dropMapInfo2" points="82,192 83,256 71,296 82,300 108,317 147,373 180,348 181,284 200,284 200,220 223,194 223,194 387,194 407,201 392,163 346,120 328,95 141,95 141,193" style="fill:none;stroke:#0086c6; stroke-width:4"></polygon>
					</svg>
				</div>
			</div>
	</body>
</html>