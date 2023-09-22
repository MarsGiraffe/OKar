package project.kCar.vo;

public class MemInfo {
	private String mem_id;
	private String mem_pass;
	private String license_id;
	private String mname;
	private String email;
	private String phone;
	private String auth;
	public MemInfo() {
		// TODO Auto-generated constructor stub
	}
	public MemInfo(String mem_id, String mem_pass, String license_id, String mname, String email, String phone,
			String auth) {
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.license_id = license_id;
		this.mname = mname;
		this.email = email;
		this.phone = phone;
		this.auth = auth;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getLicense_id() {
		return license_id;
	}
	public void setLicense_id(String license_id) {
		this.license_id = license_id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	
	
}
