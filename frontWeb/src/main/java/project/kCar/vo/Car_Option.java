package project.kCar.vo;

public class Car_Option {
	private String opId;
	private String opName;
	
	public Car_Option() {}
	
	public Car_Option(String opId, String opName) {
		this.opId = opId;
		this.opName = opName;
	}
	public String getOpId() {
		return opId;
	}
	public void setOpId(String opId) {
		this.opId = opId;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}

	
}
