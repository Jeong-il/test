<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="model.dbconnection.DBUtil" %>

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
	pstmt.execute();
	
	response.sendRedirect("main.jsp");
	
	DBUtil.close(pstmt);
	DBUtil.close(conn);
	} catch(Exception e) {
		out.print("Exception Error : ");
		out.print(e.toString());
	}
%>