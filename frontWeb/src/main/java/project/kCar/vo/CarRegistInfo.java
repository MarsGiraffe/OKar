package project.kCar.vo;

public class CarRegistInfo {
	private int cri_no;
	private String name;
	private int refno;
	
	public CarRegistInfo() {
		// TODO Auto-generated constructor stub
	}

	public CarRegistInfo(int cri_no, String name, int refno) {
		this.cri_no = cri_no;
		this.name = name;
		this.refno = refno;
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
