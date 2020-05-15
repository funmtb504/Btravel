<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
// 페이지새로고침할때 메서드
// 뽑기버튼클릭했을때 메서드
// 시작버튼 눌렀을때 메서드
// 종료버튼 눌렀을때 메서드
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="root";
String dbPass="1234";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 sql 
String sql="select * from lotto where lotto_rank > 0 and lotto_check = 0";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 rs <= 실행결과저장
ResultSet rs=pstmt.executeQuery();
// 5단계  rs => 자바빈 => 배열 
// List memberList=new ArrayList();


int num = 0;

if(rs.next()) {
	
	sql = "select * from lotto where lotto_check = 0 order by rand() limit 1";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if(rs.next()) {
		num = rs.getInt("lotto_num");
	}
	
	
	if(num == 3 || num == 6 || num == 9) {
		
		sql = "update lotto set lotto_check = 1 where lotto_num = ?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		out.println("당첨 ^0^");
		
	}else{
				
		sql = "update lotto set lotto_check = 1 where lotto_num = ?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		out.println("꽝 ㅠ0ㅠ");
		
	}
	
}else{
	
	sql = "update lotto set lotto_check = 0";
	pstmt=con.prepareStatement(sql);
	pstmt.executeUpdate();
	out.println("종료!");
}
%>
</body>
</html>