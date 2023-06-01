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
    String userid = request.getParameter("userID");
    String userpw = request.getParameter("userPW");


    boolean loginSuccess = false;
    if (userid.equals("admin") && userpw.equals("12345")) {
        loginSuccess = true;
    }

    if (loginSuccess) {
        // 로그인 성공 시 admin.jsp로 페이지 이동
        response.sendRedirect("admin.jsp");
    } else {
        // 로그인 실패 시 로그인 페이지로 리다이렉트 또는 오류 메시지 출력 등의 처리를 할 수 있습니다.
        response.sendRedirect("login.jsp");
    }
%>
 
</body>
</html>