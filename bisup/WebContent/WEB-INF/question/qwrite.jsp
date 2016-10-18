<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
</head>
<body>
<br><br>
	<div class="container">
	  <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">궁금합니다</h2>
  	<p style="display: block;">궁금한 사항을 남기시면 인터넷으로 상담(답변)해 드립니다.</p>
	<br><br>
	<div class="panel panel-default">
	<form action="good.do" method="post">
	<div class="panel-body">
	  <div class="form-group">
	    <label for="exampleInputEmail1">글 제목</label>
	    <input type="text" class="form-control" name="title" placeholder="글 제목을 입력하세요." required autofocus>
	  </div>
	  
		  <div class="form-group">
		    <label for="exampleInputEmail1">작성자</label>
		    <input type="text" class="form-control" name="writer"  value="${sessionScope.nick}" readonly="readonly">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputEmail1">비밀번호</label>
		    <input type="text" class="form-control"  name="pw" placeholder="비밀번호를 입력하세요." required>
		  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1">글 내용</label>
	    <textarea class="form-control" rows="5" id="comment" name="contents" placeholder="작성할 내용을 입력하세요." required></textarea>
	  </div>
	  
	  
	   <!-- @RequestParam 사용 -->
	  <!-- <div class="form-group">
	    <label for="exampleInputPassword1">업로드할 파일 선택</label>
		<input type="file" name="filename" /> <br> 
	  </div>
	  <br> -->
	  
	  <div align="right">
	  <button type="submit" class="btn btn-primary">글쓰기</button>
	  <button type="button" class="btn btn-default" onclick="javascript:location='/bisup/bisup/question/qlist.do'">취소</button>
	  </div>
	  </div>
	</form>
	</div>
	</div>
	<br>
</body>
</html>