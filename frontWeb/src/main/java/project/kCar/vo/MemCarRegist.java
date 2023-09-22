package project.kCar.vo;

import java.util.Date;

public class MemCarRegist {
	private String regist_id;
	private String mem_id;
	private String car_num;
	private String model;
	private int drive_dist;
	private String address;
	private Date want_time;
	private Date reg_time;
	private String eval;
	private String isPass;
	private int accident_cnt;
	private String diag;
	private String isReg;
	
	public MemCarRegist() {
		// TODO Auto-generated constructor stub
	}
	// 평가완료 정보(getMemCarEstedInfo)
	public MemCarRegist(String regist_id, String mem_id, String car_num, String model, int drive_dist, String address,
			Date want_time, Date reg_time, String eval, String isPass, int accident_cnt, String diag, String isReg) {
		this.regist_id = regist_id;
		this.mem_id = mem_id;
		this.car_num = car_num;
		this.model = model;
		this.drive_dist = drive_dist;
		this.address = address;
		this.want_time = want_time;
		this.reg_time = reg_time;
		this.eval = eval;
		this.isPass = isPass;
		this.accident_cnt = accident_cnt;
		this.diag = diag;
		this.isReg = isReg;
	}
	// 평가 이전 등록정보(차량평가 요청 리스트)
	public MemCarRegist(String regist_id, String mem_id, String car_num, String model, int drive_dist, String address,
			Date want_time, Date reg_time, String eval) {
		this.regist_id = regist_id;
		this.mem_id = mem_id;
		this.car_num = car_num;
		this.model = model;
		this.drive_dist = drive_dist;
		this.address = address;
		this.want_time = want_time;
		this.reg_time = reg_time;
		this.eval = eval;
	}
	
	
	public String getIsReg() {
		return isReg;
	}
	public void setIsReg(String isReg) {
		this.isReg = isReg;
	}
	public String getIsPass() {
		return isPass;
	}

	public void setIsPass(String isPass) {
		this.isPass = isPass;
	}

	public int getAccident_cnt() {
		return accident_cnt;
	}

	public void setAccident_cnt(int accident_cnt) {
		this.accident_cnt = accident_cnt;
	}

	public String getDiag() {
		return diag;
	}

	public void setDiag(String diag) {
		this.diag = diag;
	}

	public String getRegist_id() {
		return regist_id;
	}
	public void setRegist_id(String regist_id) {
		this.regist_id = regist_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getDrive_dist() {
		return drive_dist;
	}
	public void setDrive_dist(int drive_dist) {
		this.drive_dist = drive_dist;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getWant_time() {
		return want_time;
	}
	public void setWant_time(Date want_time) {
		this.want_time = want_time;
	}
	public Date getReg_time() {
		return reg_time;
	}
	public void setReg_time(Date reg_time) {
		this.reg_time = reg_time;
	}
	public String getEval() {
		return eval;
	}
	public void setEval(String eval) {
		this.eval = eval;
	}
	
}
