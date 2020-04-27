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
<!-- member/joinPro.jsp -->
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request저장된 파라미터 값 가져와서 => 변수에 저장
String id=request.getParameter("id");


// 패키지 member 파일이름 MemberBean
// 파라미터값을 저장하는 변수 만들고 set,get메서드 만들기
//  MemberBean mb 객체생성 => 기억장소만들기
MemberBean mb=new MemberBean();
//  mb에 <= 파라미터값 저장
mb.setId(id);


MemberDAO mdao=new MemberDAO();
// inserMember(자바빈 주소) 메서드호출
int check=mdao.idCheck(id);
if(check==1){%>
<script type="text/javascript">
	alert("아이디 중복! 다른 아이디를 입력하여 주세요!");
	self.close();
</script><%}
else if(check==-1){%>
<script type="text/javascript">
	alert("해당 아이디 사용 가능!");
	self.close();
</script><%}


%>
</body>
</html>











