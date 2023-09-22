package project.kCar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.kCar.DB;
import project.kCar.vo.CarRegistInfo;
import project.kCar.vo.MemCarRegist;
import project.kCar.vo.MemInfo;
import project.kCar.vo.Okay_CR;
import project.kCar.vo.Options;
import project.kCar.vo.RegistedInfo;


public class DAO_adm {
	private Connection con;
	private PreparedStatement pstmt; 
	private ResultSet rs;
	
	public String deleteMem(String delId) {
		String isSuc = "N";
		String sql = "DELETE MEM_INFO WHERE mem_id = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delId);
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 아이디 삭제완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	public List<MemInfo> getMemInfo() {
		List<MemInfo> memlist = new ArrayList<>();
		String sql = "SELECT * FROM MEM_INFO";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memlist.add(new MemInfo(
						rs.getString("mem_id"),
						rs.getString("mem_pass"),
						rs.getString("license_id"),
						rs.getString("mname"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("auth")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return memlist;
	}
	public List<MemCarRegist> getMemCarInfo() {
		List<MemCarRegist> mclist = new ArrayList<>();
		String sql = "SELECT * FROM MEM_CAR_REGISTER mcr ORDER BY EVAL,WANT_TIME ASC";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mclist.add(new MemCarRegist(
						rs.getString("regist_id"),
						rs.getString("mem_id"),
						rs.getString("car_num"),
						rs.getString("model"),
						rs.getInt("drive_dist"),
						rs.getString("address"),
						rs.getDate("want_time"),
						rs.getDate("reg_time"),
						rs.getString("eval")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mclist;
	}
	public List<MemCarRegist> getMemCarEstedInfo() {
		List<MemCarRegist> mcelist = new ArrayList<>();
		String sql = "SELECT mcr.*,ce.ISPASS ,ce.ACCIDENT_CNT ,ce.DIAG ,ce.isreg\r\n"
				+ "FROM MEM_CAR_REGISTER mcr ,CAR_ESTIMATION ce\r\n"
				+ "WHERE mcr.CAR_NUM =ce.CAR_NUM AND mcr.EVAL='TRUE'\r\n"
				+ "ORDER BY isreg,WANT_TIME ASC";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mcelist.add(new MemCarRegist(
						rs.getString("regist_id"),
						rs.getString("mem_id"),
						rs.getString("car_num"),
						rs.getString("model"),
						rs.getInt("drive_dist"),
						rs.getString("address"),
						rs.getDate("want_time"),
						rs.getDate("reg_time"),
						rs.getString("eval"),
						rs.getString("isPass"),
						rs.getInt("accident_cnt"),
						rs.getString("diag"),
						rs.getString("isReg")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return mcelist;
	}
	public RegistedInfo getMemCarEstedInfo(String carNum) {
		RegistedInfo regiInfo = null;
		String sql = "SELECT mi.*,mcr.*,ce.ISPASS ,ce.ACCIDENT_CNT ,ce.DIAG ,ce.isreg\r\n"
				+ "FROM MEM_CAR_REGISTER mcr ,CAR_ESTIMATION ce, MEM_INFO mi\r\n"
				+ "WHERE mcr.CAR_NUM =ce.CAR_NUM AND mcr.MEM_ID = mi.MEM_ID\r\n"
				+ "AND mcr.CAR_NUM = ? AND mcr.EVAL ='TRUE' ORDER BY isreg,WANT_TIME ASC";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, carNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				regiInfo = new RegistedInfo(
						rs.getString("mem_id"),
						rs.getString("mem_pass"),
						rs.getString("license_id"),
						rs.getString("mname"),
						rs.getString("email"),
						rs.getString("phone"),
						rs.getString("auth"),
						rs.getString("regist_id"),
						rs.getString("car_num"),
						rs.getString("model"),
						rs.getInt("drive_dist"),
						rs.getString("address"),
						rs.getDate("want_time"),
						rs.getDate("reg_time"),
						rs.getString("eval"),
						rs.getString("isPass"),
						rs.getInt("accident_cnt"),
						rs.getString("diag"),
						rs.getString("isReg")
						);
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return regiInfo;
	}
	public String UpdateEval(String carNum) {
		String isSuc = "N";
		String sql = "UPDATE MEM_CAR_REGISTER SET eval = 'TRUE' WHERE CAR_NUM = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			//public Okay_CR(String carNum, int accidentCnt, String isPass, String diag) {
		
			pstmt.setString(1, carNum);
	
			
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 정보수정 완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	public String UpdateIsReg(String carNum) {
		String isSuc = "N";
		String sql = "UPDATE CAR_ESTIMATION SET isreg = 'TRUE' WHERE CAR_NUM = ?";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			//public Okay_CR(String carNum, int accidentCnt, String isPass, String diag) {
		
			pstmt.setString(1, carNum);
	
			
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 정보수정 완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	public String insertEstiInfo(Okay_CR ocr) {
		String isSuc = "N";
		String sql = "INSERT INTO CAR_ESTIMATION VALUES\r\n"
				+ "(?,?,?,?,'FALSE')";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			//public Okay_CR(String carNum, int accidentCnt, String isPass, String diag) {
		
			pstmt.setString(1, ocr.getCarNum());
			pstmt.setString(2, ocr.getIsPass());
			pstmt.setInt(3, ocr.getAccidentCnt());
			pstmt.setString(4, ocr.getDiag());
			
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 정보입력 완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	
	public String insertCarInfo(Okay_CR ocr) {
		String isSuc = "N";
		String sql = "INSERT INTO OKAY_CAR_REGISTER VALUES \r\n"
				+ "(?,?,?,?,?,?,?,SYSDATE,'N')";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
//			public Okay_CR(String manufactor, String model, String volume, String carNum, int price, int accidentCnt,
//					int driveDist) {
			pstmt.setString(1, ocr.getCarNum());
			pstmt.setString(2, ocr.getManufactor());
			pstmt.setString(3, ocr.getModel());
			pstmt.setString(4, ocr.getVolume());
			pstmt.setInt(5, ocr.getPrice());
			pstmt.setInt(6, ocr.getAccidentCnt());
			pstmt.setInt(7, ocr.getDriveDist());
			
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 정보입력 완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	public String insertOptions(String carNum,String opid) {
		String isSuc = "N";
		String sql = "INSERT INTO car_options VALUES (?,?)";
		
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
//			public Okay_CR(String manufactor, String model, String volume, String carNum, int price, int accidentCnt,
//					int driveDist) {
			pstmt.setString(1, carNum);
			pstmt.setString(2, opid);
			
			int isInsert = pstmt.executeUpdate();
			if(isInsert == 1) {
				System.out.println("# 정보입력 완료");
				isSuc = "Y";
				con.commit();
			}
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
			DB.rollback(con);
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return isSuc;
	}
	public List<CarRegistInfo> getCarRegistList_Lev1() {
		List<CarRegistInfo> aclist = new ArrayList<>();
		String sql = "SELECT * FROM CAR_REGIST_INFO WHERE REFNO = 0 ORDER BY REFNO ASC";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				aclist.add(new CarRegistInfo(
						rs.getInt("cri_no"),
						rs.getString("name"),
						rs.getInt("refno")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return aclist;
	}
	
	public List<CarRegistInfo> getCarRegistList_Lev2(int refno) {
		List<CarRegistInfo> aclist = new ArrayList<>();
		String sql = "SELECT * FROM CAR_REGIST_INFO WHERE REFNO = ? ORDER BY REFNO ASC";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				aclist.add(new CarRegistInfo(
						rs.getInt("cri_no"),
						rs.getString("name"),
						rs.getInt("refno")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return aclist;
	}
	public List<Options> getOptionList(String opid) {
		List<Options> oplist = new ArrayList<>();
		String sql = "SELECT * FROM OPTION_INFO WHERE OPID LIKE ?";
		try {
			con = DB.con();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, '%'+opid+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				oplist.add(new Options(
						rs.getString("opid"),
						rs.getString("opname")
						));
			} 
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("SQL예외: "+e.getMessage());
		} catch (Exception e) {
			System.out.println("일반예외: "+e.getMessage());
		} finally {
			DB.close(rs, pstmt, con);
		}
		return oplist;
	}
}
