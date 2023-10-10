<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
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
        <h1 align="center">로그인</h1>
        <hr>
        <%-- 로그인 실패 시 에러 메시지를 표시하는 부분 --%>
        <% String errorMessage = (String)request.getAttribute("errorMessage"); %>
        <% if(errorMessage != null && !errorMessage.isEmpty()) { %>
            <div style="color: red; text-align: center;"><%= errorMessage %></div>
        <% } %>

        <form name="loginForm" method="POST" action="${pageContext.request.contextPath}/login.do">
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <td bgcolor="skyblue">아이디</td>
                    <td><input type="text" name="user_Id"/></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">비밀번호</td>
                    <td><input type="password" name="user_Password"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="로그인"/>
                    </td>
                </tr>
            </table>
        </form>
        <br>
        <div>
            <span><a href="insertUser.jsp">회원가입</a></span>
        </div>
    </div>
</body>
</html>
