<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<% String cp = request.getContextPath(); %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<%=cp%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<title>비즈업(BisUp) 관리자 페이지</title>
</head>
<body>
   <script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="<%=cp%>/resources/bootstrap/js/bootstrap.min.js"></script>

<a href="/bisup/bisup/main/main.do">
<img src="/bisup/resources/img/logo.png" alt="로고이미지" width="250" style="margin-left: auto; margin-right: auto; display: block;"/></a>
<div class="pull-right">
<ol class="breadcrumb ">
<li><a href="#"><span class="glyphicon glyphicon-envelope" aria-hidden="true"> 쪽지함 </span></a></li>
<li><a href="logout.do">로그아웃</a></li>
<li><a href="/bisup/bisup/main/siteMap.do">사이트맵</a></li>
</ol>
</div>
<br><br><br>
<!-- <nav class="navbar navbar-default"> -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav nav-pills nav-justified">
        <!-- <li ><a href="#">Link <span class="sr-only">(current)</span></a></li> 활성화 class="active"
        <li><a href="#">Link</a></li> 드롭다운 아닌 그냥 메뉴-->
        
        <li class="dropdown"><!-- 상권정보검색 -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">상권 정보 검색<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">상권 정보 검색</a></li>
            <li class="divider"></li>
            <li><a href="#">위험 지표 검색</a></li>
          </ul>
        </li>
        
        <li class="dropdown"><!-- 매출트렌드 -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">매출 현황<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/bisup/bisup_trend/sales_trend.do">매출 트렌트 보고서</a></li>
            <li class="divider"></li>
            <li><a href="/bisup/bisup_trend/business_trend.do">업종 트렌드 보고서</a></li>
          </ul>
        </li>
        
         <li class="dropdown"><!-- 창업컨설팅 -->
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">창업컨설팅<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/bisup/bisup_concerting/info_customer.do">거래처 정보</a></li>
            <li class="divider"></li>
            <li><a href="/bisup/bisup_concerting/manual.do">창업 메뉴얼</a></li>
            <li class="divider"></li>
            <li><a href="/bisup/bisup_concerting/relation.do">연관 사이트</a></li>
          </ul>
        </li>
        
        <li><a href="/bisup/bisup/notice/nlist_m.do">공지사항 작성</a></li>
        <li><a href="/bisup/bisup/question/qlist_m.do">문의사항</a></li>
        
        
        <!-- 관리자페이지 -->
        <c:if test="${sessionScope.sort==0}">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">관리자 페이지<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/bisup/admin/main.do">회원 관리</a></li>
            <li class="divider"></li>
            <li><a href="/bisup/admin/store.do">점포 관리</a></li>
          </ul>
        </li>
        </c:if>
        
       <!--  마이페이지 -->
        <c:if test="${sessionScope.sort!=0}">
        <li>
          <a href="/bisup/bisup/mypage/modifyCheck.do">마이 페이지</a>
        </li>
        </c:if>
        
      </ul>
      
  <!--     <ul class="nav navbar-nav navbar-right"> 오른쪽메뉴
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul> -->
    </div><!-- /.navbar-collapse -->
  <!-- </div>/.container-fluid -->
<!-- </nav> -->
</body>
</html>