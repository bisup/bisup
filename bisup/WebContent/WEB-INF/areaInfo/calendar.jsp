
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width"/>
<!-- initial-scale=1,minimum-scale=1,
maximum-scale=1,user-scalable=yes,target-densitydpi=medium-dpi -->
<title>QTI 휴가 예약시스템</title>
  <link rel="stylesheet" href="./css/rest.css" type="text/css">
  <link rel="stylesheet" href="./css/m_rest.css" type="text/css">
  <link rel="stylesheet" href="./css/jquery-ui.css" type="text/css">
  <script src='./js/jquery-2.2.2.min.js'></script>
  <script src="./js/jquery-ui.min.js"></script>
  <script src="./js/printThis.js"></script>
  <script src="./js/jquery.board.pager.js"></script>
 <script >
 <!--달력 한글 셋팅-->
 
   $.datepicker.setDefaults({
       dateFormat: 'yymmdd',
       prevText: '이전 달',
       nextText: '다음 달',
       monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
       dayNames: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
       dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
       showMonthAfterYear: true,
       yearSuffix: '년'
     }); 
   $(document).ready(function(){
       if($("#login_check").length==0){
         location.href="./index.jsp"
         alert("로그인 하십시오")
      }
      $.ajax({
         type: 'POST',
         url : 'getListJson.do',//JSON파일을 불러온다
         dataType : "json",
         success : 
         function(json){ //JSON파일을 성공적으로 불러왔으면 실행
            var sdate= "";//휴가 시작날짜
            var edate="";//휴가 끝날짜
            var color="";
            for(var i=0;i<json.list.length;i++){//휴가 리스트의 개수 만큼 for문을 실행
               sdate = $(".day_cont[data-date="+json.list[i].sdate+"]")//시작날짜의 data-date속성에 값을 넣는다.
               edate = $(".day_cont[data-date="+json.list[i].edate+"]")//끝날짜의 data-date속성에 값을 넣는다.
               if(json.list[i].sdate==json.list[i].edate && json.list[i].permission != "3"){//시작날짜와 끝날짜가 같으면 실행
                  if(json.list[i].permission == "0"){
                     color="#FF6C6C";
                  }else if(json.list[i].permission == "1"){
                     color="#FF6C6C";
                  }else if(json.list[i].permission == "2"){
                     color="#7aa7e5";
                  }
                  if(sdate.children().size()<3){//시작날짜의 자식노드의 수가 3개 미만이면 실행
                     sdate.append("<div class='day_name' style='background-color:"+color+"' onclick=restView('"+json.list[i].rest_no+"','"+json.list[i].sdate+"')>"+json.list[i].name+"</div>")//해당 날짜에 휴가인 사원들을 추가해준다.
                  }else{//시작날짜의 자식노드의 수가 3개 이상이면 실행
                     if(sdate.children().size()==3){//시작날짜의 자식노드 수가 3개이면 실행
                        sdate.append("<div class='rest_more' onclick=more_view('"+json.list[i].sdate+"')></div>")//사원들을 더 볼수있는 버튼을 추가
                     }
                     sdate.append("<div class='day_name' style='display: none' >"+json.list[i].name+"</div>")//3개 초과하면 사원들의 이름을 감춤
                     sdate.find('.rest_more').text("+ "+(sdate.children().size()-4)+" more");//몇명의 사원들이 더 있는지 표시
                  };
               }else if(json.list[i].sdate != json.list[i].edate && json.list[i].permission != "3"){//시작날짜와 끝날짜가 같지 않으면 실행(휴가가 하루가 아닐경우)
                  if(json.list[i].permission == "0"){
                     color="#FF6C6C";
                  }else if(json.list[i].permission == "1"){
                     color="#FF6C6C";
                  }else if(json.list[i].permission == "2"){
                     color="#7aa7e5";
                  }   
                  for(var j=json.list[i].sdate;j<=json.list[i].edate;j++){//시작날짜와 끝날짜의 사이만큼 for문을 실행
                     if($(".day_cont[data-date="+j+"]").children().size()<3){//휴가날짜의 자식수가 3개 미만일 경우 실행
                        $(".day_cont[data-date="+j+"]").append("<div class='day_name' style='background-color:"+color+"' onclick=restView('"+json.list[i].rest_no+"','"+j+"')>"+json.list[i].name+"</div>")//해당 날짜에 휴가인 사원들을 추가해준다.
                     }else{//휴가날짜의 자식수가 3개 이상일경우 실행
                         if($(".day_cont[data-date="+j+"]").children().size()==3){ //휴가날짜의 자식수가 3개일 경우 실행
                            $(".day_cont[data-date="+j+"]").append("<div class='rest_more' onclick=more_view('"+j+"')></div>")//사원들을 더 볼수있는 버튼을 추가
                        } 
                        $(".day_cont[data-date="+j+"]").append("<div class='day_name' style='display: none'></div>")//3개 초과하면 사원들의 이름을 감춤
                        $(".day_cont[data-date="+j+"]").find('.rest_more').text("+ "+($(".day_cont[data-date="+j+"]").children().size()-4)+" more")//몇명의 사원들이 더 있는지 표시
                     }
                  }
               }
            }
         }
      })
   })
   $(function(){ //휴가등록 페이지 출력
      $("#restInputBtn").click(function(){
         $.ajax({
                type: 'post',
              url: 'restInput.do',
              dataType : 'html',
              success: 
                  function(data) {
                    $("#insertView").html(data);
                      $("#insertView").css("display","block");
                   }
         });
      });      
   });
   function image(){ //모든 닫기 버튼 클릭시 페이지 닫음
      $("#insertView").css("display","none");
      $("#myListView").css("display","none");
      $("#updateView").css("display","none");
      $("#restView").css("display","none");      
      $("#moreView").css("display","none");      
      $("#myInfoUpdate").css("display","none");      
   };
   function update_btn(){
      $("#updateView").css("display","none");
   }
   function return_image(){
      $("#returnView").css("display","none");
   }
   function an_image(){
      $("#annualList").css("display","none");
   };
   function restview_print(){//프린트 출력
      $("#restview_main").printThis({
         debug:false,
         importCSS:true,
         printContainer:true,
         loadCSS:"http://qtii.cafe24.com/rest/css/print.css",
         pageTitle:"",
         removeInline:false
      });
   };
   function restView(rest_no,sdate){//사원 이름클릭시 휴가신청서 출력
       $.ajax({
             type: 'post'
           , url: 'restView.do?rest_no='+rest_no+'&sdate='+sdate
           , dataType : 'html'
           , success: 
              function(data) {
                 $("#restView").html(data);
                 $("#restView").css("display","block");
                }
        });   
   };
   function more_view(date){//more클릭시 휴가자 더보기
       $.ajax({
             type: 'post'
           , url: 'moreView.do?date='+date
           , dataType : 'html'
           , success: 
              function(data) {
                 $("#moreView").html(data);
                 $("#moreView").css("display","block");
                }
        });   
   };
   function myListView(id){//My목록 페이지 출력
        $.ajax({
                type: 'post'
              , url: 'myList.do?id='+id
              , dataType : 'html'
              , success: function(data) {
                 $("#myListView").html(data);
                 $("#myListView").css("display","block");
                }
   });   
   };
   function updateRest(rest_no){//사원 휴가 정보 업데이트
        $.ajax({
                type: 'post'
              , url: 'updateRest.do?rest_no='+rest_no
              , dataType : 'html'
              , success: function(data) {
                 $("#updateView").html(data);
                 $("#updateView").css("display","block");
                }
   });    
   }; 
   function myListDelete(rest_no){//My목록에서 휴가 신청했던거 삭제
      if(confirm("삭제하시겠습니까?")){
      location.href="myListDelete.do?rest_no="+rest_no;
      alert("삭제완료");
      }
   }
   function annualList(id,position){//연차 신청 사원 목록
        $.ajax({
                type: 'post'
              , url: 'annualList.do?id='+id+'&position='+position
              , dataType : 'html'
              , success: function(data) {
                 $("#annualList").html(data);
                 $("#annualList").css("display","block");
                }
   });    
   };
   function myInfoUpdate(id){//비밀번호 변경
        $.ajax({
                type: 'post'
              , url: 'myInfoUpdateForm.do?id='+id
              , dataType : 'html'
              , success: function(data) {
                 $("#myInfoUpdate").html(data);
                 $("#myInfoUpdate").css("display","block");
                }
   });    
   };
   function anApproval(id,position){
      if(confirm("승인하시겠습니까?")){
      location.href="anApproval.do?rest_no="+id+"&position="+position;
      alert("승인되었습니다");
      $("#annualList").css("display","none");
      }
   }
    </script>
