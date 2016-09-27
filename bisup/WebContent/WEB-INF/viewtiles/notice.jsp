<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>notice</title>
<style type="text/css">
.notice{
  min-height: 1px;
  padding-right: 15px;
  padding-left: 15px;
  width: 1200px;
	margin: auto;
}
</style>
</head>

<body>
<div class="notice">
<br><br>
 <h2 style="font-weight: 700; font-size: 36px; margin: 0; padding: 0;">공지사항</h2>
  	<p style="display: block;">고객의 성공을 돕는 비즈업(BisUp)이 되겠습니다.</p>
	<br>
		<div class="panel panel-default">
			<div class="panel-body">
				<table class="table table-condensed" style="border-collapse: collapse;">
					<thead>
						<tr>
							<th> </th>
							<th>번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr data-toggle="collapse" data-target="#demo1"	class="accordion-toggle">
							<td><button class="btn btn-default btn-xs">
								<span class="glyphicon glyphicon-eye-open"></span>
								</button></td>
							<td>1</td>
							<td>미래</td>
							<td>첫번째 공지사항 입니다.</td>
							<td>21</td>
							<td>2016-09-27</td>
						</tr>
						<tr>
							<td colspan="12" class="hiddenRow"><div class="accordian-body collapse" id="demo1">내용</div></td>
						</tr>
						<tr data-toggle="collapse" data-target="#demo2" class="accordion-toggle">
            			<td><button class="btn btn-default btn-xs">
            				<span class="glyphicon glyphicon-eye-open"></span>
            				</button>
            			</td>
							<td>2</td>
							<td>테스트</td>
							<td>두번째 공지사항 입니다.</td>
							<td>10</td>
							<td>2016-09-27</td>
						</tr>
						<tr>
							<td colspan="6" class="hiddenRow">
								<div id="demo2" class="accordian-body collapse">공지사항 내용 부분 입니다.</div>
							</td>
						</tr>
						<tr data-toggle="collapse" data-target="#demo3"	class="accordion-toggle">
							<td><button class="btn btn-default btn-xs">
									<span class="glyphicon glyphicon-eye-open"></span>
								</button>
							</td>
							<td>3</td>
							<td>관리자</td>
							<td>세번째 공지사항 입니다.</td>
							<td>11</td>
							<td>2016-09-27</td>
						</tr>
						<tr>
							<td colspan="6" class="hiddenRow">
								<div id="demo3"	class="accordian-body collapse">이곳에 내용이 입력됩니다.</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		</div>
	<br>
</body>
</html>