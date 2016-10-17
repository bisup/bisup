<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
<html>
<head>
<title>사이트맵 입니다.</title>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="/bisup/js/jquery-1.3.2.min.js"> </script> 
<script src="/bisup/js/jquery.tablesorter.min.js"> </script> 
<link rel="stylesheet" href="/bisup/css/tablesort_style.css"/>
<link rel="stylesheet" href="/bisup/css/s_style.css" />
</head>
<body>
<div id="contents" >
<h1 align="center">사이트 맵</h1>
<table align="center" class="tables">
  <c:if test="${sessionScope.sort==0}">
<td><fieldset><legend><h2>메인메뉴</h2></legend>
                   <ul>  
                  <li>   <a href='/bisup/bisup/notice/nlist.do'>공지사항</a>  </li>
                   <li>   <a href='/bisup/bisup/question/qlist.do'>문의사항</a>  </li>
                    <li>   <a href=#>쪽지함</a>  </li>
                  </ul> </fieldset>
                  </td>
                  
<td class="tables"><div><h2>창업 컨설팅</h2></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup_concerting/info_customer.do'>거래처 정보</a>  </li>
                    <li> <a href='/bisup/bisup_concerting/manual.do'>창업 메뉴얼</a>  </li>
                   <li>  <a href='/bisup/bisup_concerting/relation.do'>연관 사이트</a>   </li>
                  </ul> 
                  </td>  
<td class="tables">
 
                  <h2><div>매출트렌드</div></h2>
                  <ul >  
                      <li> <a href='/bisup/bisup_trend/sales_trend.do'>매출 트랜드 보고서</a></li>
                     <li> <a href='/bisup/bisup_trend/business_trend.do'>업종 트랜드보고서</a></li>  
                  </ul> 
               
</td>
<tr>
<td class="tables"><h2>상권정보검색</h2>
                  <ul >  
                       <li> <a href='/bisup/my/areaInfo/salesarea.do'>지역별 상권 정보</a></li>
                     <li> <a href='/bisup/my/areaInfo/sdanger.do'>상권위험지표</a></li>  
                       <li><a href="/bisup/my/areaInfo/mpInfo.do">지역별 인구 현황</a></li>
                  </ul> 
               </li>
                  </td>                  
<td class="tables">
 
                  <h2><div>관리자 페이지 </div></h2>
                  <ul >  
                      <li> <a href='/bisup/admin/main.do'>회원 관리</a></li>
                       <li><a href="/bisup/admin/store.do">점포 관리</a></li> 
                  </ul> 
               
</td>

</tr>
</c:if>
  <c:if test="${sessionScope.sort==1}">
 <td><h2><div>메인페이지 </div></h2>
                  <ul >  
                     <li> <a href='/bisup/bisup_login/main.do'>메인페이지</a></li>  
                  </ul> 
               
</td>
<td class="tables"><div><h2>메인메뉴</h2></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup/notice/nlist.do'>공지사항</a>  </li>
                   <li>   <a href='/bisup/bisup/question/qlist.do'>문의사항</a>  </li>
                    <li>   <a href=#>쪽지함</a>  </li>
                  </ul> 
                  </td>
                  
<td class="tables"><div><h2>창업 컨설팅</h2></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup_concerting/info_customer.do'>거래처 정보</a>  </li>
                    <li> <a href='/bisup/bisup_concerting/manual.do'>창업 메뉴얼</a>  </li>
                   <li>  <a href='/bisup/bisup_concerting/relation.do'>연관 사이트</a>   </li>
                  </ul> 
                  </td>  
<td class="tables">
 
                  <h2><div>매출트렌드</div></h2>
                  <ul >  
                      <li> <a href='/bisup/bisup_trend/sales_trend.do'>매출 트랜드 보고서</a></li>
                     <li> <a href='/bisup/bisup_trend/business_trend.do'>업종 트랜드보고서</a></li>  
                  </ul> 
               
</td>
<tr>
<td class="tables"><div ><h2>상권정보검색</h2></div>
                  <ul >  
                       <li> <a href='/bisup/my/areaInfo/salesarea.do'>지역별 상권 정보</a></li>
                     <li> <a href='/bisup/my/areaInfo/sdanger.do'>상권위험지표</a></li>  
                       <li><a href="/bisup/my/areaInfo/mpInfo.do">지역별 인구 현황</a></li>
                  </ul> 
               </li>
                  </td>
<td class="tables">
 
                  <h2><div>마이페이지 </div></h2>
                  <ul >  
                      <li> <a href='/bisup/bisup/mypage/modifyCheck.do'>마이페이지</a></li>
                       
                  </ul> 
               
</td>                  

</tr>
</c:if>
  <c:if test="${sessionScope.sort==2}">
<td class="tables"><div><h2>메인메뉴</h2></div>
                    <ul>  
                         <li>   <a href='/bisup/bisup/notice/nlist.do'>공지사항</a>  </li>
                   <li>   <a href='/bisup/bisup/question/qlist.do'>문의사항</a>  </li>
                    <li>   <a href=#>쪽지함</a>  </li>
                  </ul> 
                  </td>
                  
<td class="tables"><div><h2>창업 컨설팅</h2></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup_concerting/info_customer.do'>거래처 정보</a>  </li>
                    <li> <a href='/bisup/bisup_concerting/manual.do'>창업 메뉴얼</a>  </li>
                   <li>  <a href='/bisup/bisup_concerting/relation.do'>연관 사이트</a>   </li>
                  </ul> 
                  </td>  
<td class="tables">
 
                  <h2><div>내 점포 매출관리</div></h2>
                  <ul >  
            	<li><a href="/bisup/mystore/menuMain.do">메뉴등록</a></li>
           		<li><a href="/bisupsales/salesInserting.do">매출등록</a></li> 
          		<li><a href="/bisup/mystore/saleProgressMain.do">매출 추이 조회</a></li>
            	<li><a href="/bisup/sales/salesOther.do">부수 비용 관리</a></li>
            	<li><a href="/bisup/sales/drawMonChart.do">월별 매출 차트</a></li>
                  </ul> 
               
</td>
<tr>
<td class="tables"><div ><h2>상권정보검색</h2></div>
                  <ul >  
                       <li> <a href='/bisup/my/areaInfo/salesarea.do'>지역별 상권 정보</a></li>
                     <li> <a href='/bisup/my/areaInfo/sdanger.do'>상권위험지표</a></li>  
                       <li><a href="/bisup/my/areaInfo/mpInfo.do">지역별 인구 현황</a></li>
                  </ul> 
               </li>
                  </td>                  
<td class="tables">
 
                  <h2><div>메인페이지 </div></h2>
                  <ul >  
                      <li> <a href='/bisup/bisup_login/main.do'>메인페이지로</a></li>
                       
                  </ul> 
               
</td>
</tr>
</c:if>
</table>
</div>
</body>
</html>