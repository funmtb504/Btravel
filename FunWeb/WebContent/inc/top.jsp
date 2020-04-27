<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
// String id = (String)세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값 없으면  login join
//      있으면 ..님  logout
if(id==null){
	%><div id="login"><a href="../member/login.jsp">login</a> | <a href="../member/join.jsp">join</a></div><%
}else{
	%><div id="login"><%=id %>님 | <a href="../member/logout.jsp">logout</a> | 회원정보수정</div><%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.jsp">HOME</a></li>
	<li><a href="../company/welcome.jsp">COMPANY</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>    