</head>

<body>   

<div id="main_top">
<div class="top_wrap">
<div class="title_wrap">
<img  src="./images/main_title.png">
</div>
<div class="login_wrap">
<c:if test="${loginSession != null}">
   <div class="myInfo">${loginSession.name}님 환영합니다. </div> 
   <input type="button" onclick="myInfoUpdate('${loginSession.id}')" value="정보수정"/>
   <input type="button" onclick="location.href='logout.do'" value="로그아웃"/>
    <input type="hidden" id="login_check"> 
</c:if>
</div>
</div>
</div>
<input type="hidden" value="${today}" id="todaydate">
<div id="main_wrap">
<form name="calendarFrm" id="calendarFrm" action="" method="post">
<div id="main_cont">
<!--날짜 네비게이션  -->
<div class="navi_wrap" >
                    <a href="main.do?year=${year-1}&month=${month}"class="navi_btn">
                           <img src="./images/previous_first.png"><!-- 이전해 -->
                    </a>
                    <c:choose>
                       <c:when test="${month > 0}">
                    <a href="main.do?year=${year }&month=${month-1}"class="navi_btn">
                           <img src="./images/previous.png"><!-- 이전달 -->
                    </a>
                       </c:when>
                    <c:otherwise>
                             <a href="main.do?year=${year-1}&month=${month+11}"class="navi_btn" >
                           <img src="./images/previous.png"><!-- 이전달 -->
                    </a>
                    </c:otherwise>  
                    </c:choose>
                   <span class="today_date"> ${year }년 ${month+1}월</span>
                    <input type="button" class="today_btn" value="Today" onclick="location.href='main.do'" />
                      <c:choose>
                       <c:when test="${month < 11}">
                    <a href="main.do?year=${year }&month=${month+1}"class="navi_btn">
                             <img src="./images/next.png"><!-- 다음달 -->
                    </a>
                       </c:when>
                   <c:when test="${month eq 11}">
                             <a href="main.do?year=${year +1}&month=${month-11}"class="navi_btn">
                            <img src="./images/next.png"> <!-- 다음달 -->
                    </a> 
                    </c:when>
                    </c:choose>
                    <a href="main.do?year=${year +1}&month=${month}" class="navi_btn">
                          <img src="./images/next_last.png"> <!-- 다음해 -->
                    </a><br/>

       </div>
     <div class="login_after">
        <input type="button" value="휴가등록" id="restInputBtn" class="btn">
        <input type="button" id="mypageView" value="My목록" class="btn" onclick="myListView('${loginSession.id}')">
        <c:if test="${loginSession.position eq '전무' or loginSession.position eq '팀장'}">
          <input type="button" value="승인신청 목록"  class="btn" onclick="annualList('${loginSession.id}','${loginSession.position}') ">
      </c:if>
        </div>
