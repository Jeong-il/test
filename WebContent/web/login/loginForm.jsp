<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<script type="text/javascript">

//스칼라법
function Login(){
	//validation 체크!
	
	var input_id = document.getElementsByName("user_id")[0].value
	var input_pw = document.getElementsByName("pw")[0].value
	
	if(input_id.length <= 8){
		alert("아이디를 입력 해주세요.");
		document.getElementsByName("user_id")[0].focus();
		return false;
	}
	if(input_pw.length <= 8){
		alert("비밀번호를 입력 해주세요.");
		document.getElementsByName("pw")[0].focus();
		return false;
	}
}
</script>
</head>
<body>
<%
if(session.getAttribute("sessionId") == null) {
%>

<center>
<br/><br/><br/>
<h1>로그인 화면</h1>
<br/>

<form action="web/login/loginProc.jsp" method="post">
	ID : <input type="text" name="user_id"/> <br/><br/>
	PW : <input type="password" name="pw"/> <br/><br/>
	<input type="button" value="로그인" onclick="Login();"/>
	<input type="button" value="ID / PW 찾기" onClick="location.href='web/login/findIdPw.jsp'"/>	
	<input type="button" value="회원가입" onClick="location.href='web/login/joinForm.jsp'"/>
</form>

</center>

<%} else { %>
<center>
<h2>Welcome back, <%= session.getAttribute("sessionId") %></h2>
<input type="text" value="로그아웃" onclick="location.href='web/login/logout.jsp'">
</center>
<% } %>
</body>
</html>