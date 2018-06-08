<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<%
if(session.getAttribute("sessionId") == null) {
%>

<center>
<br/><br/><br/>
<h1>로그인 화면</h1>
<br/>

<form action="loginProc.jsp" method="post">
	ID : <input type="text" name="user_id"/> <br/><br/>
	PW : <input type="password" name="pw"/> <br/><br/>
	<input type="submit" value="로그인"/>
	<input type="button" value="ID / PW 찾기" onClick="window.location.href='findIdPw.jsp'"/>	
	<input type="button" value="회원가입" onClick="window.location.href='joinForm.jsp'"/>
</form>

</center>

<%} else { %>
<center>
<h2>Welcome back, <%= session.getAttribute("sessionId") %></h2>
<input type="text" value="로그아웃" onclick="window.location.href='logout.jsp'">
</center>
<% } %>
</body>
</html>