<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
<THEAD>
<TR class="vtr">
       <TD><DIV >SUN</DIV></TD>
       <TD ><DIV >MON</DIV></TD>
       <TD ><DIV >TUE</DIV></TD>
       <TD ><DIV >WED</DIV></TD>
       <TD ><DIV>THU</DIV></TD>
       <TD ><DIV>FRI</DIV></TD>
       <TD ><DIV>SAT</DIV></TD>
</TR>
</THEAD>
<TBODY>
<TR>
<c:set var = "newline" value="0"/>
<c:forEach var="i" begin="2" end="${start}">
<TD  class='td_day' >&nbsp;</TD>
<c:set var = "newline" value="${newline+1 }"/>
</c:forEach>
<c:forEach var="index" begin="1" end="${endDay}" step="1" >
 <c:set var = "color" value=""/>
 <c:choose>
   <c:when test="${newline eq 0}">
   <c:set var = "color" value="#f17070"/>
   </c:when>
   <c:when test="${newline eq 6}">
   <c:set var = "color" value="#79a8e8"/>
   </c:when>
   <c:otherwise>
   <c:set var = "color" value="#898989"/>
   </c:otherwise>
   </c:choose>
   <c:set var = "bgcolor" value="#ffffff"/>
   <c:if test="${intToday eq  today + (index-1)}">
    <c:set var ="bgcolor" value="#e3eefd"/>
   </c:if>   
   <TD class='td_day' bgcolor='${bgcolor}' >
   <div class="day_wrap">
   <div class="day_title" style="color: ${color}">${index } </div>
    <div class="day_cont" data-date="${today + (index-1) }"></div></div>
    </TD>
   <c:set var = "newline" value="${newline+1 }"/>
    <c:if test="${newline eq 7}">
    </TR>
    <c:if test="${index <= endDay} ">
    <TR>
    </c:if>
     <c:set var = "newline" value= "0"/>
     </c:if>     
 </c:forEach>
<c:forEach begin="${newline }" end="6">
<TD  class='td_day' >&nbsp;</TD>
<c:set var = "newline" value="${newline+1 }"/>
</c:forEach>
</TR>
 
</TBODY>
</TABLE>
</DIV>
</form>
</div>
<div id="insertView"></div>
<div id="myListView"></div>
<div id="moreView"></div>
<div id="updateView"></div>
<div id="restView"></div>
<div id="annualList"></div>
<div id="myInfoUpdate"></div>
</body>
</html>