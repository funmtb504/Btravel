<%@page import="java.sql.Timestamp"%>
<%@page import="board.GboardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- updatePro.jsp -->
<%
//세션값 가져오기
String id=(String)session.getAttribute("id");
//세션값 없으면  member/login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}else{
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// num name pass subject content 파라미터 가져오기
String bno=request.getParameter("num");
String name=request.getParameter("name");
String retext=request.getParameter("retext");
Timestamp date=new Timestamp(System.currentTimeMillis());
// BoardBean bb객체생성
BoardBean bb=new BoardBean();
// 멤버변수 <= 파라미터 저장
bb.setBno(bno);
bb.setName(name);
bb.setRetext(retext);
bb.setDate(date);
// GboardDAO bdao 객체생성
GboardDAO bdao=new GboardDAO();
bdao.insertReply(bb);



%>

<script type="text/javascript">
location.href='fcontent.jsp?num=<%=bno%>&pageNum=<%=pageNum%>'</script>
<%} %>

</body>
</html>








