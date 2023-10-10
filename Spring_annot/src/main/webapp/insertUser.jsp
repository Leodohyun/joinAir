<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 폼 페이지</title>
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
        <h1>회원가입</h1>
        <form name="userForm" method="POST" action="insertUser.do">
            <table border="1" cellspacing="0" cellpadding="0">
                <tr>
                    <td bgcolor="pink" width="70">아이디</td>
                    <td align="left"><input type="text" name="user_Id"/></td>
                </tr>
                <tr>
                    <td bgcolor="pink">비밀번호</td>
                    <td align="left"><input type="password" name="user_Password"/></td>
                </tr>
                <tr>
                    <td bgcolor="pink">이름</td>
                    <td align="left"><input type="text" name="user_Name"/></td>
                </tr>
                <tr>
                    <td bgcolor="pink">이메일</td>
                    <td align="left"><input type="text" name="user_Email"/></td> <!-- 추가: 이메일 입력란 -->
                </tr>
                <tr>
                    <td bgcolor="pink">주소</td>
                    <td align="left"><input type="text" name="user_Address"/></td> <!-- 추가: 주소 입력란 -->
                </tr>
                <tr>
                    <td bgcolor="pink">폰번호</td>
                    <td align="left"><input type="text" name="user_Phone"/></td> <!-- 추가: 폰번호 입력란 -->
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="회원가입"/>&nbsp;&nbsp;&nbsp;
                        <input type="reset" value="다시쓰기"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
