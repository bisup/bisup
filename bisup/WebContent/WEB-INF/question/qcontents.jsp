<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
        <style type="text/css">
        @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
        
        </style>
    </head>
    <body>
        <div class="container">
        <br><br>
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">궁금합니다</h2>
  	<p style="display: block;">궁금한 사항을 남기시면 인터넷으로 상담(답변)해 드립니다.</p>  <br><br>
            <div class="row">
                <div class="col-md-10">
                    <form action="qupdate.do" method="post">
                    <table class="table table-condensed">
                        <thead>
                            <tr align="center">
                                <th width="10%">제목</th>
                                <th width="60%">${boardCommand.title }</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>작성자</td>
                                <td>${boardCommand.writer } <span style='float:right'>조회 : ${boardCommand.cnt }</span></td>
                            </tr>
                            <tr>
                                <td>작성일</td>
                                <td>${boardCommand.reg}</td>
                            </tr>
                            <tr>
                                <td colspan="2"><p>${boardCommand.contents }</p></td>
                            </tr>
                        </tbody>
                    </table>
                    <hr>
                    <c:forEach items="${commantli}" var="comm">
                    <table  class="table table-condensed">
                     <tr id="r1" name="commentParentCode">
                    <td colspan=2><strong>${comm.rwriter}</strong>&nbsp;&nbsp; ${comm.rreg } | <a style="cursor:pointer;" name="pDel" onclick="rdel(${comm.rpw },${comm.qnum })">삭제</a><p>
                    ${comm.rcontents}</p></td></tr>
                   </table> </c:forEach>
                    <table id="commentTable" class="table table-condensed"></table>
                    <table class="table table-condensed">
                        <tr>
                            <td>
                            <span class="form-inline" role="form">
                            <p>
                            <div class="form-group">
                           	 	<input type="text" id="commentParentName" name="rwriter"  class="form-control col-lg-2" placeholder="이름" value="${sessionScope.nick}" readonly="readonly">
                           		<button type="button" id="commentParentSubmit" name="commentParentSubmit" class="btn btn-default">확인</button>
                            <textarea id="commentParentText" class="form-control col-lg-12" style="width:100%" rows="4" name="rcontents" ></textarea>
                            </div>
                            </p>
                            
                            </span>
                            </td>
                        </tr>
                    </table>
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <td>
                                    <span style='float:right'>
                                        <button type="button"  class="btn btn-default" onclick="javascript:location='/bisup/bisup/question/qlist.do'">목록</button>
                                        <input type="hidden" name="num" value="${boardCommand.num }"/>
                                        <input type="hidden" name="title" value="${boardCommand.title }"/>
                                        <input type="hidden" name="writer" value="${boardCommand.writer }"/>
                                        <input type="hidden" name="cnt" value="${boardCommand.cnt }"/>
                                         <input type="hidden" name="contents" value="${boardCommand.contents }"/>
                                         <input type="hidden" name="pw" value="${boardCommand.pw }" />
                                        <button type="submit"  class="btn btn-default" onclick="javascript:location='/bisup/bisup/question/qupdate.do'">수정</button>
                                        <button type="button"  class="btn btn-default" data-toggle="modal" data-target="#login-modal">삭제</button>
                                        <button type="button"  class="btn btn-default" onclick="javascript:location='/bisup/bisup/question/qwrite.do'">글쓰기</button>
                                  		
                                    </span>
                                </td>
                            </tr>
                        </thead>
                    </table>
                    </form>
                    <script>
    $(function(){
                               
              $("#commentParentSubmit").click(function( event ) {
                                    //ajax로 저장하고 성공하면 저장한 데이터를 가져와 넣어야 하는데 여기서는 테스트라 그냥 입력값을 가져옴
                                var pName = $("#commentParentName");
                                var pPassword = $("#commentParentPassword");//패스워드를 노출 시켰는데 저장하고 나서 저장한 날짜를 보여줄 예정
                                var pText = $("#commentParentText");
                                   
                                if($.trim(pName.val())==""){
                                    alert("이름을 입력하세요.");
                                    pName.focus();
                                    return;
                                }else if($.trim(pText.val())==""){
                                    alert("내용을 입력하세요.");
                                    pText.focus();
                                    return;
                                }
                                var num=$('#num').val();
                               
                                var url ="/bisup/bisup/question/indel.do?num="+num+"&rwriter="+pName.val()+"&rcontents="+pText.val(); 
                                $.ajax({
                                	type:"get",
                                	url:url,
                                	dataType:"json",
								success:function(data){
									//var b=Number(1);
									//var i=parseInt(args.x);
								/* 	args.x.typeofValue */
									if(data.x = 0 ){
										alert("댓글 달기 실패");

									}else{
										alert("댓글 달기 완료");
										window.location.reload();
										}
								}
                                });  
              });
                                   
                              /*   var commentParentText = '<tr id="r1" name="commentParentCode">'+
                                                            '<td colspan=2>'+
                                                                '<strong>'+pName.val()+'</strong> '+sysdate+' <a style="cursor:pointer;" name="pAdd">답글</a> | <a style="cursor:pointer;" name="pDel">삭제</a><p>'+pText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>'; */
                                   
                                //테이블의 tr자식이 있으면 tr 뒤에 붙인다. 없으면 테이블 안에 tr을 붙인다.
                                if($('#commentTable').contents().size()==0){
                                    $('#commentTable').append(commentParentText);
                                }else{
                                    $('#commentTable tr:last').after(commentParentText);
                                }
                                   
                                $("#commentParentName").val("${sessionScope.nick}");
                               // $("#commentParentPassword").val("");
                                $("#commentParentText").val("");
                                   
                            });
                               
                            //댓글의 댓글을 다는 이벤트
                          /*   $(document).on("click","#commentChildSubmit", function(){
                                   
                                var cName = $("#commentChildName");
                                var cText = $("#commentChildText");
                                   
                                if($.trim(cName.val())==""){
                                    alert("이름을 입력하세요.");
                                    cName.focus();
                                    return;
                                }else if($.trim(cText.val())==""){
                                    alert("내용을 입력하세요.");
                                    cText.focus();
                                    return;
                                }
                                   
                                var commentChildText = '<tr name="commentChildCode">'+
                                                            '<td style="width:1%"><span class="glyphicon glyphicon-arrow-right"></span></td>'+
                                                            '<td style="width:99%">'+
                                                                '<strong>'+cName.val()+'</strong> | <a style="cursor:pointer;" name="cDel">삭제</a>'+
                                                                '<p>'+cText.val().replace(/\n/g, "<br>")+'</p>'+
                                                            '</td>'+
                                                        '</tr>'; */
                                                           
                         /*        //앞의 tr노드 찾기
                                var prevTr = $(this).parent().parent().parent().parent().prev();
                                //댓글 적는 에디터 삭제
                                $("#commentEditor").remove();//여기에서 삭제를 해줘야 에디터tr을 안 찾는다.
                                   
                                //댓글을 타고 올라가며 부모 tr을 찾음
                                while(prevTr.attr("name")!="commentParentCode"){
                                    prevTr = prevTr.prev();
                                }
                                //while를 타는지 체크
                                var check = false;
                                //다음 노드가 댓글(depth1)의 댓글인지 찾기위해 next
                                var nextTr = prevTr.next();
                                //뒤에 댓글(depth1)의 댓글(depth2_1)이 없다면 바로 붙인다.
                                if(nextTr.attr("name")!="commentChildCode"){
                                    prevTr.after(commentChildText);
                                }else{
                                    //댓글(depth1)의 댓글(depth2_n)이 있는경우 마지막까지 찾는다.
                                    while(nextTr.attr("name")=="commentChildCode"){
                                        nextTr = nextTr.next();
                                        check = true;
                                    }
                                }
                                   
                                if(check){//댓글(depth1)의 댓글(depth2_n)이 있다면 그 댓글(depth2_n) 뒤에 댓글(depth2_n+1) 추가
                                    nextTr = nextTr.prev();//while문에서 검색하느라 next로 넘거갔던거 다시 앞으로 돌려줌
                                    nextTr.after(commentChildText);
                                }
                                   
                            });
                            } */
                          function rdel(rpw,qnum){//동적으로 버튼이 생긴 경우 처리 방식
                                
                                if (confirm("정말 삭제하시겠습니까?") == true){    //확인
                                       
                                    var delComment = $(this).parent().parent();
                                    var nextTr = delComment.next();
                                    var delTr;
                            var url ="/bisup/bisup/question/rdelete.do?num="+qnum+"&rpw="+rpw; 
                            $.ajax({
                            	type:"get",
                            	url:url,
                            	dataType:"json",
							success:function(data){
								alert("##");
								//var b=Number(1);
								//var i=parseInt(args.x);
							/* 	args.x.typeofValue */
								if(data.x = 0 ){
									alert("댓글 삭제");

								}else{
									alert("댓글 삭제 완료");
									window.location.reload();
									}
							}
                            });  
                            }
                                }
                                 
                               
                            //답글링크를 눌렀을때 에디터 창을 뿌려주는 이벤트, 삭제링크를 눌렀을때 해당 댓글을 삭제하는 이벤트
                           
                                /* else{
                                    //자기 부모의 tr을 알아낸다.
                                    var parentElement = $(this).parent().parent();
                                    //댓글달기 창을 없앤다.
                                    $("#commentEditor").remove();
                                    //부모의 하단에 댓글달기 창을 삽입
                                    var commentEditor = '<tr id="commentEditor">'+
                                                            '<td style="width:1%"> </td>'+
                                                            '<td>'+
                                                                '<span class="form-inline" role="form">'+
                                                                    '<p>'+
                                                                        '<div class="form-group">'+
                                                                            '<input type="text" id="commentChildName" name="commentChildName" class="form-control col-lg-2"  value="${sessionScope.nick}">'+
                                                                        '</div>'+
                                                                        '<div class="form-group">'+
                                                                            '<button type="button" id="commentChildSubmit" class="btn btn-default">확인</button>'+
                                                                        '</div>'+
                                                                    '</p>'+
                                                                        '<textarea id="commentChildText" name="commentChildText" class="form-control" style="width:98%" rows="4"></textarea>'+
                                                                '</span>'+
                                                            '</td>'+
                                                        '</tr>';
                                                           
                                    parentElement.after(commentEditor); 
                                }
                                   
                            });
                               
                            /* $( "#list" ).click(function( event ) {
                                location.href='/community/notice';
                            });
                            $( "#modify" ).click(function( event ) {
                                location.href='/community/modify/notice/${community.id}';
                            });
                            $( "#delete" ).click(function( event ) {
                                location.href='/community/delete/notice/${community.id}';
                            });
                            $( "#write" ).click(function( event ) {
                                location.href='/community/notice/edit';
                            }); */ 
                        
                    </script>
                </div>
            </div>
            <hr/>
        </div>    
        
<!-- 삭제 - 모달윈도우 -->
<script>
         window.onload=function(){
          document.getElementById('dform').onsubmit=function(){
           var pass=document.getElementById('pw1').value;
           var passCheck=document.getElementById('pwCheck').value;
           
           if(pass==passCheck){
            alert("삭제하였습니다.");
            document.dform.submit();
       //    document.location.href="/bisup/bisup/question/qdelete.do?num="+${boardCommand.num };
           }else{
            alert("비밀번호가 일치하지 않습니다.");
             return false; 
        }
          }
         }
         
</script>
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h2>삭제 하시겠습니까?</h2><br>
				  <form id="dform" method="get" action="qdelete.do">
					<input type="password" id="pw1" name="pw1" placeholder="비밀번호를 입력하세요." >
					<input type="hidden" id="pwCheck" value="${boardCommand.pw }"/>
					<input type="hidden" name="num" id="num" value="${boardCommand.num }"/>
					<input type="submit" name="delete" class="login loginmodal-submit" value="삭제" >
				  </form>
				</div>
			</div>
		  </div>
        
        
    </body>
</html>