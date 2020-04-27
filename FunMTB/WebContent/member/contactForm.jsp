<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join page</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
<style>
	table{
		width : 450px;
		margin : auto;
	}
	h1{
		text-align: center;
	}
	td{
		border : 1px dotted gray;
	}
</style>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<jsp:include page="../inc/sub_menu_member.jsp"/>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<article>
<%
String id=(String)session.getAttribute("id");
String eMail="Visitor@noMember";

MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);
if(mb.getEmail()!=null)
{eMail=mb.getEmail();}

%>
<form action="mailSend.jsp" method="post">
<h1>문의 메일 발송</h1>
<table>
	<tr><td>보내는 사람 메일 : </td><td><input type="text" name="sender"
	value="<%=eMail%>"></td></tr>
	<input type="hidden" name="receiver" value="funmtb504@gmail.com">
	<tr><td>제목 : </td><td><input type="text" name="subject"></td></tr>
	<tr>
		<td>내용 : </td>
		<td><textarea name="content" cols=40 rows=20></textarea></td>
	</tr>
	<tr><td align=center colspan=2><input type="submit" value="보내기"></td></tr>
</table>
</form>


</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>