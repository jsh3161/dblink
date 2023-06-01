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
		String userpw = request.getParameter("userPW");
		String userem = request.getParameter("userEM");
		
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/jspdb";
		String dbID = "root";
		String dbPW = "12345";
		
		String sql = "INSERT INTO members(id, passwd, email) VALUES (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int successFlag = 0;
		
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			pstmt.setString(3, userem);
			
			successFlag = pstmt.executeUpdate();
			
			if (successFlag == 1){
				System.out.println("회원가입 성공");
				response.sendRedirect("signupGood.jsp");
			} else {
				System.out.println("회원가입 실패");
				response.sendRedirect("signup.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
			out.println("에러발생");
		} finally {
			try {
				if (pstmt != null){
					pstmt.close();		
				}
			} catch(Exception e){
				e.printStackTrace();
			}
			
			try {
				if (conn != null){
					conn.close();		
				}
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}
			

	%>

</body>
</html>