<%@page import="board.BoardDAO"%>
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
}
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기
String pageNum=request.getParameter("pageNum");
// num name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");
// BoardBean bb객체생성
BoardBean bb=new BoardBean();
// 멤버변수 <= 파라미터 저장
bb.setNum(num);
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
// BoardDAO bdao 객체생성
BoardDAO bdao=new BoardDAO();
// int check = passCheck(bb)   num pass 일치하는지 체크
int check = bdao.passCheck(bb);
// check==1 num pass 일치  updateBoard(bb) 수정 notice.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
if(check==1){
	bdao.updateBoard(bb);
	response.sendRedirect("notice.jsp?pageNum="+pageNum);
}else{
	//"비밀번호틀림" 뒤로이동 
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
%>
</body>
</html>








