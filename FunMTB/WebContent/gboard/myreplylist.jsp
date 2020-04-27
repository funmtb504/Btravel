<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.GboardDAO"%>
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
<%
String id=(String)session.getAttribute("id");
if(id==null){
	response.sendRedirect("../member/login.jsp");}
%>
</head>
<body>
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
<jsp:include page="../inc/sub_menu_gboard.jsp"/>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 게시판 -->
<%
GboardDAO bdao=new GboardDAO();
int count=bdao.getReplyCount(id);
int pageSize=15;
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
if(pageNum.equals("null")){
	pageNum="1";
}
int currentPage=Integer.parseInt(pageNum);
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;
List boardList=bdao.getReplyList(id, startRow, pageSize);%>
<article id = front>
<h2>Photo Gallary (사진 갤러리) - 나의 작성 댓글(클릭시 삭제)</h2>
<table id="notice">
<tr><th class="tno">No.</th>
	<th class="tdate">게시 번호</th>
    <th class="ttitle">게시글 제목</th>
    <th class="ttitle">댓글 작성내용</th>
    <th class="tdate">Date</th></tr>
    <%
    int num=count-(currentPage-1)*pageSize;
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
    for(int i=0;i<boardList.size();i++){
    	BoardBean bb=(BoardBean)boardList.get(i);
    	%>
    <tr onclick="location.href='replyDeleteForm.jsp?num=<%=bb.getNum()%>'"><td><%=i+1 %></td><td><%=bb.getBno() %></td><td class="left"><%=bb.getSubject()%></td>
    <td><%=bb.getRetext() %></td><td><%=sdf.format(bb.getDate()) %></td></tr>
    	<%
    }
    %>
</table>


<div class="clear"></div>
<div id="page_control">
<%
// 전체 페이지수 구하기 
int pageCount= count / pageSize + (count%pageSize==0?0:1);
// 한화면에 보여줄 페이지 개수
int pageBlock=10;
// 한화면에 보여줄 시작페이지 번호 구하기
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 한화면에 보여줄 끝페이지 번호 구하기
int endPage=startPage+pageBlock-1;
//  endPage 10  <=  전체 페이지수 5페이지
if(endPage > pageCount){
	endPage=pageCount;
}
if(startPage>pageBlock){
	%><a href="myreplylist.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
for(int i=startPage ; i<=endPage;i++){
	%><a href="myreplylist.jsp?pageNum=<%=i%>"><%=i %></a><%
}
if(endPage < pageCount){
	%><a href="myreplylist.jsp?pageNum=<%=startPage-pageBlock%>">Next</a><%
}
%>
</div>
</article>
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>