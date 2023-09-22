package project.kCar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.kCar.DB;
import project.kCar.vo.Car_Option;
import project.kCar.vo.Car_Res_Info;
import project.kCar.vo.OkayCar_Res;
import project.kCar.vo.SchCar;

public class DAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	// 판매중인 차량 list
	public List<OkayCar_Res> getCarList() {
	    List<OkayCar_Res> clist = new ArrayList<>();
	    String sql = "SELECT * FROM OKAY_CAR_REGISTER o, CAR_IMG ci\r\n"
	    		+ "WHERE SELL_OR_NOT='N'\r\n"
	    		+ "AND o.model = ci.model\r\n"
	    		+ "order by REGIST_TIME";
	    try {
	        conn = DB.con();
	        pstmt = conn.prepareStatement(sql); 
	        rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	        	clist.add(new OkayCar_Res(
	                    rs.getString("CAR_NUM"),
	                    rs.getString("MANUFACTOR"),
	                    rs.getString("MODEL"),
	                    rs.getString("VOLUME"),
	                    rs.getInt("PRICE"),
	                    rs.getInt("ACCIDENT_CNT"),
	                    rs.getInt("DRIVE_DIST"),
	                    rs.getDate("REGIST_TIME"),
	                    rs.getString("SELL_OR_NOT"),
	                    rs.getString("IMG_SRC")
	            ));
	        }
	    } catch (SQLException e) {
	        System.out.println("DB 관련 오류: " + e.getMessage());
	    } catch (Exception e) {
	        System.out.println("일반 오류: " + e.getMessage());
	    } finally {
	        DB.close(rs, pstmt, conn);
	    }
	    return clist;
	}
	
	// 차량 상세정보
	public OkayCar_Res getCarInfo(String car_num){
		OkayCar_Res ok = null;
		String sql = "SELECT *\r\n"
				+ "FROM OKAY_CAR_REGISTER o, CAR_IMG ci\r\n"
				+ "WHERE car_num = ?\r\n"
				+ "AND o.MODEL = ci.MODEL";
		try {
			conn = DB.con();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, car_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ok = new OkayCar_Res(
	                    rs.getString("CAR_NUM"),
	                    rs.getString("MANUFACTOR"),
	                    rs.getString("MODEL"),
	                    rs.getString("VOLUME"),
	                    rs.getInt("PRICE"),
	                    rs.getInt("ACCIDENT_CNT"),
	                    rs.getInt("DRIVE_DIST"),
	                    rs.getDate("REGIST_TIME"),
	                    rs.getString("SELL_OR_NOT"),
	                    rs.getString("IMG_SRC")
						);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB.close(rs, pstmt, conn);
		}
		return ok;
	}
	
	// 차량 정보
	public List<Car_Res_Info> getCarResInfo(){
		List<Car_Res_Info> mlist = new ArrayList<>();
		String sql = "SELECT\r\n"
				+ "LEVEL, cri.*\r\n"
				+ "FROM CAR_REGIST_INFO cri\r\n"
				+ "START WITH refno = 0\r\n"
				+ "CONNECT BY PRIOR CRI_NO = REFNO";
		try {
			conn = DB.con();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				mlist.add(new Car_Res_Info(
						rs.getInt("LEVEL"),
	                    rs.getInt("CRI_NO"),
	                    rs.getString("NAME"),
	                    rs.getInt("REFNO")
	            ));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB.close(rs, pstmt, conn);
		}
		return mlist;
	}
	
	// 차량 옵션
	public List<Car_Option> getOptionInfo(){
		List<Car_Option> olist = new ArrayList<>();
		String sql = "SELECT * FROM OPTION_INFO";
		try {
			conn = DB.con();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				olist.add(new Car_Option(
						rs.getString("OPID"),
						rs.getString("OPNAME")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB.close(rs, pstmt, conn);
		}
		return olist;
	}
	
	// 검색 필터별 차량 검색
	public List<OkayCar_Res> searchCar(Map<String, String> sch) {
		  List<OkayCar_Res> olist = new ArrayList<>();
		  String sql = "SELECT *\r\n"
		      + "FROM OKAY_CAR_REGISTER ocr, CAR_IMG ci\r\n"
		      + "WHERE 1=1";
		  List<Object> params = new ArrayList<>(); // 동적으로 파라미터 값들을 추가하기 위한 리스트

		  if (sch.get("manu") != null) {
		    sql += " AND ocr.MANUFACTOR IN (?)";
		    params.add(sch.get("manu"));
		  }
		  if (sch.get("model") != null) {
		    sql += " AND ocr.MODEL IN (?)";
		    params.add(sch.get("model"));
		  }
		  if (sch.get("volume") != null) {
		    sql += " AND ocr.VOLUME IN (?)";
		    params.add(sch.get("volume"));
		  }
		  sql += " AND ocr.PRICE >= ?";
		  params.add(Integer.parseInt(sch.get("price")));
		  sql += " AND ocr.ACCIDENT_CNT >= ?";
		  params.add(Integer.parseInt(sch.get("acc")));
		  sql += " AND ocr.DRIVE_DIST >= ?";
		  params.add(Integer.parseInt(sch.get("dist")));
		  sql += " AND ocr.model = ci.model";
		  try {
		    conn = DB.con();
		    pstmt = conn.prepareStatement(sql);
		    // 동적으로 생성된 파라미터 값을 설정
		    for (int i = 0; i < params.size(); i++) {
		      pstmt.setObject(i + 1, params.get(i));
		    }
		    rs = pstmt.executeQuery();
		    while (rs.next()) {
		      olist.add(new OkayCar_Res(
		          rs.getString("Car_num"),
		          rs.getString("manufactor"),
		          rs.getString("model"),
		          rs.getString("volume"),
		          rs.getInt("price"),
		          rs.getInt("accident_cnt"),
		          rs.getInt("drive_dist"),
		          rs.getDate("regist_time"),
		          rs.getString("sell_or_not"),
		          rs.getString("img_src")
		      ));
		    }
		  } catch (SQLException e) {
		    System.out.println("DB에러: " + e.getMessage());
		  } catch (Exception e) {
		    System.out.println("기타예외: " + e.getMessage());
		  } finally {
		    DB.close(rs, pstmt, conn);
		  }
		  return olist;
		}

	// 키워드로 차량 검색
	public List<OkayCar_Res> searchKeyword(String sch){
		List<OkayCar_Res> olist = new ArrayList<>();
		String sql = "SELECT * FROM OKAY_CAR_REGISTER ocr, CAR_IMG ci\r\n"
				+ "WHERE ocr.MANUFACTOR||ocr.MODEL||ocr.VOLUME LIKE ?\r\n"
				+ "AND ocr.MODEL = ci.MODEL";
		try {
			conn = DB.con();
			pstmt = conn.prepareStatement(sql); 
	        pstmt.setString(1, "%" + sch + "%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				olist.add(new OkayCar_Res(
						rs.getString("car_num"),
						rs.getString("manufactor"),
						rs.getString("model"),
						rs.getString("volume"),
						rs.getInt("price"),
						rs.getInt("accident_cnt"),
						rs.getInt("drive_dist"),
						rs.getDate("regist_time"),
						rs.getString("sell_or_not"),
						rs.getString("img_src")
						));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(SQLException e) {
			System.out.println("DB에러: " + e.getMessage());
		}catch(Exception e) {
			System.out.println("기타예외: " + e.getMessage());
		}finally {
			DB.close(rs, pstmt, conn);
		}
		return olist;
	}
	
	// 판매 여부 업데이트
	 public int updateSellOrNot(String car_num) {
	        int isUpdate = 0;
	        String sql ="UPDATE OKAY_CAR_REGISTER SET SELL_OR_NOT = 'Y' WHERE CAR_NUM = ?";
	        try {
	            conn = DB.con();
	            conn.setAutoCommit(false);
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, car_num);
	            isUpdate = pstmt.executeUpdate();
	            if (isUpdate == 1) {
	                conn.commit();
	                System.out.println("수정 성공");
	            }
	        } catch (SQLException e) {
	            System.out.println("DB 오류: " + e.getMessage());
	            DB.rollback(conn);
	        } catch (Exception e) {
	            System.out.println("일반 오류: " + e.getMessage());
	        } finally {
	            DB.close(rs, pstmt, conn);
	        }
	        return isUpdate;
	    }
	 public List<SchCar> getSchCarList() {
		    List<SchCar> clist = new ArrayList<>();
		    String sql = "SELECT * FROM schcar\r\n"
		    		+ "order by carname";
		    try {
		        conn = DB.con();
		        pstmt = conn.prepareStatement(sql); 
		        rs = pstmt.executeQuery();
		
		        while (rs.next()) {
		        	clist.add(new SchCar(
		                    rs.getString("carname"),
		                    rs.getInt("price")
		            ));
		        }
		    } catch (SQLException e) {
		        System.out.println("DB 관련 오류: " + e.getMessage());
		    } catch (Exception e) {
		        System.out.println("일반 오류: " + e.getMessage());
		    } finally {
		        DB.close(rs, pstmt, conn);
		    }
		    return clist;
		}
	
	public static void main(String[] args) {
		DAO dao = new DAO();
		List<Car_Res_Info> infolist = dao.getCarResInfo();
		for(Car_Res_Info cri:infolist) {
			if(cri.getLevel()==1) {
				System.out.print(cri.getLevel()+"\t");
				System.out.println(cri.getName());
			}
		}
		
		Map<String, String> sch = new HashMap<>();
		sch.put("manu", "현대");
		sch.put("model", "쏘나타");
		sch.put("volume", "2.0 가솔린");
		sch.put("price", "0");
		sch.put("acc", "0");
		sch.put("dist", "0");
		for (OkayCar_Res ok : dao.searchCar(sch)) {
			System.out.print(ok.getCar_num() + "\t");
          	System.out.print(ok.getModel() + "\n");
		}
	
		
//		List<OkayCar_Res> clist = dao.searchCar("'기아'", "'K5'", "'2.0 가솔린'", 0, 0, 0);
//		System.out.println(clist.size());
//		for(OkayCar_Res ocr:clist) {
//			System.out.print(ocr.getCar_num()+"\t");
//			System.out.println(ocr.getModel());
//		}
	}
}
