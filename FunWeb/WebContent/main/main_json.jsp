<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//main_json.jsp
// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
String dbUser="jspid";
String dbPass="jsppass";
Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 sql 
String sql="select * from board order by re_ref desc,re_seq asc limit 0,5";
PreparedStatement pstmt=con.prepareStatement(sql);
// 4단계 rs <= 실행결과저장
ResultSet rs=pstmt.executeQuery();
// 5단계  rs => 자바빈 => 배열 
// List boardList=new ArrayList();
JSONArray boardList=new JSONArray();
while(rs.next()){
// 	BoardBean bb=new BoardBean();
// 	bb.setName(rs.getString("name"));
	JSONObject bb=new JSONObject();
	bb.put("num",rs.getString("num"));
	bb.put("subject",rs.getString("subject"));
	bb.put("date",rs.getString("date"));
	// 배열 한칸에 저장
// 	boardList.add(bb);
	boardList.add(bb);
}
%><%=boardList%>