<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.dbconnection.DBUtil" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = request.getParameter("user_id");
	String pw = request.getParameter("pw");
	
	Connection conn = DBUtil.getMySQLConnection();
	
	String sql = "select * from member where user_id = ? and pw = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	try {
	pstmt.setString(1, user_id);
	pstmt.setString(2, pw);
	ResultSet rs = pstmt.executeQuery();
	
	Boolean isLogin = false;
	while(rs.next()) {
		isLogin = true;
	}
	
	if(isLogin) {
		session.setAttribute("user_id", user_id);
		session.setAttribute("pw", pw);
		response.sendRedirect("main.jsp");
	} else {
		
	}
	
	DBUtil.close(rs);
	DBUtil.close(pstmt);
	DBUtil.close(conn);
	} catch(Exception e) {
		out.print("Exception Error : ");
		out.print(e.toString());
	}
	
%>