<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기 페이지</title>
<style>
#div_box {
			position: absolute;
			top: 10%;
			left: 40%;
			height: 100vh;
		}
</style>
</head>
<body>
	<div id="div_box">
		<h1>게시글 상세보기</h1>
		<a href="logout.do">로그아웃</a>
		<hr>
		<form name="boardgetForm" method="POST" action="updateBoard.do">
			<input name="seq" type="hidden" value="${board.seq}"/>
			<table board="1" cellpascing="0" cellpading="0">
				<tr>
					<td bgcolor="pink" width="70">제목</td>
					<td align="left">
						<input type="text" name="title" value="${board.title}"/><!-- 수정 할 것 -->
					</td>
				</tr>
				<tr>
					<td bgcolor="pink">작성자</td>
					<td align="left">${board.writer}</td> <!-- 수정 안 할 것 -->
				</tr>
				<tr>
					<td bgcolor="pink">내용</td>
					<td align="left">
						<textarea name="content" rows="10" cols="40">${board.content}</textarea>
					</td>
				</tr>
				<tr>
					<td bgcolor="pink">등록일시</td>
					<td align="left">${board.regdate}</td>
				</tr>
				<tr>
					<td bgcolor="pink">조회수</td>
					<td align="left">${board.cnt}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="게시글 수정"/>					
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="insertBoard.jsp">게시글 등록</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do?seq=${board.seq}">게시글 삭제</a>&nbsp;
		<a href="getBoardList.do">전체 게시글 목록 보기</a>
	</div>
</body>
</html>