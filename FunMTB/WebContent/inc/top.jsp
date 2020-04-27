<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// String id = (String)세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값 없으면  login join
//      있으면 ..님  logout
if(id==null){
	%><div id="login"><a href="../member/login.jsp">log-in(로그인)</a> | <a href="../member/join.jsp">join(회원가입)</a> | <a href="../member/contactForm.jsp">
	Contact Us(문의메일 발송)</a> | <a href="../map/map.jsp">Map(지도)</a></div><%
}else{
	%><div id="login"><%=id %>님 | <a href="../member/logout.jsp">log-out</a>
	 | <a href="../member/myinfo.jsp">My Page(마이페이지)</a> | 
	<a href="../member/contactForm.jsp">Contact Us(문의메일 발송)</a> | <a href="../map/map.jsp">Map(지도)</a></div><%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><a href="../main/main.jsp">
<img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></a></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">Home</a></li>
	<li><a href="../board/list.jsp">Free Board(게시판)</a></li>
	<li><a href="../fboard/list.jsp">File Center(자료실)</a></li>
	<li><a href="../gboard/list.jsp">Photo Gallary(갤러리)</a></li>
</ul>
</nav>
</header>    
