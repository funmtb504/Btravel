<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="event.EventDAO"%>
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
String day = request.getParameter("day");
day = day + " 00:00:00";

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

sdf.parse(day);
// Timestamp t = new Timestamp(System.currentTimeMillis()/1000/60/60/24*day);
// Timestamp t2 = new Timestamp(System.currentTimeMillis());

Calendar cal = sdf.getCalendar();

// cal.setTimeInMillis(t.getTime());
// cal.add(Calendar.SECOND, day);
Timestamp t = new Timestamp(cal.getTime().getTime());
EventDAO edao = new EventDAO();

edao.setDate(t, 1);

%>
</body>
</html>