<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>
<br><br>
	<div class="container">
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">공지사항</h2>
  	<p style="display: block;">고객의 성공을 돕는 비즈업(BisUp)이 되겠습니다.</p>
	<br>
	<div class="panel panel-default">
	<form>
	<div class="panel-body">
	  <div class="form-group">
	    <label for="exampleInputEmail1">글 제목</label>
	    <input type="text" class="form-control" placeholder="제목을 입력하세요.">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">작성자</label>
	    <input type="text" class="form-control"  placeholder="닉네임을 입력하세요.">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1">글 내용</label>
	    <textarea class="form-control" rows="5" id="comment" placeholder="작성할 내용을 입력하세요."></textarea>
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1">파일</label>
	    <input type="file" class="form-control" placeholder="제목을 입력하세요.">
	  </div>
	  <br>
	  
	  <div align="right">
	  <button type="submit" class="btn btn-primary">글쓰기</button>
	  <button type="button" class="btn btn-default" onclick="bisup/bisup/notice/nlist_m.do">취소</button>
	  </div>
	  </div>
	</form>
	</div>
	</div>
	<br>
</body>
</html>