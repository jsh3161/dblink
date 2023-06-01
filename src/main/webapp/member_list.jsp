<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 리스트</h2><br>
	
	<%
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspdb";
		String dbID = "root";
		String dbPW = "12345";
		
		String sql = "SELECT * FROM members";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		

		
		
		try {
			Class.forName(dbDriver);
	
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				String mid = rs.getString("id");
				String mpw = rs.getString("passwd");
				String memail = rs.getString("email");
				String msigntime = rs.getString("signuptime");
				
				out.println(mid + "/" + mpw + "/" + memail + "/" + msigntime +"<br>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("오류발생");
		} finally {
		
			rs.close();
			stmt.close();
			conn.close();
		}
	%>
</body>
</html>