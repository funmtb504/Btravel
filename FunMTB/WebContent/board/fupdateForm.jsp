<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
// 세션값 없으면  member/login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<jsp:include page="../inc/sub_menu_board.jsp"/>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<article>
<%
// pageNum 가져오기
String pageNum=request.getParameter("pageNum");
// num 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO bdao객체생성
BoardDAO bdao=new BoardDAO();
// BoardBean bb= getBoard(num)
BoardBean bb=bdao.getBoard(num);
%>
<h1>Free Board (게시판) - 게시글 수정</h1>
<form action="fupdatePro.jsp?pageNum=<%=pageNum%>" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="<%=num%>">
<table id="notice">
<tr><td class="twrite">글쓴이</td>
    <td><input type="text" name="name" value="<%=bb.getName()%>" readonly></td></tr>
<tr><td class="twrite">비밀번호</td>
    <td><input type="password" name="pass"></td></tr>
<tr><td class="twrite">제목</td>
    <td><input type="text" name="subject" value="<%=bb.getSubject()%>"></td></tr>
<tr><td class="twrite">파일 (제한용량 : 5Mb)</td>
    <td><input type="file" name="file"><%=bb.getFile()%>
    <input type="hidden" name="oldfile" value="<%=bb.getFile()%>">
    </td></tr>    
<tr><td class="twrite">내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=bb.getContent()%></textarea></td></tr>    
</table>
<div id="table_search">
<input type="submit" value="글수정" class="btn">
</div>
</form>
<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>