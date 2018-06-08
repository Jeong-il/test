package model.dbconnection;

import java.sql.*;

public class DBUtil {

	public static Connection getMySQLConnection() {

		Connection conn = null;
		
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.10.7:1521:orcl";
		String dbId = "mcstuser";
		String dbPw = "mcst5800T";
		conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch (Exception e) {
			System.out.print("Exception Error : ");
			System.out.print(e.toString());
		}
		return conn;	
	}
	public static void close(Connection conn) {	
		try { if(conn != null) conn.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	
	public static void close(Statement stmt) {	
		try { if(stmt != null) stmt.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	
	public static void close(PreparedStatement pstmt) {	
		try { if(pstmt != null) pstmt.close(); } catch(Exception e) { e.printStackTrace(); }
	}
	
	public static void close(ResultSet rs) {	
		try { if(rs != null) rs.close(); } catch(Exception e) { e.printStackTrace(); }

	}
}
