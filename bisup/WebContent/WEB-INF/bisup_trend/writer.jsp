<%@ page  contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<title></title>
<script src="script.js"></script>
<style>
#content {
    clear: both;
    width: 1000px;
    min-height: 400px;
    margin: auto;
    padding: 55px 0 100px;
    overflow: hidden;
}

#th{
    padding: 12px;
    height: 24px;
    border: 1;
    border-left:  solid #cbcbcb;
    border-bottom: 1px solid #cbcbcb;
    text-align: center;
}
 
.tb_date{
   
    table-layout: fixed;
    border: 1;
    border-spacing: 0;
    border-top: 3px solid #444;
    background: #fff;
    overflow: hidden;
    
}
a .btn{
    height: 28px;
}
.btn{
    display: inline-block;
    height: 30px;
    padding: 0 16px;
    border: 1px solid #d7d7d7;
    font-weight: bold;
    color: #555 !important;
    font-size: 13px;
    line-height: 28px;
    vertical-align: middle;
    text-decoration: none !important;
    background: #f5f5f5 !important;
    overflow: hidden;
}



</style>

</head>
<body>
<div id="content">
	<form action="/bisup/bisup_trend/business_write1.do" 
	name="writeform" onsubmit="return writeSave()" method="post">
	<h3>bisup 창업 트렌드 글작성</h3><br>
		<input type="hidden" name="num" value="${num}">
	 <table border="1" width="1000">
	 	<tr>
	 		<td id="th">제목</td>
	 		<td id="th" align="left"><input type="text" name="title"  size="50"></td>
	 	</tr>
	 	
	 	<tr>
	 		<td id="th">작성자</td>
	 		<td id="th">
	 		<input type="hidden" size="50" name="nickname" value="${sessionScope.nick }">${sessionScope.nick }</td>
	 	</tr>
	 	
	 	<tr>
	 		<td id="th">주소</td>
	 		<td id="th" ><textarea name="address"  cols="110" rows="10"></textarea></td>
	 	</tr>		 
	 </table>
	 <br><br>
	 <div align="right">
	<input  type="button" value="목록"  class="btn" onclick="javascript:location='/bisup/bisup_trend/business_trend.do'"></button>
	<input  type="submit" value="글작성"  class="btn" ></button>
	</div>
	</form>
</div>

</body>
</html>