<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ok() {
	// join.jsp(opener) id 상자  <= join_win.jsp  wid 상자안에 값 저정
		opener.document.fr.id.value=document.wfr.wid.value;
	// 창닫기
		window.close();
	}
</script>
</head>
<body>
<h1>join_win.jsp</h1>
<%
String wid=request.getParameter("wid");
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// int check = idCheck(wid)
int check=mdao.idCheck(wid);
// check==1  아이디있음  out.println "아이디중복"
// check==0  아이디없음  out.println "아이디 사용가능"
if(check==1){
	out.println("아이디중복");
}else{
	out.println("아이디 사용가능");
	%>
	<input type="button" value="아이디사용" onclick="ok()">
	<%
}
%>
<form action="join_win.jsp" method="post" name="wfr">
아이디 : <input type="text" name="wid" value="<%=wid%>">
<input type="submit" value="아이디 찾기">  
</form>
</body>
</html>







