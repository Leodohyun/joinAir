<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!-- 추가 -->
<jsp:useBean id ="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러를 처리할 페이지 => error_page.jsp</title>
</head>

<body>
	<div>
		<h2>에러를 담당하는 페이지</h2>
		<hr>
		<table>
			<tr width = 100% bgcolor="pink">
			<td>웹 프로그램에서 에러 발생함!!!<br> 빠른 시일내로 복구하자!!
			</td>
			</tr>
			<tr>
				${now}
				<p>	요청실패 URI : ${pageContext.errorData.requestURI}<br> 상태코드 :
					${pageContext.errorData.statusCode}<br> 예외유형 :
					${pageContext.errorData.throwable}
			</tr>
		</table>
	</div>
</body>
</html>