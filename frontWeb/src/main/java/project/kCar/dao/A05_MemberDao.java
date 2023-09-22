package project.kCar.dao;
// kcar_dao.A05_MemberDao
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project.kCar.DB;
import project.kCar.vo.SchCar;
import project.kCar.vo.SellCarInfo;


// 
public class A05_MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static A05_MemberDao instance;
    
    // 싱글톤 패턴
    private A05_MemberDao(){}
    public static A05_MemberDao getInstance(){
        if(instance==null)
            instance=new A05_MemberDao();
        return instance;
    }
    public String stringPhone(SellCarInfo info)
    {
        String p1 = info.getPhone1();
        String p2 = info.getPhone2();
        String p3 = info.getPhone3();
        
        String phonenum = String.valueOf(p1+"-"+p2+"-"+p3);
        
        return phonenum;
        
    } // end stringToDate()
	
	public void insertSellCarInfo(SellCarInfo ins) {
		int isInsert = 0;
		String sql = "INSERT INTO sellInfo values(?,?,?,\r\n"
				+ "?,?,?,?,?)";
		try {
			con = DB.con();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, ins.getCarnum());
			pstmt.setString(2, ins.getCarname());
			pstmt.setInt(3, ins.getMileage());
			pstmt.setString(4, ins.getMname());
			pstmt.setString(5, ins.getPhone1()+"-"+ins.getPhone2()+"-"+ins.getPhone3());
			pstmt.setString(6, ins.getH_area1()+""+ins.getH_area2());
			pstmt.setString(7, ins.getSelldate());
			pstmt.setInt(8, ins.getPass());
			isInsert=pstmt.executeUpdate();
			if(isInsert==1) {
				con.commit();
				System.out.println("자동차 판매 등록 성공!!");
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
//	public List<SchCar> clist() {
//		List<SchCar> clist = new ArrayList<SchCar>();
//		String sql = "SELECT carname, price\r\n"
//				+ "from(\r\n"
//				+ "	SELECT carname,\r\n"
//				+ "			price\r\n"
//				+ "	FROM schcar\r\n"
//				+ "	order by carname ASC\r\n"
//				+ ")\r\n"
//				+ "WHERE rownum <= 3";
//		//1. 연결(기본예외/자원해제)
//		try {
//			con = DB.con();
//			// 2. 대화(sql 전달 후, 매개변수로 전달)
//			pstmt = con.prepareStatement(sql);
//			// 3. 결과
//			rs = pstmt.executeQuery();
//			// 4. (ResultSet ==> VO) ? 단일/여러개 if/while
//			// Member(String id, String pass, String name, int point, String auth, Date regdate)
//			while(rs.next()) {
//				clist.add(new SchCar(
//					rs.getString("carname"),
//					rs.getInt("price")
//				));
//			}
//			// 
//		} catch (SQLException e) {
//			System.out.println("DB:"+e.getMessage());
//		}catch(Exception e) {
//			System.out.println("기타:"+e.getMessage());
//		}finally {
//			DB.close(rs, pstmt, con);
//		}
//		return clist;
//	}
	
	
	// 메인 등록된 차량 리스트
	public List<SchCar> getSchCarList() {
	    List<SchCar> clist = new ArrayList<>();
	    String sql = "SELECT * FROM schcar\r\n"
	    		+ "order by carname";
	    try {
	        con = DB.con();
	        pstmt = con.prepareStatement(sql); 
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
	        DB.close(rs, pstmt, con);
	    }
	    return clist;
	}

}
