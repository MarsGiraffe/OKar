package project.kCar.vo;
// z01_vo.SchCar
public class SchCar {
	private String carname;
	private int price;
	private String keyword;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public SchCar(String carname, int price, String keyword) {
		super();
		this.carname = carname;
		this.price = price;
		this.keyword = keyword;
	}
	public SchCar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SchCar(String carname, int price) {
		super();
		this.carname = carname;
		this.price = price;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

}
