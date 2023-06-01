<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
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
	<%
		request.setCharacterEncoding("utf-8");
	
		String userid = request.getParameter("userID");

		
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL =  "jdbc:mysql://localhost:3306/jspdb";
		String dbID = "root";
		String dbPW = "12345";
		
		String sql = "DELETE FROM members WHERE id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;

		int successFlag=0;
		
		
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPW);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			successFlag = pstmt.executeUpdate();
			
			if (successFlag == 1){
				out.println("삭제 성공");
			} else {
				out.println("삭제 실패");
			}
		} catch(Exception e){
			e.printStackTrace();
			out.println("에러 발생");
		} finally {
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>