<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$("document").ready(
			function() {
				var url = "/bisup/admin/allMembers.do";
				var pageNum = {pageNum:'${pageNum}'};
				$.ajax({
					type : "post",
					url : url,
					data : pageNum,
					dataType : "json",
					success : function(args) {
						for (var idx = 0; idx < args.data.length; idx++) {
							var one = "창업예정자"
							var two = "창업자"
							var sort = (args.data[idx].sort == 1) ? one : two
							$("#allMember").append(
									"<tr><td>" + args.data[idx].id
											+ "</td><td>" + args.data[idx].name
											+ "</td><td>" + args.data[idx].nick
											+ "</td><td>" + sort
											+ "</td><td>" + args.data[idx].snum
											+ "</td><td>" + args.data[idx].phone
											+ "</td><td>" + args.data[idx].tel
											+ "</td><td>" + args.data[idx].reg
											+ "</td><td>" + args.data[idx].email
											+ "</td><td>" + args.data[idx].gucode
											+ "</td><td>")
							
						}
						$("#paging").append("< ");
						for (var idx = 1; idx <= args.count; idx++){
							if(idx==args.count){
								$("#paging").append("<a href=/bisup/admin/main.do?pageNum="+idx+">"+idx+"</a>");
							}else{
								$("#paging").append("<a href=/bisup/admin/main.do?pageNum="+idx+">"+idx+"</a>"+" | ");
							}
						}
						$("#paging").append(" >");
						
						
						/* for(var idx=1; args.data2>=idx; idx++){
							if(args.data2>idx){
								$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>&#124;");
							}else{
								$("#paging").append("<a href=selectPageNum("+idx+")"+idx+"<a>");
							}
						} *///페이지 번호를 위한 for문
						return false;
					},
					error : function(e) {
						alert(e.responseText);
						return false;
					}
				});
			})
</script>

<script type="text/javascript">
$(document).ready(function() {
    var activeSystemClass = $('.list-group-item.active');
    //something is entered in search form
    $('#system-search').keyup( function() {
       var that = this;
        // affect all table rows on in systems table
        var tableBody = $('.table-condensed tbody');
        var tableRowsClass = $('.table-condensed tbody tr');
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


</head>
<body>
	<div class="container">
		<br>
		<br>
		<h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">회원
			관리</h2>
		<p style="display: block;">창업예정자 / 자영업자의 회원 정보입니다.</p>
		<div style="width: 300px; float: right;">
            <form action="#" method="get">
                <div>
                   <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                   <input class="form-control" id="system-search" name="q" placeholder="검색할 키워드를 입력하세요.">
                   <p style="display: block;">'창업예정자','창업자'를 선택하여 입력.</p>
                </div>
                <br>
            </form>
        </div>
		<form:form commandName="command" action="/bisup/admin/selectOneMember.do">
			<div id="container">

				<table class="table table-condensed">
					<thead>
						<tr>
							<th>ID</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>가입분류</th>
							<th>snum</th>
							<th>핸드폰번호</th>
							<th>전화번호</th>
							<th>가입일</th>
							<th>이메일</th>
							<th>행정구역(구)코드</th>
						</tr>
					</thead>
					<tbody id="allMember">

					</tbody>
				</table>
				<div id="paging" align="center"></div>
			</div>
		</form:form>
	</div>
</body>
</html>