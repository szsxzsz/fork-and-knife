package com.fork.user.db;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.fork.store.db.StoreDTO;

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
				DataSource ds = (DataSource)initCTX.lookup("java:comp/env/jdbc/project12");
				
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
//					pstmt.setString(2, dto.getC_id());
//					pstmt.setString(3, dto.getC_name());
//					pstmt.setString(4, dto.getC_email());
//					pstmt.setString(5, dto.getC_nickName());
//					pstmt.setString(6, dto.getC_pw());
					
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
			
			// 멤버 로그인 memberLogin
			public int memberLogin(String id, String pw) {
				int result = -1;
				
				try {
					// 1.2. 디비연결
					con = getConnection();
					// 3. sql & pstmt
					sql = "select m_pw from member where m_id=?";
					pstmt = con.prepareStatement(sql);
					//???
					pstmt.setString(1, id);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					
					if(rs.next()) {
						// 회원
						if(pw.equals(rs.getString("m_pw"))) {
							// 로그인 성공
							result = 1;
						}else {
							// 로그인 실패
							result = 0;
						}
					}else {
						// 비회원
						result = -1;
					}
					System.out.println(" DAO : 로그인 체크 ("+result+")");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return result;
			}
			// 멤버 로그인 memberLogin end
			
			// 어드민 가게목록불러오기 getStoreList start
			public List<Map> adminGetBoardList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> boardList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from store A inner join ceo B on A.c_no = B.c_no limit ?,?; ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("c_name", rs.getString("c_name"));
						hm.put("s_image", rs.getString("s_image"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("s_no", rs.getLong("s_no"));
						hm.put("s_type", rs.getString("s_type"));
						hm.put("s_number",rs.getInt("s_number"));
						hm.put("s_addr",rs.getString("s_addr"));
						hm.put("s_regdate", rs.getTimestamp("s_regdate"));
						//DTO -> List
						
						boardList.add(hm);
					}//while
					System.out.println(boardList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return boardList;
			}
			
			// 어드민 가게 목록 불러오기 getStoreList end
			
			// 어드민 가게 삭제하기 
			public void adminDeleteStore(int s_no) {			
				try {
					con = getConnection();
					
					sql = "select * from store where s_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, s_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from store where s_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, s_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 가게 삭제하기
			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			public ArrayList adminGetGenMemList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from member " + "limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						MemberDTO dto = new MemberDTO();
						
						dto.setM_no(rs.getInt("m_no"));
						dto.setM_id(rs.getString("m_id"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
						dto.setM_name(rs.getString("m_name"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			public ArrayList adminGetGenMemList(String m_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select * from member where m_id Like ?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, m_id); // 시작행-1
					// 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						MemberDTO dto = new MemberDTO();
						
						dto.setM_no(rs.getInt("m_no"));
						dto.setM_id(rs.getString("m_id"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
						dto.setM_name(rs.getString("m_name"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
						
						// 어드민 일반 회원 목록 불러오기 getGenMemList, General
			
			// 일반 회원 수 카운트 getGenMemCount
			public int getGenMemCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from member";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(1);
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			
			// 일반 회원 수 카운트 getGenMemCount
			
			// 어드민 일반 회원 삭제
			public void AdminDeleteGenMem(int m_no) {			
				try {
					con = getConnection();
					
					sql = "select * from member where m_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, m_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from member where m_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, m_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 일반 회원 삭제
			
			// 어드민 점주 회원 갯수 카운트
			public int getCeoMemCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from ceo";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(1);
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 점주 회원 갯수 카운트
			
			
			
			// 어드민 점주 회원리스트 받기
			
			public ArrayList adminGetCeoMemList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from ceo " + "limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						CeoDTO dto = new CeoDTO();
						
						dto.setC_no(rs.getInt("c_no"));
						dto.setC_id(rs.getString("c_id"));
						dto.setC_nickName(rs.getString("c_nickname"));
						dto.setC_email(rs.getString("c_email"));
						dto.setC_name(rs.getString("c_name"));
						dto.setC_tel(rs.getString("c_tel"));
						
						dto.setC_regdate(rs.getTimestamp("c_regdate"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
			
			// 어드민 점주 회원리스트 받기
			
			// 어드민 점주 회원리스트 받기
			
			public ArrayList adminGetCeoMemList(String c_id) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList memList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//								sql = "select * from itwill_board";
					sql = "select * from ceo where c_id Like ?";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setString(1, c_id); // 시작행-1
					
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						CeoDTO dto = new CeoDTO();
						
						dto.setC_no(rs.getInt("c_no"));
						dto.setC_id(rs.getString("c_id"));
						dto.setC_nickName(rs.getString("c_nickname"));
						dto.setC_email(rs.getString("c_email"));
						dto.setC_name(rs.getString("c_name"));
						dto.setC_tel(rs.getString("c_tel"));
						
						dto.setC_regdate(rs.getTimestamp("c_regdate"));
						
						memList.add(dto);
					}//while
					
					System.out.println(" DAO : 게시판 목록 저장완료!"+memList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return memList;
			}
						
						// 어드민 점주 회원리스트 받기
			
			// 어드민 점주 삭제
			public void adminDeleteCeoMem(int c_no) {			
				try {
					con = getConnection();
					
					sql = "select * from ceo where c_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, c_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from ceo where c_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, c_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 점주 삭제
			
			// 어드민 신고 갯수 조회
			public int getReportCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from report";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//						cnt = rs.getInt(1);
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 신고 갯수 조회
			
			// 어드민 신고 목록 조히
			public List<Map> adminGetReportList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				List<Map> reportList = new ArrayList<Map>();
				HashMap<String,Object> hm = null;
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "SELECT r.rep_no, s.s_name,c.c_name, m.m_id, m.m_name, r.rep_reason, r.rep_howmany, r.rep_date "
							+ "FROM report r, member m, store s, ceo c "
							+ "where r.s_no = s.s_no "
							+ "and r.m_no = m.m_no "
							+ "and s.c_no = c.c_no limit ?,?;";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						hm = new HashMap<String,Object>();
						hm.put("rep_no", rs.getInt("rep_no"));
						hm.put("s_name", rs.getString("s_name"));
						hm.put("c_name", rs.getString("c_name"));
						hm.put("m_id", rs.getString("m_id"));
						hm.put("m_name", rs.getString("m_name"));
						hm.put("rep_reason",rs.getString("rep_reason"));
						hm.put("rep_howmany",rs.getInt("rep_howmany"));
						hm.put("rep_date", rs.getTimestamp("rep_date"));
						//DTO -> List
						
						reportList.add(hm);
					}//while
					System.out.println(reportList);
					System.out.println(" DAO : 게시판 목록 저장완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return reportList;
			}
			// 어드민 신고 목록 조회
			
			// 어드민 신고 삭제
			public void adminDeleteReport(int rep_no) {			
				try {
					con = getConnection();
					
					sql = "select * from report where rep_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, rep_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from report where rep_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, rep_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 신고 삭제
			
			// 어드민 공지 목록
			
			public ArrayList adminGetNoticeList(int startRow, int pageSize) {
				System.out.println(" DAO : getBoardList() 호출 ");
				// 글정보 모두 저장하는 배열
				ArrayList noticeList = new ArrayList();
				
				try {
				// 1.2. 디비 연결
					con = getConnection();
				// 3. sql 작성(select) & pstmt 객체
//					sql = "select * from itwill_board";
					sql = "select * from notice " + "limit ?,? ";
					pstmt = con.prepareStatement(sql);
				// ?????
					pstmt.setInt(1, startRow-1); // 시작행-1
					pstmt.setInt(2, pageSize); // 개수
				// 4. sql 실행
					rs = pstmt.executeQuery();
				// 5. 데이터 처리 (DB -> DTO -> List)
					while(rs.next()) {
						// DB -> DTO
						NoticeDTO dto = new NoticeDTO();
						
						dto.setN_no(rs.getInt("n_no"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_readcount(rs.getInt("n_readcount"));
						dto.setN_date(rs.getTimestamp("n_date"));
						dto.setN_eventSdate(rs.getString("n_eventSdate"));
						dto.setN_eventEdate(rs.getString("n_eventEdate"));
						
						noticeList.add(dto);
					}//while
					
//					System.out.println(" DAO : 게시판 목록 저장완료!"+noticeList);
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeDB();
				}
				
				return noticeList;
			}
			
			// 어드민 공지 목록
			
			// 어드민 공지 갯수 조회
			public int getNoticeCount() {
				int cnt = 0;
				
				// 1.2. 디비연결
				try {
					con = getConnection();
					// 3. sql
					sql = "select count(*) from notice";
					pstmt = con.prepareStatement(sql);
					
					// 4. sql 실행
					rs = pstmt.executeQuery();
					// 5. 데이터처리
					if(rs.next()) {
						
//									cnt = rs.getInt(1);
						cnt = rs.getInt("count(*)");
					}
					System.out.println(" DAO : 전체 일반 회원 수 : " +cnt+"개");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return cnt;
			}
			// 어드민 공지 갯수 조회
			
			// 어드민 공지 삭제
			public void adminDelNotice(int n_no) {			
				try {
					con = getConnection();
					
					sql = "select * from notice where n_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, n_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						sql = "delete from notice where n_no=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, n_no);
						pstmt.executeUpdate();
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			
			}
			// 어드민 공지 삭제
			
			// 어드민 공지 등록
			public void insertNotice(NoticeDTO dto) {
				
				try {
					
					int cnt = 1;
					
					con = getConnection();
					
					sql = "select max(n_no) from notice";
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					
					if(rs.next()) {
						cnt = rs.getInt(1)+1;
					}
					
					
					sql = "insert into notice values (?,?,now(),?,?,?,?,?,?)";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, cnt);
					pstmt.setString(2, dto.getN_title());
					
					pstmt.setInt(3, dto.getN_readcount());
					pstmt.setInt(4, dto.getN_isevent());
					pstmt.setString(5, dto.getN_img());
					pstmt.setString(6, dto.getN_content());
					pstmt.setString(7, dto.getN_eventSdate());
					pstmt.setString(8, dto.getN_eventEdate());
					
					pstmt.executeUpdate();
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			}
			// 어드민 공지 등록
			
			// 어드민 회원 상세 정보
			public MemberDTO adminGetGenMemDetail(int m_no) {			
				MemberDTO dto = null;
				try {
					con = getConnection();
					
					sql = "select * from member where m_no=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setInt(1, m_no);
					pstmt.executeQuery();
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						dto = new MemberDTO();
						
						dto.setM_no(m_no);
						dto.setM_id(rs.getString("m_id"));
						dto.setM_name(rs.getString("m_name"));
						dto.setM_email(rs.getString("m_email"));
						dto.setM_nickName(rs.getString("m_nickname"));
						dto.setM_birth(rs.getString("m_birth"));
						dto.setM_gender(rs.getString("m_gender"));
						dto.setM_tel(rs.getString("m_tel"));
						dto.setM_regdate(rs.getTimestamp("m_regdate"));
					
					}
					
					
					System.out.println(" DAO : 회원삭제 완료");
					
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
			return dto;
			}
			// 어드민 회원 상세 정보
			
			// 어드민 회원 상세, 각종 횟수
			
			public HashMap<String, Integer> adminGetGenCount(int m_no) {
				
				HashMap<String, Integer> hs = new HashMap<String, Integer>();
				
				try {
					con=getConnection();
					sql = "select (select count(*) from reviewcs where m_no=?) A,"
							+ "(select count(*) from report where m_no=?) B,"
							+ "(select count(*) from reservation where m_no=?) C,"
							+ "(select count(*) from payment where m_no=?) D";
					pstmt = con.prepareStatement(sql);
					for (int i=1;i<5;i++) {
						pstmt.setInt(i, m_no);
					}
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						hs.put("review", rs.getInt("A"));
						hs.put("report", rs.getInt("B"));
						hs.put("reservation", rs.getInt("C"));
						hs.put("payment", rs.getInt("D"));
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeDB();
				}
				
				return hs;
			}
			
			// 어드민 회원 상세, 각종 횟수
			
			
}
