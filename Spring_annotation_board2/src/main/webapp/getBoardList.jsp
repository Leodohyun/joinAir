<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>

<!-- 추가 -->
<%@ page import="com.company.spring_annotation.board.BoardDO" %> 
<%@ page import="com.company.spring_annotation.board.BoardDAO" %> 
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"  %>

<%
	String searchCondition = null;
	String searchKeyword = null;
	
	// 검색 조전과 검색어가 요청 파라미터로 
	if(request.getParameter("searchCondition") != null &&
			request.getParameter("searchKeyword") != null) {
		// 요청 파라미터에서 검색 조건과 검색어를 가져와 변수에 저장
		searchCondition = request.getParameter("searchCondition");
		searchKeyword = request.getParameter("searchKeyword");
	}
	BoardDAO boardDAO = new BoardDAO();
	// BoardDAO에서 게시글 목록을 가져오는 메소드 호출
	List<BoardDO> boardList = boardDAO.getBoardList(searchCondition, searchKeyword);
	// 게시글 목록을 JSP페이지 전달하기 위해  request 속성에 저장
	request.setAttribute("boardList", boardList);
	
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기 페이지</title>
<style>
#div_box{
		position:absolute;
		top:10%;
		left:20%;
		height: 100vh;
	}
</style>
</head>
<body>
	<div id="div_box">
		<h1>게시글 목록</h1>
		<hr>
		<h3>${userName}님 환영합니다.</h3>
		<p>총 게시글: ${boardList.size()}건</p>
		<form name="listForm" method="POST" action="getBoardList.do">
			<table border="1" cellspacing="0" cellpadding="0" width="700">
				<tr>
					<td align="right"><select name="searchCondition">
					    	<option value="TITLE">제목</option>
                     		<option value="WRITER">작성자</option>
					</select><input name="searchKeyword" type="text"/> <input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="blue" width="100">번호</th>
				<th bgcolor="blue" width="200">제목</th>
				<th bgcolor="blue" width="150">작성자</th>
				<th bgcolor="blue" width="150">작성일시</th>
				<th bgcolor="blue" width="100">조회수</th>
			</tr>
			<c:forEach var="board" items="${boardList}">
				<tr>
					<td align="center">${board.seq}</td>
					<td align="left"><a href="getBoard.do?seq=${board.seq}">${board.title}</a></td>	
					<td align="center">${board.writer}</td>					
					<td align="center">${board.regdate}</td>					
					<td align="center">${board.cnt}</td>					
				</tr>
			</c:forEach>
		</table>
		<br>
		<a href="insertBoard.jsp">새 게시글 등록</a> &nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do">전체 게시글 목록 보기</a> 
		
	</div>

</body>
</html>