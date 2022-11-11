package com.fork.user.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StoreDAO {

	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	// DB 연결메서드(커넥션풀)
			private Connection getConnection() throws Exception {
				
				// 1. 드라이버 로드 	// 2. DB 연결
				
				// Context 객체 생성(JNDI API)
				// 형변환이 필요없으므로 업캐스팅 관계(상속관계)인 것을 알 수 있음
				Context initCTX = new InitialContext(); 
				
				// DB 연동 정보 불러오기(context.xml 파일정보)
				// 다운캐스팅
				DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/testDB");
				
				// DB 정보(연결) 불러오기
				con = ds.getConnection();
				
				System.out.println(" DAO : 디비연결 성공(커넥션풀) ");
				System.out.println(" DAO : con : "+con);
				
			return con;
			}
					
			// 자원해제 메서드-closeDB()
			public void closeDB() {
				System.out.println(" DAO : DB 연결자원 해제");
				
				try {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(con != null) con.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} // 자원해제 메서드-closeDB()
			
			// 회원가입 - memberJoin(DTO)
			/**
			 * 회원가입 메서드, 실행할 때 회원정보(DTO) 받아서 사용
			 * 리턴 X
			 * @param dto
			 * @param hid
			 */
			public void memberJoin(MemberDTO dto) {
				int m_no = 0;
				
				try {
					con = getConnection();
					
					sql = "select max(m_no) from member";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						m_no = rs.getInt(1)+1;
					} // 회원번호 증가
					
					System.out.println(" DAO : m_no : " + m_no);
					
					// 회원가입
					sql = "insert into member(m_no,m_id,m_name,m_email,m_nickname,m_pw) "
							+ "values(?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					
					// ??
					pstmt.setInt(1, m_no);
					pstmt.setString(2, dto.getM_id());
					pstmt.setString(3, dto.getM_name());
					pstmt.setString(4, dto.getM_email());
					pstmt.setString(5, dto.getM_nickName());
					pstmt.setString(6, dto.getM_pw());
					
					int result = pstmt.executeUpdate();
					
					if(result > 0 ) {
						System.out.println(" DAO : 회원가입 성공! ");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}

			} // 회원가입 - memberJoin(DTO)
			
			
			// 회원가입 - ceoJoin(DTO)
			/**
			 * 회원가입 메서드, 실행할 때 회원정보(DTO) 받아서 사용
			 * 리턴 X
			 * @param dto
			 * @param hid
			 */
			public void ceoJoin(StoreDTO dto) {
				int c_no = 0;
				
				try {
					con = getConnection();
					
					sql = "select max(c_no) from ceo";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						c_no = rs.getInt(1)+1;
					} // 회원번호 증가
					
					System.out.println(" DAO : c_no : " + c_no);
					
					// 회원가입
					sql = "insert into ceo(c_no,c_id,c_name,c_email,c_nickname,c_pw) "
							+ "values(?,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					
					// ??
					pstmt.setInt(1, c_no);
					pstmt.setString(2, dto.getC_id());
					pstmt.setString(3, dto.getC_name());
					pstmt.setString(4, dto.getC_email());
					pstmt.setString(5, dto.getC_nickName());
					pstmt.setString(6, dto.getC_pw());
					
					int result = pstmt.executeUpdate();
					
					if(result > 0 ) {
						System.out.println(" DAO : 회원가입 성공! ");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}

			} // 회원가입 - ceoJoin(DTO)
			
			
			// 아이디 중복확인 - checkId(id)
			/**
			 * 아이디 중복확인 메서드, 실행할 때(id) 받아서 사용
			 * 리턴값 있음. 1-중복, 0-중복x
			 * @param id
			 * @return
			 */
			public int checkId(String id) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select c_pw pw from ceo where c_id=? union "
							+ "select m_pw from member where m_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, id);
					pstmt.setString(2, id);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 아이디 중복결과 ("+result+")");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			} // 아이디 중복확인 - checkId(id)
			
			
//			public int checkNick(String nick) {
//				int result=0;
//				
//				try {
//					con = getConnection();
//					
//					sql = "select c_pw pw from sto where c_nickName=? union "
//							+ "select m_pw from mem where m_nickName=?";
//					pstmt = con.prepareStatement(sql);
//					
//					pstmt.setString(1, nick);
//					pstmt.setString(2, nick);
//					
//					rs = pstmt.executeQuery();
//					
//					if(rs.next() || nick.equals("")) {
//						result = 1;  // 이미 존재, 생성 불가
//						
//						System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
//					}
//					
//				} catch (Exception e) {
//					e.printStackTrace();
//				} closeDB();
//				
//				return result;
//			}
			
			
			public int checkNick(String nick) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select m_pw from member where m_nickName=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, nick);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
					} else {
						sql = "select c_pw from ceo where c_nickName=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, nick);
						
						rs = pstmt.executeQuery();
						
						if(rs.next() || nick.equals("")) {
							result = 1;  // 이미 존재, 생성 불가
							
							System.out.println(" DAO : 닉네임 중복결과 ("+result+")");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			}
			
			
			public int checkEmail(String email) {
				int result=0;
				
				try {
					con = getConnection();
					
					sql = "select m_pw from member where m_email=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, email);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						result = 1;  // 이미 존재, 생성 불가
						
						System.out.println(" DAO : 이메일 중복결과 ("+result+")");
					} else {
						sql = "select c_pw from ceo where c_Email=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, email);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							result = 1;  // 이미 존재, 생성 불가
							
							System.out.println(" DAO : 이메일 중복결과 ("+result+")");
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				} closeDB();
				
				return result;
			}
			
}
