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
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String email=request.getParameter("email");
String address=request.getParameter("address");
String phone=request.getParameter("phone");
String mobile=request.getParameter("mobile");
Timestamp reg_date=new Timestamp(System.currentTimeMillis());

// 패키지 member 파일이름 MemberBean
// 파라미터값을 저장하는 변수 만들고 set,get메서드 만들기
//  MemberBean mb 객체생성 => 기억장소만들기
MemberBean mb=new MemberBean();
//  mb에 <= 파라미터값 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);
mb.setEmail(email);
mb.setAddress(address);
mb.setPhone(phone);
mb.setMobile(mobile);

// JDBC프로그램 설치
// 패키지 member 파일이름 MemberDAO   리턴값없음 inserMember(자바빈) 메서드 만들기
// MemberDAO mdao 객체생성
MemberDAO mdao=new MemberDAO();
// inserMember(자바빈 주소) 메서드호출
mdao.insertMember(mb);

// "회원가입성공" login.jsp 이동
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="login.jsp";
</script>
</body>
</html>











