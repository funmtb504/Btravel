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
<li><a href="../center/notice.jsp">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="../center/fnotice.jsp">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<%
// 패키지 board 파일이름 BoardDAO 
//BoardDAO bdao 객체생성   
BoardDAO bdao=new BoardDAO();
// 게시판 글개수   getBoardCount()  count(*)
// int count = getBoardCount() 호출
int count=bdao.getBoardCount();
// 한화면에 보여줄 가져올 글 개수 설정 
int pageSize=15;
//현페이지 번호 가져오기  pageNum 파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// 현페이지 번호가 없으면 "1"페이지로 설정
if(pageNum==null){
	pageNum="1";
}
// pageNum => 정수형으로 변경
int currentPage=Integer.parseInt(pageNum);
// 10개씩 잘라서 1페이지 시작하는 행번호 구하기
int startRow=(currentPage-1)*pageSize+1;
int endRow=currentPage*pageSize;
//List boardList= getBoardList(startRow,pageSize) 호출
List boardList=bdao.getBoardList(startRow, pageSize);
%>
<!-- 게시판 -->
<article>
<h1>File Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    <%
    //  bb.getNum() 실제 게시판번호 -> 가상 카운트 번호 부여
    //  전체 글개수  count  pageNum   pageSize  =>   num
    //          30       1         10     =>   30-0*10=> 30-0  => 30 
    //          30       2         10     =>   30-1*10=> 30-10 => 20
    //          30       3         10     =>   30-2*10=> 30-20 => 10
    int num=count-(currentPage-1)*pageSize;
    
    // 2020-03-24 17:42:30.0 날짜  =>   2012.11.06 문자날짜모양
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd");
    for(int i=0;i<boardList.size();i++){
    	BoardBean bb=(BoardBean)boardList.get(i);
    	%>
    <tr onclick="location.href='fcontent.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>'"><td><%=num-- %></td><td class="left"><%=bb.getSubject() %></td>
    <td><%=bb.getName() %></td><td><%=sdf.format(bb.getDate()) %></td><td><%=bb.getReadcount() %></td></tr>
    	<%
    }
    %>
</table>
<div id="table_search">
<%
// 세션값 가져오기
String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
if(id!=null){
	%><input type="button" value="글쓰기" class="btn" 
onclick="location.href='fwriteForm.jsp'"><%
}
%>
</div>
<div id="table_search">
<form action="noticeSearch.jsp" method="post">
<input type="text" name="search" class="input_box">
<input type="submit" value="search" class="btn">
</form>
</div>
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
	%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a><%
}
for(int i=startPage;i<=endPage;i++){
	%><a href="notice.jsp?pageNum=<%=i%>"><%=i %></a><%
}
if(endPage < pageCount){
	%><a href="notice.jsp?pageNum=<%=startPage-pageBlock%>">Next</a><%
}
%>
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