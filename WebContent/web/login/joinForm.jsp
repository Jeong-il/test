<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="web/login/joinProc.jsp" method="post">

<table border="1" align="center">
<tr><th colspan="2">회원가입</th></tr>
<tr>
	<td>아이디</td>
	<td><input type="text" name="user_id"/></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pw"></td>
</tr>
<tr>
	<td>이름</td>
	<td><input type="text" name="name"/></td>
</tr>
<tr>
	<td>E-Mail</td>
	<td><input type="text" name="e_mail1"/>@<input type="text" name="e_mail2">
	<!-- <select name="email">
		<option value="naver.com">naver.com</option>
		<option value="hanmail.com"/>hanmail.com</option>
		<option value="google.com"/>google.com</option>
		<option value="nate.com"/>nate.com</option>
		<option value="daum.net"/>daum.net</option>
		<option value=""/>직접입력</option>
	</select> -->
	</td>
</tr>

<tr>
	<td>핸드폰</td>
	<td><input type="text" name="phone1"/>
	  - <input type="text" name="phone2">
	  - <input type="text" name="phone3">
	</td>
</tr>

<tr>
<td colspan="3" align="center">
<input type="submit" value="확인">      
<input type="button" value="취소" onclick="window.location.href='index.jsp'">
</td>
</tr>

</table>
</form>
</body>
</html>