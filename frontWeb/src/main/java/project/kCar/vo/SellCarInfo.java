package project.kCar.vo;
//z01_vo.SellCarInfo
public class SellCarInfo {
	private String carnum;
	private String carname;
	private int mileage; 
	private String mname;
	private String phone1;
	private String phone2;
	private String phone3;
	private String h_area1;
	private String h_area2;
	private String selldate;
	private int pass;
	public SellCarInfo() {
		// TODO Auto-generated constructor stub
	}
	public SellCarInfo(String carnum, String carname, int mileage, String mname, String phone1, String phone2,
			String phone3, String h_area1, String h_area2, String selldate, int pass) {
		super();
		this.carnum = carnum;
		this.carname = carname;
		this.mileage = mileage;
		this.mname = mname;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.h_area1 = h_area1;
		this.h_area2 = h_area2;
		this.selldate = selldate;
		this.pass = pass;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getH_area1() {
		return h_area1;
	}
	public void setH_area1(String h_area1) {
		this.h_area1 = h_area1;
	}
	public String getH_area2() {
		return h_area2;
	}
	public void setH_area2(String h_area2) {
		this.h_area2 = h_area2;
	}
	public String getSelldate() {
		return selldate;
	}
	public void setSelldate(String selldate) {
		this.selldate = selldate;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	
}