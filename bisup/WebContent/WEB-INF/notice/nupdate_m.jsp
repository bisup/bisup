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
	<form action="successUp.do" method="post" >
	<div class="panel-body">
	  <div class="form-group">
	    <label for="exampleInputEmail1">글 제목</label>
	    <input type="text" class="form-control" name="title" required autofocus value="${boardCommand.title}">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputEmail1">작성자</label>
	    <input type="text" class="form-control"  name="writer" value="${boardCommand.writer}">
	  </div>
	  
	  <div class="form-group">
	    <label for="exampleInputPassword1">글 내용</label>
	    <textarea class="form-control" rows="5" id="comment" name="contents" required>${boardCommand.contents }</textarea>
	  </div>
	  <input type="hidden" name="cnt" value="${boardCommand.cnt }" disabled>
	  <br>
                                         
	  <div align="right">
	 	<input type="hidden" name="num" value="${boardCommand.num }"/>
        <input type="hidden" name="cnt" value="${boardCommand.cnt }"/>
        <input type="hidden" name="pw" value="${boardCommand.pw }" />
	  <button type="submit" class="btn btn-primary">글쓰기</button>
	  <button type="button" class="btn btn-default" onclick="javascript:location='/bisup/bisup/notice/nlist_m.do'">취소</button>
	  </div>
	  </div>
	</form>
	</div>
	</div>
	<br>
</body>
</html>