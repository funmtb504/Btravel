<%@page import="event.EventDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
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
//Timestamp t = new Timestamp(System.currentTimeMillis()/1000/60/60/24*day);
Timestamp t = new Timestamp(System.currentTimeMillis());

EventDAO edao = new EventDAO();

edao.setDate(t, 1);

%>
</body>
</html>