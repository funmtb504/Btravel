<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// id pass  파라미터 가져오기
String id=request.getParameter("id");
String pass=request.getParameter("pass");

//MemberDAO 객체생성
MemberDAO mdao=new MemberDAO();
//int check =    userCheck(아이디,비밀번호) 호출
int check=mdao.userCheck(id, pass);
// check ==1   삭제하는메서드호출  deleteMember(아이디,비밀번호) 세션초기화  main.jsp 이동
// check ==0  비밀번호틀림 뒤로이동
// check ==-1 아이디없음 뒤로이동
if(check==1){
	mdao.deleteMember(id,pass);
//		//세션값 초기화
	session.invalidate();
	%>
	<script type="text/javascript">
		alert("회원정보가 정상적으로 삭제되어 탈퇴 되었습니다.");
	    location.href="../index.html"
	</script>
	<%
}else if(check==0){
	%>
	<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("아이디 없음");
		history.back();
	</script>
	<%
}
%>
</body>
</html>











