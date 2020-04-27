<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String id=(String)session.getAttribute("id");


if(id==null){%>
<ul>
<li><a href="../index.html">Home</a></li>
<li><a href="join.jsp">Join us (회원가입)</a></li>
<li><a href="contactForm.jsp">문의 메일 발송</a></li>
</ul>

<%}else{ %>
<ul>
<li><a href="myinfo.jsp">등록 정보</a></li>
<li><a href="updateform.jsp">등록 정보 수정</a></li>
<li><a href="deleteForm.jsp">회원 정보 삭제(탈퇴)</a></li>
<li><a href="contactForm.jsp">문의 메일 발송</a></li>
<%if(id.equals("admin")){%>
	<li><a href="../member/list.jsp">전체 회원 정보</a></li>
	<%}%>
</ul>

<%}%>