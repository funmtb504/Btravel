<%@page import="board.GboardDAO"%>
<%@page import="board.FboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/front.css" rel="stylesheet" type="text/css">

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
<div id="wrap">
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<!-- 메인이미지 들어가는곳 -->
<div class="clear"></div>
<div id="main_img"><img src="../images/main_img.jpg"
 width="971" height="282"></div>
<!-- 메인이미지 들어가는곳 -->
<!-- 메인 콘텐츠 들어가는 곳 -->
<article id="front">
<div class="clear"></div>

<div id="news_notice">
<h3 class="brown">최신 게시판</h3>
<table>
<%
// 1행 5개 가져오기 
//BoardDAO bdao 객체생성  
BoardDAO bdao=new BoardDAO();
// int count = getBoardCount() 호출
int count=bdao.getBoardCount();
// 한화면에 보여줄 가져올 글 개수 설정 
int pageSize=5;
// 현페이지 번호가 없으면 "1"페이지로 설정
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	pageNum="1";
}
// pageNum => 정수형으로 변경
int currentPage=Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행번호 구하기
int startRow=(currentPage-1)*pageSize+1;
//List boardList= getBoardList(startRow,pageSize) 호출
// List boardList=bdao.getBoardList(1, 5);
List boardList=bdao.getBoardList(1, 5);
for(int i=0;i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	%>
	<tr><td class="contxt"><a href="../board/fcontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr>
	<%
}
%>
</table>
</div>
<div id="news_notice">
<h3>최신 자료실</h3>
<table>
<%
// 1행 5개 가져오기 
//BoardDAO bdao 객체생성  
FboardDAO fbdao=new FboardDAO();
// int count = getBoardCount() 호출
count=fbdao.getBoardCount();
// 한화면에 보여줄 가져올 글 개수 설정 

//List boardList= getBoardList(startRow,pageSize) 호출
// List boardList=bdao.getBoardList(1, 5);
boardList=fbdao.getBoardList(1, 5);
for(int i=0;i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	%>
	<tr><td class="contxt"><a href="../fboard/fcontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a></td>
    <td><%=sdf.format(bb.getDate()) %></td></tr>
	<%
}
%>
</table>
</div>
<div id="news_notice">

<h3>최신 갤러리</h3>
<table>
<tr>
<%
// 1행 5개 가져오기 
//BoardDAO bdao 객체생성  
GboardDAO gbdao=new GboardDAO();
// int count = getBoardCount() 호출
count=gbdao.getBoardCount();
// 한화면에 보여줄 가져올 글 개수 설정 

//List boardList= getBoardList(startRow,pageSize) 호출
// List boardList=bdao.getBoardList(1, 5);
boardList=gbdao.getBoardList(1, 6);
for(int i=0;i<boardList.size();i++){
	BoardBean bb=(BoardBean)boardList.get(i);
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
	%>
	<td class="contxt"><a href="../gboard/fcontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
	<img src="../upload/<%=bb.getFile() %>" width="125" height="125"><br><%=bb.getSubject() %>
	</a></td>
    
	<%
}
%>
</tr></table>



</div>


</article>
<!-- 메인 콘텐츠 들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터 들어가는 곳 -->

</body>
</html>