<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.dbconnection.DBUtil"%>
<%@ page import="java.sql.*"%>
<%
/*
1. requst 로 파라메터를 받아서 
2. DB를 엑세스해서 쿼리를 실행을 하고
3. 조회값이 있을때는 false, 없을경우에응 True
4. 결과값을 return 하면 되겠죠
*/
	
	request.setCharacterEncoding("UTF-8");

	boolean idChk =  false;
 	String user_id = request.getParameter("user_id");
 	
 	System.out.println("user_id : " + user_id);

	Connection conn = DBUtil.getMySQLConnection();
	
	String sql = "select count(*) as cnt from member where user_id = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	
	
	try {
		pstmt.setString(1, user_id);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			idChk = false;
		
		} else {
			idChk = true;
		}
		
		DBUtil.close(rs);
		DBUtil.close(pstmt);
		DBUtil.close(conn);
	} catch(Exception e) {
		
	}
 	
	System.out.println("test : " + idChk);

%>
<%=idChk%>