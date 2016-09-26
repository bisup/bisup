<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>
<br><br>
	<div class="container">
	  <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">궁금합니다</h2>
  	<p style="display: block;">궁금한 사항을 남기시면 인터넷으로 상담(답변)해 드립니다.</p>
	<br>
	<form>
	<fieldset>
	  <div class="form-group">
	    <label for="exampleInputEmail1">글 제목</label>
	    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="제목을 입력하세요.">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">작성자</label>
	    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="닉네임을 입력하세요.">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1">글 내용</label>
	    <textarea class="form-control" rows="5" id="comment" placeholder="작성할 내용을 입력하세요."></textarea>
	  </div>
	  </fieldset>
	  
	  
	  <button type="submit" class="btn btn-primary">글쓰기</button>
	  <button type="button" class="btn btn-default">취소</button>
	  
	</form>
	</div>
	<br>
</body>
</html>