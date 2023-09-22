package project.kCar.vo;

public class Car_Res_Info {

	private int level;
	private int cri_no;
	private String name;
	private int refno;
	
	public Car_Res_Info() {}

	public Car_Res_Info(int level, int cri_no, String name, int refno) {
		this.level = level;
		this.cri_no = cri_no;
		this.name = name;
		this.refno = refno;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCri_no() {
		return cri_no;
	}

	public void setCri_no(int cri_no) {
		this.cri_no = cri_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRefno() {
		return refno;
	}

	public void setRefno(int refno) {
		this.refno = refno;
	}

	
}