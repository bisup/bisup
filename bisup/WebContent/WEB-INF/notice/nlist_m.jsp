<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 이미래 공지사항 리스트-->
<html>
<head>
<title>title</title>
<style type="text/css">
.pagination>li>a, .pagination>li>span { border-radius: 50% !important;margin: 0 5px;}
</style>
<script type="text/javascript">
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');
    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-list-search tbody');
        var tableRowsClass = $('.table-list-search tbody tr');
        $('.search-sf').remove();
        tableRowsClass.each( function(i, val) {
        
            //Lower text for case insensitive
            var rowText = $(val).text().toLowerCase();
            var inputText = $(that).val().toLowerCase();
            if(inputText != '')
            {
                $('.search-query-sf').remove();
                tableBody.prepend('<tr class="search-query-sf"><td colspan="6"><strong>검색 내용: "'
                    + $(that).val()
                    + '"</strong></td></tr>');
            }
            else
            {
                $('.search-query-sf').remove();
            }
            if( rowText.indexOf( inputText ) == -1 )
            {
                //hide rows
                tableRowsClass.eq(i).hide();
                
            }
            else
            {
                $('.search-sf').remove();
                tableRowsClass.eq(i).show();
            }
        });
        //all tr elements are hidden
        if(tableRowsClass.children(':visible').length == 0)
        {
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">검색 결과가 없습니다.</td></tr>');
        }
    });
});
</script>
<!-- <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button> -->
</head>
<body>
<div class="container">
<br><br>
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">공지사항</h2>
  	<p style="display: block;">관리자 공지사항입니다</p>
        <div style="width: 300px; float: right;">
            <form action="#" method="get">
                <div>
                   <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                   <input class="form-control" id="system-search" name="q" placeholder="검색할 키워드를 입력하세요.">
                   <br>
                    <input type="button" class="btn btn-primary" value="글쓰기"  onclick="javascript:location='/bisup/bisup/notice/nwrite.do'" style="float: right;">
                </div>
            </form>
        </div>
    	 <table class="table table-list-search">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>작성자</th>
                            <th>제목 </th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                    	<c:when test="${fn:length(list) > 0}">
                    		<c:forEach items="${list}" var="list">
                    			<tr>
                    				<td>${list.NUM}</td>
                    				<td>${list.WRITER}</td>
                    				<td><a href="/bisup/bisup/notice/ncontents_m.do?num=${list.NUM}">${list.TITLE}</a></td>
                    				<td>${list.CNT}</td>
                    				<td>${list.REG}</td>
                    			</tr>
                    		</c:forEach>
                    	</c:when>
                    	<c:otherwise>
                    	<tr>
                    		<td colspan="5">조회된 결과가 없습니다.</td>
                    	</tr>
                    	</c:otherwise>
                    </c:choose>
                    </tbody>
                </table>   
		</div>
</body>
</html>