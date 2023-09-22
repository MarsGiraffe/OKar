package project.kCar.vo;
/*
 CAR_NUM VARCHAR2(10) PRIMARY KEY, -- 차량번호 중복불가
   MANUFACTOR VARCHAR2(50) NOT NULL,
   MODEL VARCHAR2(50) NOT NULL,
   VOLUME VARCHAR2(50) NOT NULL,
   PRICE NUMBER NOT NULL,
   ACCIDENT_CNT NUMBER NOT NULL,
   DRIVE_DIST NUMBER(6) NOT NULL,
   REGIST_TIME DATE NOT NULL, -- 등록시간을 기준으로 정렬가능
   SELL_OR_NOT VARCHAR2(1) NOT NULL,
 
 */

import java.util.Date;

public class OkayCar_Res {
	
	// 필드 선언
	private String car_num;	// 차량번호
	private String manufactor;	// 제조사
	private String model;	// 모델명
	private String volume;	// 배기량
	private int price;	// 가격
	private int accident_cnt;	// 사고횟수
	private int drive_dist;	// 주행거리
	private Date regist_time;	// 차량등록일자
	private String sell_or_not;	// 판매여부
	private String img_src;		// 차량 이미지 경로
	
	// 고정값
	public static final int manage_cost = 297000; // 차량 관리비 (고정)
	public static final int agency_fee = 33000;	// 대행 수수료 (고정)
	
	// 생성자 선언
	public OkayCar_Res() {}
	
	
	
	public OkayCar_Res(String manufactor, String model, String volume, int price, int accident_cnt, int drive_dist,
			Date regist_time, String sell_or_not) {
		this.manufactor = manufactor;
		this.model = model;
		this.volume = volume;
		this.price = price;
		this.accident_cnt = accident_cnt;
		this.drive_dist = drive_dist;
		this.regist_time = regist_time;
		this.sell_or_not = sell_or_not;
	}



	public OkayCar_Res(String car_num, String manufactor, String model, String volume, int price, int accident_cnt,
			int drive_dist, Date regist_time, String sell_or_not, String img_src) {
		this.car_num = car_num;
		this.manufactor = manufactor;
		this.model = model;
		this.volume = volume;
		this.price = price;
		this.accident_cnt = accident_cnt;
		this.drive_dist = drive_dist;
		this.regist_time = regist_time;
		this.sell_or_not = sell_or_not;
		this.img_src = img_src;
	}
	
	public OkayCar_Res(String car_num, String manufactor, String model, String volume, int price, int accident_cnt,
			int drive_dist, Date regist_time, String sell_or_not) {
		this.car_num = car_num;
		this.manufactor = manufactor;
		this.model = model;
		this.volume = volume;
		this.price = price;
		this.accident_cnt = accident_cnt;
		this.drive_dist = drive_dist;
		this.regist_time = regist_time;
		this.sell_or_not = sell_or_not;
	}

	// getter, setter
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public String getManufactor() {
		return manufactor;
	}
	public void setManufactor(String manufactor) {
		this.manufactor = manufactor;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAccident_cnt() {
		return accident_cnt;
	}
	public void setAccident_cnt(int accident_cnt) {
		this.accident_cnt = accident_cnt;
	}
	public int getDrive_dist() {
		return drive_dist;
	}
	public void setDrive_dist(int drive_dist) {
		this.drive_dist = drive_dist;
	}
	public Date getRegist_time() {
		return regist_time;
	}
	public void setRegist_time(Date regist_time) {
		this.regist_time = regist_time;
	}
	public String getSell_or_not() {
		return sell_or_not;
	}
	public void setSell_or_not(String sell_or_not) {
		this.sell_or_not = sell_or_not;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	
}
