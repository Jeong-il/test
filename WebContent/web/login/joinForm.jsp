<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript">

var id_chk_cnt = 1;

function joinCheck() {
	//validation 체크!
	var pw_arry=[];
	var element = document.getElementsByTagName('input')
	for (var i = 0; i < document.getElementsByTagName('input').length; i++) {
		if (element[i].getAttribute("required") == "required") {
			if (element[i].value == "") {
				alert(element[i].title + "을 입력해 주세요.")
				return false;
			}else{
				if (element[i].name == "user_id" || element[i].name == "pw" || element[i].name == "pw2") {
					if (element[i].value.length < 8) {
						alert(element[i].title + "의 입력값은 최소 8자리 이상입니다.")
						return false;
					}
					if(element[i].name == "pw" || element[i].name == "pw2"){
							pw_arry.push(element[i].value)
						}
					
					if(pw_arry.length == 2)
						if(pw_arry[0] != pw_arry[1]){
							alert("입력하신 비밀번호가 일치하지 않습니다. 확인하여주세요.")
						
							document.joinForm.pw.value='';
							document.joinForm.pw2.value='';
							document.getElementById("pw").focus();
							return false;
						}
					}
				}	
			}			
		}
	
		if(id_chk_cnt > 0) {
		alert("아이디 중복 확인을 확인하여 주세요.");
		return false;
		}
	
	}

function idCheck() {
	
 	var data = new FormData();

	data.append('user_id', document.getElementsByName("user_id")[0].value);

	
	  var xhttp = new XMLHttpRequest();
	  xhttp.open("POST", "idCheckProc.jsp", false);
	 
	  xhttp.send(data); 
		
}
	
	
</script>

<body>
	<form action="web/login/joinProc.jsp" method="post" name="joinForm">

		<table border="1" align="center">
			<tr>
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" id="user_id" title="아이디"
					required="required" maxlength="16" />
					<button type="button" onclick="idCheck();">아이디 중복 체크</button>
					</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id = "pw" title="비밀번호"
					required="required"></td>
			</tr>
			<tr>
				<td>비밀번호 재확인</td>
				<td><input type="password" name="pw2" title="비밀번호 확인"
					required="required"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" title="이름"
					required="required"></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><input type="text" name="e_mail1" />@<input type="text"
					name="e_mail2"> <!-- <select name="email">
		<option value="naver.com">naver.com</option>
		<option value="hanmail.com"/>hanmail.com</option>
		<option value="google.com"/>google.com</option>
		<option value="nate.com"/>nate.com</option>
		<option value="daum.net"/>daum.net</option>
		<option value=""/>직접입력</option>
	</select> --></td>
			</tr>

			<tr>
				<td>핸드폰</td>
				<td><input type="text" name="phone1" /> - <input type="text"
					name="phone2"> - <input type="text" name="phone3">
				</td>
			</tr>

			<tr>
				<td colspan="3" align="center">
					<button type="button" onclick="joinCheck();">확인</button>
					<button type="button" onclick="window.location.href='index.jsp'">취소</button>
				</td>
			</tr>

		</table>
	</form>
</body>
</html>