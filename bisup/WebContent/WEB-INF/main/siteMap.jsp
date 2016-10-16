<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html >
<html>
<head>
<title>사이트맵 입니다.</title>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="../../js/jquery-1.3.2.min.js"> </script> 
<script src="../../js/jquery.tablesorter.min.js"> </script> 
<link rel="stylesheet" href="../../css/tablesort_style.css"/>
<link type="text/css" href="../../css/salary_style.css" rel="stylesheet" />
</head>
<body>
<div id="contents" >
<h1 align="center">사이트 맵</h1>
<fieldset>
<table align="center" class="tables">
<td class="tables"><div><h1>메인메뉴</h1></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup/notice/nlist.do'>공지사항</a>  </li>
                   <li>   <a href='/bisup/bisup/question/qlist.do'>공지사항</a>  </li>
                    <li>   <a href='/bisup/bisup/mypage/modifyCheck.do'>공지사항</a>  </li>
                  </ul> 
                  </td>
                  
<td class="tables"><div><h1>창업 컨설팅</h1></div>
                    <ul>  
                  <li>   <a href='/bisup/bisup_concerting/info_customer.do'>거래처 정보</a>  </li>
                    <li> <a href='/bisup/bisup_concerting/manual.do'>창업 메뉴얼</a>  </li>
                   <li>  <a href='/bisup/bisup_concerting/relation.do'>연관 사이트</a>   </li>
                  </ul> 
                  </td>
<td class="tables">
 
                  <h1><div>매출트렌드</div></h1>
                  <ul >  
                      <li> <a href='/bisup/bisup_trend/sales_trend.do'>매출 트랜드 보고서</a></li>
                     <li> <a href='/bisup/bisup_trend/business_trend.do'>업종 트랜드보고서</a></li>  
                  </ul> 
               
</td>
<tr>
<td class="tables"><div ><h1>상권정보검색</h1></div>
                  <ul >  
                       <li> <a href='/bisup/my/areaInfo/salesarea.do'>지형정보</a></li>
                     <li> <a href='/bisup/my/areaInfo/sdanger.do'>상권위험지표</a></li>  
                      <li> <a href='/bisup/my/areaInfo/sdanger.do'>상권위험지표</a></li>      
                  </ul> 
               </li>
                  </td>                  
<td class="tables">
 
                  <h1><div>메인페이지 </div></h1>
                  <ul >  
                      <li> <a href='/bisup/bisup_login/main.do'>메인페이지로</a></li>
                       
                  </ul> 
               
</td>

</tr>

</table>
</fieldset>
</div>
</body>
</html>