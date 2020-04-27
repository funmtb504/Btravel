<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
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
// center/fwritePro.jsp
// //한글처리
// request.setCharacterEncoding("utf-8");
// 업로드   WEB-INF - lib - cos.jar
// WebContent upload 폴더 만들기 
// upload 물리적 경로
String uploadPath=request.getRealPath("/upload");
// 파일크기 지정
int maxSize=5*1024*1024; //5M

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

// 파라미터 가져오기
String name=multi.getParameter("name");
String pass=multi.getParameter("pass");
String subject=multi.getParameter("subject");
String content=multi.getParameter("content");
String file=multi.getFilesystemName("file");
int readcount =0; //조회수
Timestamp date=new Timestamp(System.currentTimeMillis());
//BoardBean bb 객체생성
BoardBean bb=new BoardBean();
// 자바빈 멤버변수 <= 파라미터값 저장
bb.setName(name);
bb.setPass(pass);
bb.setSubject(subject);
bb.setContent(content);
bb.setReadcount(readcount);
bb.setDate(date);
bb.setFile(file);
// BoardDAO bdao 객체생성
// insertBoard(자바빈 주소) 메서드호출
BoardDAO bdao=new BoardDAO();
bdao.insertBoard(bb);
// notice.jsp 이동
response.sendRedirect("fnotice.jsp");
%>
</body>
</html>






