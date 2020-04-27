<%@page import="java.util.List"%>
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

<script type="text/javascript">
function check() {
			
	if(document.fr.pass.value==""){
		alert("비밀번호를 입력하세요");
		document.fr.pass.focus();
		return false;}
				
	if(document.getElementById("pass1").value!=document.getElementById("pass2").value){
		alert("비밀번호 일치여부를 확인하세요 ");
		document.fr.pass.focus();
		return false;}
	
	}

</script>

</head>
<body>
<%
// 세션값 가져오기 
String id=(String)session.getAttribute("id");
%>
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
<jsp:include page="../inc/sub_menu_member.jsp"/>

</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->

<article>
<h1>회원 정보 삭제(탈퇴)</h1>
<%
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);

%>
<form action="deletePro.jsp" id="join" name="fr" method="post" onsubmit="return check()">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" id="id" value="<%=mb.getId()%>" readonly> <br>
<label>Password</label>
<input type="password" name="pass" id="pass1"><br>
<label>Retype Password</label>
<input type="password" name="pass2" id="pass2"><br>

</fieldset>


<div class="clear"></div>
<div id="buttons">
<input type="submit" value="삭제" class="submit">
</div>
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