<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- member/logout.jsp  -->
<%
// 세션값 초기화(전체삭제)
session.invalidate();
//  main.jsp 이동
response.sendRedirect("../main/main.jsp");
%>
</body>
</html>










