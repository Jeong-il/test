<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="model.dbconnection.DBUtil"%>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = request.getParameter("user_id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String e_mail1 = request.getParameter("e_mail1");
	String e_mail2 = request.getParameter("e_mail2");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");

	Connection conn = DBUtil.getMySQLConnection();

	String sql = "insert into member(seq, user_id, pw, name, e_mail1, e_mail2, phone1, phone2, phone3, create_time) values(member_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try {
		pstmt.setString(1, user_id);
		pstmt.setString(2, pw);
		pstmt.setString(3, name);
		pstmt.setString(4, e_mail1);
		pstmt.setString(5, e_mail2);
		pstmt.setString(6, phone1);
		pstmt.setString(7, phone2);
		pstmt.setString(8, phone3);
		
		// 실제 PreparedStatement 실행 문!
		pstmt.execute();
		
		/*
		
			1. 정상적으로 등록이 됬어요?
			2. 기존에 PK 중첩되서 안될경우.!
			
		*/
		
		

		response.sendRedirect("main.jsp");

		// 죽은코드겠죠~  
		/*
			자원이 계속 할당 되어있겠죠.
			db pool  <- db 접속할수있는 통로의 개수 , n++  
			자원이 할당이 되어도 어느 일정 시간이되면 끈어집니다. 확실하지 안지만 약 5분~10분? 
			사용자가 많을경우는 아마
			안되겠죠, 어디서부터? DB엑세스 하는 모든 부분에서 안될꺼에요
		*/
		DBUtil.close(pstmt);
		DBUtil.close(conn);
	} catch (Exception e) {
		
		//실재 >?????? 이유로 인하여 가입에 실패 하였습니다.   ex) 회원 가입에 실패 하였습니다. ex)비밀번호 조합이 맞지 안거나, 필수항목이 누락 되었습니다. 파라미터 변조가 발생하였습니다. 다시 확인하고 신청하여주시기 바랍니다.
		out.print("Exception Error : ");
		out.print(e.toString());
	}
%>