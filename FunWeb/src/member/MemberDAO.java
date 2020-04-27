package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	// 디비연결 1단계,2단계 메서드 정의
	private Connection getConnection() throws Exception{
		// 예외처리를 메서드호출한 곳에서 처리하겠다
		
//		// 1단계 드라이버로더
//		 Class.forName("com.mysql.jdbc.Driver");
//		 // 2단계 디비연결
//		 String dbUrl="jdbc:mysql://localhost:3306/jspdb1";
//		 String dbUser="jspid";
//		 String dbPass="jsppass";
//		 Connection con=DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		 return con;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	
	public void insertMember(MemberBean mb) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			// 예외가 발생하것 같은 구문
			// 1단계 드라이버로더			 // 2단계 디비연결
			con=getConnection();
			
			 // 3단계 sql문 만들고 실행할 객체생성  insert
			 String sql="insert into member(id,pass,name,reg_date,email,address,phone,mobile) values(?,?,?,?,?,?,?,?)";
			 pstmt=con.prepareStatement(sql);
			 pstmt.setString(1, mb.getId());
			 pstmt.setString(2, mb.getPass());
			 pstmt.setString(3, mb.getName());
			 pstmt.setTimestamp(4, mb.getReg_date());
			 pstmt.setString(5, mb.getEmail());
			 pstmt.setString(6, mb.getAddress());
			 pstmt.setString(7, mb.getPhone());
			 pstmt.setString(8, mb.getMobile());
			 
			 // 4단계 sql문 실행
			 pstmt.executeUpdate();
		} catch (Exception e) {
			// 예외가 발생하면 처리하는 구문
			e.printStackTrace();
		}finally {
			// 예외상관없이 마무리작업 구문=> 기억장소 해제
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}// insertMember()
	
	// userCheck(아이디,비밀번호)
		public int userCheck(String id,String pass) {
			int check=-1;
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				// 1단계 드라이버로더			 // 2단계 디비연결
				con=getConnection();
				 // 3단계 sql member테이블안에 아이디 일치 한 회원 내용 가져오기, 폼아이디 디비 아이디 일치
				 String sql="select * from member where id=?";
				 pstmt=con.prepareStatement(sql);
				 pstmt.setString(1, id);
				 // 4단계 실행 => 결과 저장
				 rs=pstmt.executeQuery();
				 // 5단계  rs 첫행 이동 결과 있으면 아이디 일치  
				 //                                  비밀번호 비교 맞으면  세션값 생성 main.jsp이동
				 //                                  pass.equals(rs.getString("pass"))
				 //                                             틀리면 "비밀번호 틀림"
				 //                    없으면  "아이디 없음"
				 if(rs.next()){
				 	//아이디 일치
				 	if(pass.equals(rs.getString("pass"))){
				 		check=1;
				 	}else{
				 		check=0;
				 	}
				 }else{
				 	check=-1;
				 }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외상관없이 마무리작업 구문=> 기억장소 해제
				if(rs!=null) try{rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();}catch(SQLException ex) {}
			}
			return check;
		}
		
		// getMember(아이디)
		public MemberBean getMember(String id) {
			MemberBean mb=new MemberBean();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				// 1단계 드라이버로더			 // 2단계 디비연결
							con=getConnection();
				 // 3단계 sql 만들고 실행할수 있는 객체 만들기 select
				 String sql="select * from member where id=?";
				 pstmt=con.prepareStatement(sql);
				 pstmt.setString(1, id);
				 // 4단계 결과<=실행 결과 저장
				 rs=pstmt.executeQuery();
				 // 5단계 rs 내용 위치 첫행이동 데이터 있으면 출력  
				 if(rs.next()){
					 // rs 내용을 MemberBean 멤버변수 각각 저장
					 mb.setId(rs.getString("id"));
					 mb.setPass(rs.getString("pass"));
					 mb.setName(rs.getString("name"));
					 mb.setReg_date(rs.getTimestamp("reg_date"));
				 }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try{rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();}catch(SQLException ex) {}
			}
			return mb;
		}
		// updateMember(mb);
		public void updateMember(MemberBean mb) {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				// 1단계 드라이버로더			 // 2단계 디비연결
							con=getConnection();
//				 3단계 수정
		 		String sql="update member set name=? where id=?";
		 		pstmt=con.prepareStatement(sql);
		 		pstmt.setString(1, mb.getName());
		 		pstmt.setString(2, mb.getId());
		 		// 4단계  객체 실행 (sql구문이 실행) - insert, update, delete
		 		pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();}catch(SQLException ex) {}
			}
		}
		
		// deleteMember(id,pass)
		public void deleteMember(String id,String pass) {
			Connection con=null;
			PreparedStatement pstmt=null;
			try {
				// 1단계 드라이버로더			 // 2단계 디비연결
							con=getConnection();
//				 3단계 수정
			 		String sql="delete from member where id=?";
			 		pstmt=con.prepareStatement(sql);
			 		pstmt.setString(1, id);
		 		// 4단계  객체 실행 (sql구문이 실행) - insert, update, delete
		 		pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();}catch(SQLException ex) {}
			}
		}
		
		// getMemberList()
		public  List getMemberList() {
			// 여러명의 데이터를 저장하는 기억장소,배열API
			List memberList=new ArrayList();
			Connection con=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				// 1단계 드라이버로더			 // 2단계 디비연결
							con=getConnection();
				 // 3단계 sql member 전체 조회
				 String sql="select * from member";
				 pstmt=con.prepareStatement(sql);
				 // 4단계 rs <= 실행결과 저장
				 rs=pstmt.executeQuery();
				 // 5단계 while 첫행으로 이동 데이터 있으면
				 //           한사람의 데이터 저장  MemberBean mb 객체생성 
				 //                           mb 멤버변수 <= rs에 저장된 열내용
				 //           배열 한칸에 한사람의 데이터 주소저장  memberList.add(mb);
				 while(rs.next()) {
					 MemberBean mb=new MemberBean();
					 mb.setId(rs.getString("id"));
					 mb.setPass(rs.getString("pass"));
					 mb.setName(rs.getString("name"));
					 mb.setReg_date(rs.getTimestamp("reg_date"));
					 //배열 한칸에 한사람의 데이터 주소저장
					 memberList.add(mb);
				 }
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try{rs.close();}catch(SQLException ex) {}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
				if(con!=null) try{con.close();}catch(SQLException ex) {}
			}
			return memberList;
		}
		
		// idCheck(아이디) 아이디 중복체크
				public int idCheck(String id) {
					int check=-1;
					Connection con=null;
					PreparedStatement pstmt=null;
					ResultSet rs=null;
					try {
						// 1단계 드라이버로더			 // 2단계 디비연결
						con=getConnection();
						 // 3단계 sql member테이블안에 아이디 일치 한 회원 내용 가져오기, 폼아이디 디비 아이디 일치
						 String sql="select * from member where id=?";
						 pstmt=con.prepareStatement(sql);
						 pstmt.setString(1, id);
						 // 4단계 실행 => 결과 저장
						 rs=pstmt.executeQuery();
						 // 5단계  rs 첫행 이동 결과 있으면 아이디 일치  
						 //                    없으면  "아이디 없음"
						 if(rs.next()){
						 	//아이디 중복
						 	check=1;
						 }else{
							 // 아이디 없음 사용가능
							 check=0;
						 }
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						// 예외상관없이 마무리작업 구문=> 기억장소 해제
						if(rs!=null) try{rs.close();}catch(SQLException ex) {}
						if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
						if(con!=null) try{con.close();}catch(SQLException ex) {}
					}
					return check;
				}
				
}//클래스










