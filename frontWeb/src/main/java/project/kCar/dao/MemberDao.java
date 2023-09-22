package project.kCar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.kCar.DB;
import project.kCar.vo.MemberVO;
public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// // Product 테이블(물건명,가격,갯수) ==> 
	// 로그인 처리 메서드 정의
	public MemberVO login(String mem_id, String mem_pass) {
		MemberVO mem = null;
		String sql = "SELECT * FROM mem_info WHERE MEM_ID = ? and MEM_PASS =?";
		//1. 연결(기본예외/자원해제)=
		try {
			con = DB.con();
			// 2. 대화(sql 전달 후, 매개변수로 전달)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, mem_pass);
			// 3. 결과
			rs = pstmt.executeQuery();
			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
			// Member(String id, String pass, String name, int point, String auth, Date regdate)
			if(rs.next()) {
				mem = new MemberVO(
						rs.getString("mem_id"),
						rs.getString("mem_pass"),
						rs.getString("license_id"),
						rs.getString("mname"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("auth")
						);
			}
			// 
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}

	public void insertMember(MemberVO ins) {
		int isInsert = 0;
		String sql = "INSERT INTO MEM_INFO \r\n"+
						"values (?,?,?,?,?,?,'user')";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			//insert into member20 values('higirl','8888',
			//	    '홍리나',1000,'관리자',sysdate);			
			pstmt.setString(1, ins.getMem_id());
			pstmt.setString(2, ins.getMem_pass());
			pstmt.setString(3, ins.getLicense_id());
			pstmt.setString(4, ins.getMname());
			pstmt.setString(5, ins.getEmail());
			pstmt.setString(6, ins.getPhone());
			isInsert=pstmt.executeUpdate();
			if(isInsert==1) {
				con.commit();
				System.out.println("회원 등록 성공!!");
			}
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
			DB.rollback(con);
			
		} catch(Exception e) {
			System.out.println("일반:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}

	// // Product 테이블(물건명,가격,갯수) ==> 
	// 로그인 처리 메서드 정의
	public MemberVO checkMem(String id) {
		MemberVO mem = null;
		String sql = "SELECT * FROM mem_info\r\n"
				+ "WHERE mem_id=?";
		//1. 연결(기본예외/자원해제)
		try {
			con = DB.con();
			// 2. 대화(sql 전달 후, 매개변수로 전달)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 3. 결과
			rs = pstmt.executeQuery();
			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
			// Member(String id, String pass, String name, int point, String auth, Date regdate)
			if(rs.next()) {
				mem = new MemberVO(
					rs.getString("mem_id")
				);
			}
			// 
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	public MemberVO checklicense(String license) {
		MemberVO mem = null;
		String sql = "SELECT * FROM mem_info\r\n"
				+ "WHERE license_id=?";
		//1. 연결(기본예외/자원해제)
		try {
			con = DB.con();
			// 2. 대화(sql 전달 후, 매개변수로 전달)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, license);
			// 3. 결과
			rs = pstmt.executeQuery();
			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
			// Member(String id, String pass, String name, int point, String auth, Date regdate)
			if(rs.next()) {
				mem = new MemberVO(
						rs.getString("license_id")
						);
			}
			// 
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}
	
	public MemberVO forgot(String memname, String phone) {
		MemberVO mem = null;
		String sql = "SELECT * FROM mem_info WHERE MNAME = ? and PHONE =?";
		//1. 연결(기본예외/자원해제)=
		try {
			con = DB.con();
			// 2. 대화(sql 전달 후, 매개변수로 전달)
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memname);
			pstmt.setString(2, phone);
			// 3. 결과
			rs = pstmt.executeQuery();
			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
			// Member(String id, String pass, String name, int point, String auth, Date regdate)
			if(rs.next()) {
				mem = new MemberVO(
						rs.getString("mem_id"),
						rs.getString("mem_pass"),
						rs.getString("mname"),
						rs.getString("phone")
						);
			}
			// 
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
		return mem;
	}

	public void change(MemberVO udt) {
		int isUpdate = 0;
		String sql = "UPDATE mem_info SET mem_pass = ? \r\n" +
						"WHERE mname = ? AND phone = ?";
		//1. 연결(기본예외/자원해제)=
		try {
			con = DB.con();
			// 2. 대화(sql 전달 후, 매개변수로 전달)
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, udt.getMem_pass());
			pstmt.setString(2, udt.getMname());
			pstmt.setString(3, udt.getPhone());
			
			// 3. 결과
			isUpdate = pstmt.executeUpdate();
			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
			// Member(String id, String pass, String name, int point, String auth, Date regdate)
			if(isUpdate==1) {
				con.commit();
				System.out.println("회원 등록 성공!!");
			}
			// 
		} catch (SQLException e) {
			System.out.println("DB:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("기타:"+e.getMessage());
		}finally {
			DB.close(rs, pstmt, con);
		}
	}

	

}
