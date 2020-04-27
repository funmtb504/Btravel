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
function fun1() {
	location.replace("updateform.jsp");
}

</script>


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
<h1>등록 정보</h1>
<%
String id=(String)session.getAttribute("id");
MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);

%>
<form action="updatePro.jsp" id="join" name="fr" method="post" onsubmit="return check()">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" id="id" value="<%=mb.getId()%>" readonly> <br>
<label>Name</label>
<input type="text" name="name" value="<%=mb.getName()%>"  readonly><br>
<label>E-Mail</label>
<input type="text" name="email" id="email1" value="<%=mb.getEmail()%>"  readonly><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>우편번호</label><input type="text" id="sample6_postcode" placeholder="<%=mb.getPostcode()%>" name="postcode"  readonly><br>
<label>도로명주소</label><input type="text" id="sample6_address" placeholder="<%=mb.getAddress()%>" name="address"  readonly><br>
<label>상세주소</label><input type="text" id="sample6_detailAddress" placeholder="<%=mb.getAddress1()%>" name="address1"  readonly><br>
<label>참고사항</label><input type="text" id="sample6_extraAddress" placeholder="<%=mb.getAddress2()%>" name="address2"  readonly><br>
<label>Phone Number</label>
<input type="text" name="phone" value="<%=mb.getPhone()%>"  readonly><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value="<%=mb.getMobile()%>"  readonly><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="button" value="정보수정" onclick="fun1()">

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