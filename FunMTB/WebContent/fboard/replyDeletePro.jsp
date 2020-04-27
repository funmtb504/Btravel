<%@page import="member.MemberDAO"%>
<%@page import="board.FboardDAO"%>
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
// 한글처리
request.setCharacterEncoding("utf-8");
//pageNum파라미터 가져오기

String id=(String)session.getAttribute("id");
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");
//BoardBean bb 
BoardBean bb=new BoardBean();
bb.setNum(num);


//FboardDAO bdao 객체생성
FboardDAO bdao=new FboardDAO();
MemberDAO mdao=new MemberDAO();
// int check = userCheck(id,pass) 메서드 호출
int check=mdao.userCheck(id, pass);
// check==1 num pass 일치  deleteBoard(bb) 수정 list.jsp 이동
// check==0  "비밀번호틀림" 뒤로이동
if(check==1){
	bdao.deleteReply(num);
	response.sendRedirect("myreplylist.jsp");
}else{
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>








