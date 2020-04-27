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

<form>

<%
// 세션값이 없으면  loginForm.jsp 이동 
// 세션값이 "admin"이 아니면 
//  loginForm.jsp 이동 
if(id==null){
// 	loginForm.jsp 이동 
	response.sendRedirect("login.jsp");
}else{
	//세션값이 있으면
	if(!id.equals("admin")){
// 		loginForm.jsp 이동 
		response.sendRedirect("login.jsp");
	}
}

//MemberDAO 객체생성
MemberDAO mdao=new MemberDAO();
// 배열 자바API  List 인터페이스 => 상속  ArrayList 클래스
//             여러개 기억장소에 모든형을 저장
//              처음 10개 기억장소 만들어지고 값 추가가 되어지면 10개씩 기억장소 추가
// List memberList =    getMemberList() 호출
List memberList=mdao.getMemberList();
%>
<fieldset>
<table border="1">
<tr>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
<td>가입날짜</td>
<td>이메일</td>
<td>전화번호</td>
<td>폰번호</td>
<td>우편번호</td>
<td>주소</td>
<td>주소1</td>
<td>주소2</td>
</tr>

<%
// 배열 크기 memberList.size()
for(int i=0;i<memberList.size();i++){
	// 한칸의 정보 가져오기 
	MemberBean mb=(MemberBean)memberList.get(i);
	%><tr><td><%=mb.getId() %></td>
	  <td><%=mb.getPass() %></td>
	  <td><%=mb.getName() %></td>
	  <td><%=mb.getReg_date() %></td>
	  <td><%=mb.getEmail() %></td>
	  <td><%=mb.getPhone() %></td>
	  <td><%=mb.getMobile() %></td>
	  <td><%=mb.getPostcode() %></td>
	  <td><%=mb.getAddress() %></td>
	  <td><%=mb.getAddress1() %></td>
	  <td><%=mb.getAddress2() %></td>
	  </tr><%
}
%>

</table>
</fieldset>
</form>

<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>