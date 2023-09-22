package project.kCar.vo;

public class Car_Img {
	
	// 필드 선언
	private String model;
	private String img_src;
	
	// 생성자 선언
	public Car_Img() {}
	
	public Car_Img(String model, String img_src) {
		this.model = model;
		this.img_src = img_src;
	}

	// getter, setter
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
}
