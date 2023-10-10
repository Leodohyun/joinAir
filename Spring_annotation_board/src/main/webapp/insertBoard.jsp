<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style>
	#div_box {
		position: absolute;
		top:10%;
		left:40%;
	}
</style>
</head>
<body>
	<div id="div_box">
		<h1> 새 게시글 등록</h1>
		<a href="logout.do">로그아웃</a>
		<hr>
		<form name="insertForm" method="POST" action="insertBoard.do">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="pink" width="70">제목</td>
					<td align="left"><input type="text" name="title"></td>
				</tr>	
				<tr>
					<td bgcolor="pink">작성자</td>
					<td align="left"><input type="text" name="writer"></td>
				</tr>		
				<tr>
					<td bgcolor="pink">내용</td>
					<td align="left">
						<textarea rows="10" cols="40" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="게시글 등록"/>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getBoardList.do">전체 게시글 목록 보기</a>
	</div>
</body>
</html>