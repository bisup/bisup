<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>title</title>
<style type="text/css">
body {
    margin-top: 2%
    
}
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
            tableBody.append('<tr class="search-sf"><td class="text-muted" colspan="6">No entries found.</td></tr>');
        }
    });
});
</script>
</head>




<body>
<div class="container">
<br><br>
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">공지사항</h2>
  	<p style="display: block;">고객의 성공을 돕는 비즈업(BisUp)이 되겠습니다.</p>
	<br><br>

        <div style="width: 300px;">
            <form action="#" method="get">
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required>
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                    </span>
                </div>
            </form>
        </div>
   		<button type="button" class="btn btn-primary" style="float: right;">글쓰기</button>
        
    	 <table class="table table-list-search">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>미래</td>
                            <td>TEST</td>
                            <td>Do some other</td>
                            <td>123</td>
                            <td>2016-09-27</td>
                        </tr>
                       <tr>
                            <td>2</td>
                            <td>관리자</td>
                            <td>TEST2</td>
                            <td>Sample</td>
                            <td>0</td>
                            <td>2016-09-27</td>
                        </tr>
                    </tbody>
                </table>   
		</div>
	
<div class="container">
	<ul class="pagination">
              <li class="disabled"><a href="#">«</a></li>
              <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#">»</a></li>
            </ul>
</div>
</body>
</html>