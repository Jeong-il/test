<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("sessionId") == null) {
%>

<center>
<br/><br/><br/>
<h1>Welcome!!</h1>
<br/><br/><br/>

<form action="web/login/loginProc.jsp" method="post">
	ID : <input type="text" name="id"/> <br/><br/>
	PW : <input type="password" name="pw"/> <br/><br/>
	<input type="submit" value="�α���"/>
	<input type="button" value="ȸ������" onClick="window.location='signup.jsp'"/>
</form>

</center>

<%} else { %>
<center>
<h2>Welcome back, <%= session.getAttribute("sessionId") %></h2>
<input type="text" value="�α׾ƿ�" onclick="window.location='logout.jsp'">
</center>
<% } %>
</body>
</html>