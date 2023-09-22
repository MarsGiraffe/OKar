package project.kCar.vo;

public class Okay_CR {
	private String manufactor;
	private String model;
	private String volume;
	private String carNum;
	private int price;
	private int accidentCnt;
	private int driveDist;
	private String isPass;
	private String diag;
	
	public Okay_CR() {
		// TODO Auto-generated constructor stub
	}
	// 차량 평가 정보(insert CarEstimation)
	public Okay_CR(String carNum, int accidentCnt, String isPass, String diag) {
		this.carNum = carNum;
		this.accidentCnt = accidentCnt;
		this.isPass = isPass;
		this.diag = diag;
	}
	// 차량 정보 등록(insert CarInfo)
	public Okay_CR(String manufactor, String model, String volume, String carNum, int price, int accidentCnt,
			int driveDist) {
		this.manufactor = manufactor;
		this.model = model;
		this.volume = volume;
		this.carNum = carNum;
		this.price = price;
		this.accidentCnt = accidentCnt;
		this.driveDist = driveDist;
	}
	



	public String getIsPass() {
		return isPass;
	}
	public void setIsPass(String isPass) {
		this.isPass = isPass;
	}

	public String getDiag() {
		return diag;
	}

	public void setDiag(String diag) {
		this.diag = diag;
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
	public String getCarNum() {
		return carNum;
	}
	public void setCarNum(String carNum) {
		this.carNum = carNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAccidentCnt() {
		return accidentCnt;
	}
	public void setAccidentCnt(int accidentCnt) {
		this.accidentCnt = accidentCnt;
	}
	public int getDriveDist() {
		return driveDist;
	}
	public void setDriveDist(int driveDist) {
		this.driveDist = driveDist;
	}
	
	
}
