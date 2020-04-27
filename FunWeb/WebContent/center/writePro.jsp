<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
// center/writePro.jsp
// //한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
int readcount =0; //조회수
Timestamp date=new Timestamp(System.currentTimeMillis());
//BoardBean bb 객체생성
BoardBean bb=new BoardBean();
// 자바빈 멤버변수 <= 파라미터값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
// BoardDAO bdao 객체생성
// insertBoard(자바빈 주소) 메서드호출
BoardDAO bdao=new BoardDAO();
bdao.insertBoard(bb);
// notice.jsp 이동
response.sendRedirect("notice.jsp");
%>
</body>
</html>






