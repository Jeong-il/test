<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.dbconnection.DBUtil"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	String user_id = request.getParameter("user_id");
	String pw = request.getParameter("pw");
	
	// 이걸 보안상 걸리겠죠
	
	/* 암호화 ---> 단순! 
	가입시
	오라클에서 암호화를 해서 저장을 하고
	로그인시
	오라클에서 암호화 된 값은 복후화해서 맞는지 확인을 하면 되겠쬬? */
			
	
	Connection conn = DBUtil.getMySQLConnection();

	String sql = "select * from member where user_id = ? and pw = ?";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	try {
		pstmt.setString(1, user_id);
		pstmt.setString(2, pw);
		ResultSet rs = pstmt.executeQuery();

		Boolean isLogin = false;
		while (rs.next()) {
			isLogin = true;
		}

		DBUtil.close(rs);
		DBUtil.close(pstmt);
		DBUtil.close(conn);

		if (isLogin) {
			session.setAttribute("user_id", user_id);
// 			session.setAttribute("pw", pw);
			response.sendRedirect("main.jsp");
		} else {

		}

	} catch (Exception e) {
		out.print("Exception Error : ");
		out.print(e.toString());
	}
%>