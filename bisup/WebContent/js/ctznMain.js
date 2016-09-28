	
	var rptMainHandler = {};
	rptMainHandler.rpct110101 = function(data){
		// 세부업종 시간대별 카드매출비율 리스트
		
		
    	var stdrYm = $.ajax({
    	    type: "GET",
    	    url: "/sgmap/get_map_stdrd_yymm.json",
    	    async: false,
    	}).responseText;		    	
    	
    	stdrYm = $.parseJSON(stdrYm);
    	
    	$(".mKeyvisual .bg .list1 h3").html(stdrYm.stdrYy+"년 "+stdrYm.stdrQu+"분기 기준 (서울시)");
    	$(".mKeygraph .ti1").html(stdrYm.stdrYy+"년 "+stdrYm.stdrQu+"분기");
		if(data.rows[0].clsbizRt) {
			$("#clsbizRt").htmlEmp(data.rows[0].clsbizRt + "%");	
		}else{
			$("#clsbizRt").htmlEmp("&nbsp;");
		}
		
		if(data.rows[0].lsmthProvs3BeingIrdsRt) {
			$("#lsmthProvs3BeingIrdsRt").htmlEmp(data.rows[0].lsmthProvs3BeingIrdsRt + "%");	
		}else{
			$("#lsmthProvs3BeingIrdsRt").htmlEmp("&nbsp;");
		}
		
		if(data.rows[0].prvyyProvsDelngIrdsRt) {
			$("#prvyyProvsDelngIrdsRt").htmlEmp(data.rows[0].prvyyProvsDelngIrdsRt + "년");	
		}else{
			$("#prvyyProvsDelngIrdsRt").htmlEmp("&nbsp;");
		}
		
		if(data.rows[0].prvyyProvsStorCoRt) {
			$("#prvyyProvsStorCoRt").htmlEmp(numComma(data.rows[0].prvyyProvsStorCoRt) + "%");	
		}else{
			$("#prvyyProvsStorCoRt").htmlEmp("&nbsp;");
		}
		
		
		if(data.rows[0].clsbizRt1) {
			var tmpTxt = "전년 동 분기 "+numComma(data.rows[0].clsbizRt1)+"% ";
			if(data.rows[0].clsbizRt1 < 0) {
				tmpTxt = "전년 동 분기 "+numComma(data.rows[0].clsbizRt1)+"% ";
			}
			
			$("#clsbizRt1").htmlEmp(tmpTxt);	
		}else{
			$("#clsbizRt1").htmlEmp("&nbsp;");
		}
		
		
		if(data.rows[0].lsmthProvs3BeingIrdsRt1) {
			var tmpTxt = "전년 동 분기 "+numComma(data.rows[0].lsmthProvs3BeingIrdsRt1)+"% ";
			if(data.rows[0].lsmthProvs3BeingIrdsRt1 < 0) {
				tmpTxt = "전년 동 분기 "+numComma(data.rows[0].lsmthProvs3BeingIrdsRt1)+"% ";
			}
			
			$("#lsmthProvs3BeingIrdsRt1").htmlEmp(tmpTxt);	
		}else{
			$("#lsmthProvs3BeingIrdsRt1").htmlEmp("&nbsp;");
		}
		
		if(data.rows[0].prvyyProvsDelngIrdsRt1) {
			var tmpTxt = "전년 동 분기 "+numComma(data.rows[0].prvyyProvsDelngIrdsRt1)+"년 ";
			if(data.rows[0].prvyyProvsDelngIrdsRt1 < 0) {
				tmpTxt = "전년 동 분기 "+numComma(data.rows[0].prvyyProvsDelngIrdsRt1)+" ";
			}
			
			$("#prvyyProvsDelngIrdsRt1").htmlEmp(tmpTxt);	
		}else{
			$("#prvyyProvsDelngIrdsRt1").htmlEmp("&nbsp;");
		}
		/*
		if(data.rows[0].prvyyProvsStorCoRt1) {
			var tmpTxt = "전년 동 분기 대비 "+numComma(data.rows[0].prvyyProvsStorCoRt1)+"% <em class='up'>▲</em>";
			if(data.rows[0].prvyyProvsStorCoRt1 < 0) {
				tmpTxt = "전년 동 분기 대비 "+numComma(data.rows[0].prvyyProvsStorCoRt1)+"% <em class='dn'>▼</em>";
			}
			
			$("#prvyyProvsStorCoRt1").htmlEmp(tmpTxt);	
		}else{
			$("#prvyyProvsStorCoRt1").htmlEmp("&nbsp;");
		}*/
	
		/*$(".stdrQuTxt").htmlEmp(data.rows[0].stdrYy+"년 "+data.rows[0].stdrQu+"분기");
		
		
		if(data.rows[0].clsbizRt > 0){
			$("#clsbizRt").attr("class","up");
		}else if(data.rows[0].clsbizRt < 0){
			$("#clsbizRt").attr("class","dn");
		}
		
		if(data.rows[0].prvyyProvs3BeingRt > 0){
			$("#prvyyProvs3BeingRt").attr("class","up");
		}else if(data.rows[0].prvyyProvs3BeingRt < 0){
			$("#prvyyProvs3BeingRt").attr("class","dn");
		}
		
		if(data.rows[0].prvyyProvsDelngIrdsRt > 0){
			$("#prvyyProvsDelngIrdsRt").attr("class","up");
		}else if(data.rows[0].prvyyProvsDelngIrdsRt < 0){
			$("#prvyyProvsDelngIrdsRt").attr("class","dn");
		}*/
	};
	
	rptMainHandler.rpct110102 = function(data){
		// 반원차트 이미지 처리
		if(data.rows[0].riskIdexValue == 1){
			$("#riskIdexValue").htmlEmp('<img src="/images/sgm/img_keygraph1_1.png" width="532" height="249" alt="주의, 의심, 위험, 고위험 중 주의">');
		}else if(data.rows[0].riskIdexValue == 2){
			$("#riskIdexValue").htmlEmp('<img src="/images/sgm/img_keygraph1_2.png" width="532" height="249" alt="주의, 의심, 위험, 고위험 중 의심">');
		}else if(data.rows[0].riskIdexValue == 3){
			$("#riskIdexValue").htmlEmp('<img src="/images/sgm/img_keygraph1_3.png" width="532" height="249" alt="주의, 의심, 위험, 고위험 중 위험">');
		}else if(data.rows[0].riskIdexValue == 4){
			$("#riskIdexValue").htmlEmp('<img src="/images/sgm/img_keygraph1_4.png" width="532" height="249" alt="주의, 의심, 위험, 고위험 중 실패">');
		}
	};
	
	rptMainHandler.rpct110103 = function(data){
		// 지역별 테마 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110103Ul a:eq("+i+")").htmlEmp(data.rows[i].themaTrdarNm);
			$("#rpct110103Ul a:eq("+i+")").attr("val",data.rows[i].themaTrdarCd);
		}
	};
	
	rptMainHandler.rpct110104 = function(data){
		// 업종별 테마 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110104Ul a:eq("+i+")").htmlEmp(data.rows[i].themaTrdarNm);
			$("#rpct110104Ul a:eq("+i+")").attr("val",data.rows[i].themaTrdarCd);
		}
	};
	
	rptMainHandler.rpct110105 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110105Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110105Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110105Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110105Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
			
		}
	};
	
	rptMainHandler.rpct110106 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110106Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110106Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110106Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110106Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
		}
	};
	
	rptMainHandler.rpct110107 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110107Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110107Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110107Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110107Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
		}
	};
	
	rptMainHandler.rpct110108 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110108Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110108Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110108Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110108Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
		}
	};
	
	rptMainHandler.rpct110109 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110109Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110109Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110109Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110109Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
		}
	};
	
	rptMainHandler.rpct110110 = function(data){
		// HOT 상권 리스트
		for(var i=0;i<data.rows.length;i++){
			$("#rpct110110Ol a:eq("+i+")").htmlEmp(data.rows[i].trdarNm);
			$("#rpct110110Ol a:eq("+i+")").attr("val",data.rows[i].trdarCd);
			$("#rpct110110Ol a:eq("+i+")").attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+data.rows[i].trdarCd  );
			$("#rpct110110Ol span:eq("+i+")").htmlEmp(data.rows[i].trdarRt);
		}
	};

    /* tab1 조회 function */
	function fn_select() {
    	
    	$.ajax({
	    	context: this,
			url : "/sgmc/main/get_rpct0100.json",
			type : "post",
			datatype : "json",
			data: {
		  		  },
			success : function(list) {
				
				// null 값일경우 처리
				for(var obj in list){
					//console.log(obj);
					if(list[obj].rows.length > 0){
						
						if(list[obj].rows[0] != null){
							rptMainHandler[obj](list[obj]);
						}
					}
				};

				// 지역별 테마 or 업종별 테마 탭 클릭시 이벤트 
				fn_thema_tab_click();
				// 지역별 테마 or 업종별 테마 클릭시 이벤트
				fn_thema_click();
				// 테마상권 2개 조회
				fn_thema_trdar_select();
				
				
				
			}
		});
		
    }
	
	
	/* 지역별 테마 or 업종별 테마 탭 클릭시 이벤트 function */
	function fn_thema_tab_click() {
		/* 메인-지역별,업종별 */
		/* 20151106:지역별,업종별 */
		$(".mList13 .tab li").unbind().click(function(){
			$(this).parent().children().removeClass("selected");
			$(this).parent().parent().parent().parent().children(".jsCont").hide()
			$(this).addClass("selected");
			$(this).parent().parent().parent().parent().children(".jsCont").eq( $(this).index() ).show();
			fn_thema_trdar_select();
			return false;
		});

	/* //20151106:지역별,업종별 */
		$("#themaSelTab em a").focus(function(){
			$(this).parent().trigger("click");
		});
	}
	
	/* 지역별 테마 or 업종별 테마 클릭시 이벤트 function */
	function fn_thema_click() {
		
	
		$("#rpct110103Ul li").unbind().click(function(){
			$("#rpct110103Ul li").removeClass("selected");
			$("#rpct110103Ul li").eq($(this).index()).addClass("selected");
			
			fn_thema_trdar_select();
    	});

		$("#rpct110104Ul li").unbind().click(function(){
			$("#rpct110104Ul li").removeClass("selected");
			$("#rpct110104Ul li").eq($(this).index()).addClass("selected");
			
			fn_thema_trdar_select();
    	});
		
    }
	
	
	/* 테마 상권 2개 조회 function */
	function fn_thema_trdar_select() {
		var themaTrdarCd="";
		
		var selectedVal = "area";
		if($("#themaSelTab>ul>li.selected").index() == 0){
			selectedVal = "area";
		}else{
			selectedVal = "induty";
		}
		if(selectedVal == "area"){	// 지역별 테마 탭 선택이면
			themaTrdarCd = $("#rpct110103Ul li.selected a").eq(0);
		}else{		// 업종별 테마 탭 선택이면
			themaTrdarCd = $("#rpct110104Ul li.selected a").eq(0);
		}
		//alert($(themaTrdarCd).attr("val"));
		$.ajax({
	    	context: this,
			url : "/sgmc/main/get_rpct110111.json",
			type : "post",
			datatype : "json",
			data: {themaTrdarCd:$(themaTrdarCd).attr("val")	// 테마코드
		  		  },
			success : function(list) {
				
				$("#rpct110111AreaImg_0").htmlEmp('');
				$("#rpct110111AreaTxt_0").htmlEmp('');
				$("#rpct110111AreaImg_1").htmlEmp('');
				$("#rpct110111AreaTxt_1").htmlEmp('');
				
				if(list != null){
					for(var i=0;i<list.length;i++){
						
						var upjongCls = list[i].upjongCls;
						
						if(upjongCls && upjongCls.length > 9) {
							upjongCls = upjongCls.substr(0,9) + "...";
						}
						
						if(selectedVal == "area"){	// 지역별 테마 탭 선택이면
							$("#rpct110111AreaImg_"+i).htmlEmp('<img class="moveOneClick" trdarCd="'+list[i].trdarCd+'" src="/rpt_images/alley_list/' + list[i].trdarCd + '.png" width="207" height="142" alt="">');
							$("#rpct110111AreaTxt_"+i).htmlEmp('<strong class="ti moveOneClick" trdarCd="'+list[i].trdarCd+'">'+list[i].trdarNm+'</strong>'+list[i].cls1+" / 테마:"+upjongCls);
						}else{		// 업종별 테마 탭 선택이면
							$("#rpct110111IndutyImg_"+i).htmlEmp('<img class="moveOneClick" trdarCd="'+list[i].trdarCd+'" src="/rpt_images/alley_list/' + list[i].trdarCd + '.png" width="207" height="142" alt="">');
							$("#rpct110111IndutyTxt_"+i).htmlEmp('<strong class="ti moveOneClick" trdarCd="'+list[i].trdarCd+'">'+list[i].trdarNm+'</strong>'+list[i].cls1+" / 테마:"+upjongCls);
						}
					}
				}
				
			}
    	});
		
		
    }
	
	
	
	function initEvent() {
		
		// 업종 선택시 이벤트(먼저 ui_sgmc.js 에서 selected class 처리를 하고 후처리 하는 것임)
		$("#indutySel li").click(function(){
			// 1개의 시군구만 선택할수 있다.
			var lis = $("#indutySel li.selected");
	    	if(lis.length > 1){
	    		//lis.eq(0).removeClass("selected");
	    		lis.removeClass("selected");
	    		
	    		$(this).addClass("selected");
	    	}
	    	
	    	
		});
		
//		// HOT상권 상권검색(과밀지수순, 유동인구순, 매출액순)_(param=상권코드)
//		$("#rpct110105Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
//		$("#rpct110106Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
//		$("#rpct110107Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
//		
//		// COOL상권 상권검색(과밀지수순, 유동인구순, 매출액순)_(param=상권코드)
//		$("#rpct110108Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
//		$("#rpct110109Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
//		$("#rpct110110Ol a").click(function(){
//			$(this).attr("href","/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("val"));
//		});
		
		
		// 지역별 테마 더보기 클릭시 이벤트(param=테마코드)
		$("#areaTrdarMore").click(function(){
			$(this).attr("href","/sgmc/thematrdar/get_area_thema_trdar.do?level1=2&level2=3&themaTrdarCd="+$("#rpct110103Ul li.selected a").eq(0).attr("val"));
		});
		
		// 업종별 테마 더보기 클릭시 이벤트(param=테마코드)
		$("#indutyTrdarMore").click(function(){
			$(this).attr("href","/sgmc/thematrdar/get_induty_thema_trdar.do?level1=2&level2=4&themaTrdarCd="+$("#rpct110104Ul li.selected a").eq(0).attr("val"));
		});
		
		$("#rpct110111AreaImg_0").css("cursor","pointer");
		$("#rpct110111AreaTxt_0").css("cursor","pointer");
		$("#rpct110111AreaImg_1").css("cursor","pointer");
		$("#rpct110111AreaTxt_1").css("cursor","pointer");

		
		
		$("#rpct110111AreaImg_0,#rpct110111AreaImg_1,#rpct110111AreaTxt_0,#rpct110111AreaTxt_1").on("click",function(){
			location.href = "/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).find(".moveOneClick").attr("trdarCd");
//			location.href = "/sgmc/customanals/get_one_stop_trdar_cmpr.do?level1=3&level2=6&trdarCd="+$(this).attr("trdarCd");
		});
		
		
		$(".mList11 .tab .ti a").focus(function(){
			$(this).parent().trigger("click");
		});
		$(".mList11 .tab .sub>ul>li>em.t>a").focus(function(){
			$(this).trigger("click");
		});
	}	
	
	// 화면 로딩시 진입점
	$(document).ready(function() {
		$(".mLayer1, .modalBg").hide();
	    // 초기 이벤트 처리 호출 부분
	    initEvent();
	    
	    // 정보 조회
	    fn_select();
	    stdrYm();
	});